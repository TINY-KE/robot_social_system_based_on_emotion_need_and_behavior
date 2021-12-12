//
// Created by zhjd on 2021/5/11.
//
//ros头文件
#include <ros/ros.h>
#include "std_msgs/String.h"
#include <sstream>
#include <perception.h>
#include "social_msg/perception_msg.h"
#include "social_msg/need_msg.h"
#include "social_msg/robot_emotion.h"
#include "social_msg/robot_status.h"
#include "social_msg/need_compare.h"
#include "dynamic_reconfigure/server.h" 
// #include "social_msg/DynamicParamConfig.h" 
//内部头文件
#include "Adaptive.h"
#include "perception.h"
#include "prior_need.h"
#include "perception_filter.h"

using namespace  std;
// time_t inner_need::time_for_wandor  =  0;
perception_filter *Filter = new perception_filter(120);

// ros node
ros::Subscriber sub_perception;
ros::Subscriber sub_robot_emotion;
ros::Subscriber sub_robot_status;
ros::Subscriber sub_needCompare;
ros::Publisher pub;
//运算符
void operator >> (const social_msg::need_msg& msg, need_wu & need) {
    need.need_name = msg.need_name;
    need.IDtype = msg.IDtype;
    need.weight = msg.weight;
}
// 需求模型
prior_need PriorNeed;
void run_PriorNeed(){
    cout<< "Wait to run PriorNeed !!\n";
    int i=1 ;
    while(1){
        if(PriorNeed.updateInit())
        {
            printf( GREEN "Run %dth PriorNeed（运行先验模型） !!\n"NONE, i);            
            vector<need> need_lists = PriorNeed.need_compute_all();
            for(int i =0 ; i< need_lists.size(); i++){
                social_msg::need_msg need_output;
                need_output.IDtype = need_lists[i].IDtype;
                need_output.rob_emotion = "";//need_lists[i].rob_emotion;
                need_output.person_emotion = need_lists[i].person_emotion;//need_lists[i].person_emotion
                need_output.need_name = need_lists[i].need_name;  
                need_output.weight = need_lists[i].weight;
                need_output.speech = need_lists[i].speech;
                need_output.person_name =  need_lists[i].person_name;
                pub.publish(need_output);
            }
            sleep(10); i++;
        }
    }
    cout<< "End PriorNeed !!\n";
}
// 自适应模型 和 Monitor 
monitor Monitor;
Adaptive adaptiveModel(  &Monitor  );
void run_adaptive(){
    cout<< "Wait to run Adaptve Model!!\n";
    
    while(1){
        need_wu need_win_wu, need_lose_wu;
        if(adaptiveModel.wuReturn_flag){
            adaptiveModel.returnWuResult (need_win_wu, need_lose_wu);
            
            if( NeedTypeCheck(need_win_wu.need_name) == TaskNeed )                    
                PriorNeed.task_wu(need_win_wu);
            else if( NeedTypeCheck(need_win_wu.need_name) == InnerNeed )       
                PriorNeed.inner_wu(need_win_wu);

            if( NeedTypeCheck(need_lose_wu.need_name) == TaskNeed)                    
                PriorNeed.task_wu(need_lose_wu);
            else if( NeedTypeCheck(need_lose_wu.need_name) == InnerNeed )       
                PriorNeed.inner_wu(need_lose_wu);
        
        }
        
    }
    cout<< "End Adaptve Model !!\n";
}



// 需求模型
void PerceptionUpdate(const social_msg::perception_msg& msg){
    
    perception per;
    per.p_ = msg.p;
    per.person_name_ = msg.person_name;
    per.IDtype_ = msg.IDtype;
    per.intention_ = msg.intention;
    per.speech_ = msg.speech;
    per.person_emotion_ = msg.person_emotion;
    
    if( Filter->Whether_OK(per) )
        PriorNeed.PerceptionUpdate(per);
    Monitor.emotionUpdate(per);
    
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
    adaptiveModel.RobotEmotionUpdate(emotion);
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
void AdaptiveUpdate(const social_msg::need_compare& msg){
    need_wu need_win , need_lose ;
    msg.need_win    >>    need_win;
    msg.need_lose   >>    need_lose;
    int relation = msg.relation;
    adaptiveModel.Update(need_win , need_lose , relation);
}
int main(int argc, char** argv){
    // 为需求模型的运行  创建单独的线程 。  
    std::thread PriorNeedThread(run_PriorNeed);
    if(0)
        std::thread adaptiveThread(run_adaptive);
    // ROS
    ros::init(argc, argv, "social_msg");
    ros::NodeHandle n;
    cout<< "Start to Subscribe（接收ROS信息） !!\n";
    //状态更新
    sub_perception = n.subscribe("perceptions", 10, PerceptionUpdate);
    sub_robot_emotion = n.subscribe("robot_emotion", 10, RobotEmotionUpdate);
    sub_robot_status = n.subscribe("robot_status", 10, RobotStatusUpdate);
    // 自适应模型
    sub_needCompare = n.subscribe("needCompare", 10, AdaptiveUpdate);
    // 需求发布
    pub = n.advertise<social_msg::need_msg>("need_lists", 10);  
    
    ros::spin();    //库是节点读取数据道消息响应循环，当消息到达的时候，回调函数就会被调用。当按下Ctrl+C时，节点会退出消息循环，于是循环结束。
    return 0;
}
