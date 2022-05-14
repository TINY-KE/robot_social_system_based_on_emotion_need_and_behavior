//
// Created by zhjd on 2021/5/11.
//
//ros头文件
#include <ros/ros.h>
#include "std_msgs/String.h"
#include <sstream>
#include "social_msg/perception_msg.h"
#include "social_msg/need_msg.h"
#include "social_msg/robot_emotion.h"
#include "social_msg/robot_status.h"
#include "dynamic_reconfigure/server.h" 
#include "need_satisfied.h"
//内部头文件
#include "prior_need.h"
#include "perception_filter.h"

using namespace  std;
// time_t inner_need::time_for_wandor  =  0;
perception_filter *Filter = new perception_filter(20);   //TODO: 确定合适的per过滤时长阈值。

// ros node
ros::Subscriber sub_perception;
ros::Subscriber sub_robot_emotion;
ros::Subscriber sub_robot_status;
ros::Subscriber sub_behavior_Reply;
ros::Subscriber sub_needCompare;
ros::Publisher pub;

//全局变量：
int period_cur = 0;   //每个period的周期时长，由 sleep函数 决定。
//运算符
void operator >> (const social_msg::need_msg& msg, need_wu & need) {
    need.need_name = msg.need_name;
    need.IDtype = msg.IDtype;
    need.weight = msg.weight;
}
// 需求模型
prior_need PriorNeed;
void run_PriorNeed();
// 需求满足节点
NeedSatisfied need_satisfied;

// 回调函数
void PerceptionUpdate(const social_msg::perception_msg& msg){
    
    perception per;
    per.intention_ = msg.intention;
    per.p_ = msg.p;
    per.intention_2_ = msg.intention_2;
    if(  msg.intention_2 == ""    || msg.p_2 == 0  || msg.p_2 == NULL ){
        per.p_2_ = 0;
    }
    else{
        per.p_2_ = msg.p_2;
    }
    per.person_name_ = msg.person_name;
    per.IDtype_ = msg.IDtype;
    
    per.speech_ = msg.speech;
    per.person_emotion_ = msg.person_emotion;
    
    if( Filter->Whether_OK(per) )    //如果，“感知过滤器”认为当前感知是有效的，则update
        PriorNeed.PerceptionUpdate(per);
    // Monitor.emotionUpdate(per);  
    
    // 【暂时】需求满足节点，生成need_satisfied
    need_satisfied.perception_to_needSatisfied( per );
}

void RobotEmotionUpdate(const social_msg::robot_emotion& msg){
    
    double emotion[8];
    emotion[0] = msg.emotion1;
    emotion[1] = msg.emotion2;
    emotion[2] = msg.emotion3;
    emotion[3] = msg.emotion4;
    emotion[4] = msg.emotion5;
    emotion[5] = msg.emotion6;
    emotion[6] = msg.emotion7;
    emotion[7] = msg.emotion8;
    PriorNeed.RobotEmotionUpdate(emotion);  
    // adaptiveModel.RobotEmotionUpdate(emotion);
}

void RobotStatusUpdate(const social_msg::robot_status& msg){
    
    double status[8] ;
    status[0] = msg.body1;
    status[1] = msg.body2;
    status[2] = msg.body3;
    status[3] = msg.body4;
    status[4] = msg.body5;
    status[5] = msg.body6;
    status[6] = msg.body7;
    status[7] = msg.idleState;  
    PriorNeed.RobotStatusUpdate(status);
}

void BehaviorReplyUpdate(const social_msg::bhvReply& msg){
    need_satisfied.behaviorProcess_to_needSatisfied(   msg );
}

int main(int argc, char** argv){
    // ROS
    ros::init(argc, argv, "need_module");
    ros::NodeHandle n;
    need_satisfied.set_ros_node(n);
    cout<< "Start to Subscribe（接收ROS信息） !!\n";
    
    //状态更新
    sub_perception = n.subscribe("perceptions", 1000, PerceptionUpdate);
    sub_robot_emotion = n.subscribe("robot_emotion", 1000, RobotEmotionUpdate);
    sub_robot_status = n.subscribe("robot_status", 1000, RobotStatusUpdate);
    sub_behavior_Reply = n.subscribe("behavior_Reply", 1000, BehaviorReplyUpdate);  //social_msg::bhvReply
    
    ros::spinOnce();
    
    // 需求发布
    pub = n.advertise<social_msg::need_msg>("need_lists", 10);  
    // ros::Rate loop_rate(0.1);  //5s一次
    ros::Rate loop_rate(0.6);  //5s一次
    // 为需求模型的运行  创建单独的线程 。  
    // std::thread PriorNeedThread(run_PriorNeed);
    cout<< "Wait to run PriorNeed !!\n";
    while(ros::ok){
        if( ros::isShuttingDown() )
            break;
        run_PriorNeed();
        ros::spinOnce();
        loop_rate.sleep();
    }
    
    // ros::spin();    //库是节点读取数据道消息响应循环，当消息到达的时候，回调函数就会被调用。当按下Ctrl+C时，节点会退出消息循环，于是循环结束。
    return 0;
}

int qt_order_debug = 0;
void run_PriorNeed(){
    // while(1)
    {
        if(PriorNeed.updateInit())
        {
            printf( GREEN "Run %dth PriorNeed（运行先验模型） !!\n"NONE, period_cur);            
            vector<need> need_lists = PriorNeed.need_compute_all();
            if( need_lists.size() != 0 )
                for(int j =0 ; j< need_lists.size(); j++){
                    // 添加到需求满足节点中
                    need_satisfied.insert_need_list(need_lists[j]);
                    
                    // 将need发布出去
                    social_msg::need_msg need_output;
                    need_output.IDtype = need_lists[j].IDtype;
                    need_output.rob_emotion = need_lists[j].robot_emotion_str;//TODO: need_lists[i].rob_emotion;
                    need_output.person_emotion = need_lists[j].person_emotion;//need_lists[i].person_emotion
                    need_output.need_name = need_lists[j].need_name;  
                    need_output.weight = need_lists[j].weight;
                    need_output.speech = need_lists[j].speech;
                    need_output.person_name =  need_lists[j].person_name;
                    need_output.qt_order = period_cur;
                    need_output.satisfy_value = need_lists[j].satisfy_value;
                    pub.publish(need_output);
                    // printf( GREEN "    QT_order: %d:\n"NONE, need_output.qt_order); 
                    // sleep(0.1); // TODO: 重要。
                }
            else{  //此部分用途：用于刷新qt中need list。如果本周期，没有新的need发送过，那么qt中的need list还是会显示之前的need，就可能会对中期测试中本没有need生成的情况  造成误解。
                    // social_msg::need_msg need_output;
                    // need_output.IDtype = "";
                    // need_output.rob_emotion = "";//TODO: need_lists[i].rob_emotion;
                    // need_output.person_emotion = "";//need_lists[i].person_emotion
                    // need_output.need_name = "";  
                    // need_output.weight = 0;
                    // need_output.speech = "";
                    // need_output.person_name =  "";
                    // need_output.qt_order = period_cur;
                    // need_output.satisfy_value = 0;
                    // pub.publish(need_output);
            }
            period_cur++;     
        }
    }
    // cout<< "End PriorNeed !!\n";
}


