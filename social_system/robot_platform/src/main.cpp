/*
 * @Descripttion: 
 * @version: 
 * @Author: sueRimn
 * @Date: 2021-12-18 20:20:34
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-25 17:00:16
 */
/* 
4）行为的发布：
a.以1为一个扫描周期。
b.六个线程，存入 一个周期检测函数和五个执行器的类函数。以下为思路及类的定义方法
c.周期检测函数，有一个全局的int period。和period_all（共有几个扫描周期）。
    a)在判断当前周期接受后，period+1 。
    b)并将period更新到各个类中。
    c)Ros发布reply = period/period_all。当period = period_all时，行为结束
    d)如何判断当前period结束：各执行器类中的flag为1。(period +1后，各类中的)
    e)思考：对于音响、轮子而言是，只要flag赋值1后，之后个各个周期都是等于1.  **
    f)等之后，每个周期内都
d.类函数中，根据当前的period和此执行器的起始周期数（start time和end time）。如果不在起始周期数内，则flag置为1. 进入起始周期数后，flag先置为0（注意：音响、轮子例外）。 然后运行以下的逻辑：
    a)摄像头：在每一个扫描周期内，一直对准target即可。因此只要摄像头中有交互对象，flag就置为1.
    b)屏幕：在每一个扫描周期内，播放对应的心情。因此flag永远为1.
    c)音响：进入start周期次数后，开始播放文字的音频。一般情况下，flag不先置为。只有进入end周期次数时，flag先置为0 。等音频播放完毕，flag置为1 。
    d)手：按照规定摆动。因此flag永远为1.
    e)轮子：进入start周期次数后，开始靠近或远离用户。一般情况下，flag不先置为。只有进入end周期次数时，flag先置为0 。轮子目标成功后，flag置为1.【因此如果想让机器人先到人身边，在说话，就得让 轮子的end time早于音响的start time】
e.以上的类函数中，给机器人的无线控制命令  在一个周期内，是频繁发送的。从而保证了摄像头在追踪到了一次目标之后，还会继续追踪目标。

如果如果 某一个肢体目标 在endtime 没有执行成功。 则继续发布 当前的period_cur。
 a)摄像头：
b)屏幕：
c)音响：
d)手：按照规定摆动。因此flag永远为1.
e)轮子：进入start周期次数后，开始靠近或远离用户。一般情况下，flag不先置为。只有进入end周期次数时，flag先置为0 。轮子目标成功后，flag置为1.【因此如果想让机器人先到人身边，在说话，就得让 轮子的end time早于音响的start time】

 */

//ros头文件
#include <ros/ros.h>
#include "std_msgs/String.h"
#include <string>

#include "common_include.h"

// #include "periodDetection.h"

using namespace  std;

  

// ros node
ros::Subscriber sub_behavior;

// TODO: 无线通讯通道



// 全局变量
string behavior_name;
// bool insert_new_behavior;
bool first_behavior = true;
// private:
bool behavior_cur_exist = false;
bool insert_new_behavihor = false;
social_msg::bhvPara behavior;
double single_period_time;
bool flag;




ros::Publisher pub_reply;

int behavior_type_1;
int behavior_type_10;
int behavior_type_100;
// int startTime；
// int endTime;
string none_check( string s){
    string block = "none";;
    if( s == "")
        return block;
    else
        return s;
}
bool compare( double delay_ , double thresh){
        if(delay_ > thresh )  
            return true;
        else 
            return  false; 
}

void flag_set( bool flag_new,  bool& flag_){
    if(flag_ == 1 || flag_new == 1) 
        flag_ = 1;
}

void publish( int period_ ){
    string  gaze_target = "none", screen_type = "none", 
            sounder_tone = "none", sounder_rate = "none", sounder_content = "none", 
            arm_aciton = "none", arm_rate = "none", 
            leg_target = "none", leg_aciton = "none", leg_rate = "none", leg_distance = "none";

    if(  (period_ >= behavior.gaze.startTime)  &&   (period_ <= behavior.gaze.endTime) ){
            gaze_target = none_check(behavior.gaze.target);
        }

// publish_screen
    if(  (period_ >= behavior.emotion.startTime)  &&   (period_ <= behavior.emotion.endTime) ){
            screen_type = none_check(behavior.emotion.type);
        }
// publish_sounder
    if(  (period_ >= behavior.speech.startTime)  &&   (period_ <= behavior.speech.endTime) ){
            sounder_tone = none_check(to_string(behavior.speech.tone)); 
            sounder_rate = none_check(to_string(behavior.speech.rate));
            sounder_content = none_check(behavior.speech.content);
        }

// publish_arm
    if(  (period_ >= behavior.arms.startTime)  &&   (period_ <= behavior.arms.endTime) ){
            arm_aciton = none_check(behavior.arms.action);
            arm_rate = none_check(to_string(behavior.arms.rate));
        }
// publish_leg( period_ );
    if(  (period_ >= behavior.legs.startTime)  &&   (period_ <= behavior.legs.endTime) ){
            leg_target = none_check(behavior.legs.target);
            leg_aciton = none_check(behavior.legs.action);
            leg_rate = none_check(to_string(behavior.legs.rate));
            leg_distance = none_check(to_string(behavior.legs.distance));
        }


    string block = "none";
    string ss = gaze_target +" "+ block +" "+ block +" "+ block +" "+ block +" "+ 
                screen_type +" "+ block +" "+ block +" "+ block +" "+ block +" "+ 
                sounder_tone +" "+ sounder_rate +" "+ sounder_content +" "+ block +" "+ block +" "+ 
                arm_aciton +" "+ arm_rate +" "+ block +" "+ block +" "+ block +" "+ 
                leg_target +" "+ leg_aciton +" "+ leg_rate+" "+ leg_distance +" "+ block +" "
                ;
    cout<< "        行为参数：" <<ss<<endl;
    

}

bool recall_gaze(  int period_  ){      /* 检测 gaze 行为的目标 是否到达 */ 
    //end周期
    if(    period_ == behavior.gaze.endTime  ){
        //if( recall成功 )
        return true;   //TODO: 
        // else
        return false;
    }
    // 非end周期
    else{
        return true;
    }
}
bool recall_screen(  int period_  ){      /* 检测 screen 行为的目标 是否到达 */ 
    return true;  //认为表情 永远能立即实现
}
bool recall_sounder(  int period_  ){      /* 检测 sounder 行为的目标 是否到达 */ 
    //end周期
    if(    period_ == behavior.speech.endTime  ){
        //if( recall成功 )
        return true;   //TODO: 
        // else
        return false;
    }
    // 非end周期
    else{
        return true;
    }
}
bool recall_arm(  int period_  ){      /* 检测 arm 行为的目标 是否到达 */ 
    return true;  //认为手臂的摆动 永远能立即实现
}
bool recall_leg(  int period_  ){      /* 检测 leg 行为的目标 是否到达 */ 
    //end周期
    if(    period_ == behavior.legs.endTime  ){
        //if( recall成功 )
        return true;    //TODO: 
        // else
        return false;
    }
    // 非end周期
    else{
        return true;
    }
}
    
bool recall(  int period_  ){
    /* 检测行为的目标 是否到达 */ 
    std::chrono::steady_clock::time_point t1 = std::chrono::steady_clock::now();
    bool flag_gaze=0, flag_screen=0, flag_sounder=0, flag_arm=0, flag_leg=0;
    
    while(1){
        flag_set(recall_gaze( period_ )   ,  flag_gaze);            
        flag_set(recall_screen( period_ )   ,  flag_screen);     
        flag_set(recall_sounder( period_ )   ,  flag_sounder);     
        flag_set(recall_arm( period_ )   ,  flag_arm);     
        flag_set(recall_leg( period_ )   ,  flag_leg);     
        
        std::chrono::steady_clock::time_point  t2 = std::chrono::steady_clock::now();
        double delay = std::chrono::duration_cast<std::chrono::duration<double> >(t2 - t1).count();
        if(compare(delay,single_period_time))  break;
    }
    // 以上的循环，完全是依靠  时间尺度。如果按照原来的 全部的 flag_xx 都为true了，就跳出循环，会导致 recall刚执行就结束了。
    // 按照时间尺度结束循环后， 会更体现  行为参数的预定义的重要性。
    if( (flag_gaze && flag_screen && flag_sounder && flag_arm && flag_leg) == true )
        return true;
    else
        return false;
}

   


// public:
void  PeriodDetection();
// 行为更新
void BehaviorUpdate(const social_msg::bhvPara::ConstPtr& behavior_ ,  ros::NodeHandle*  n){
        std::cout<< "××××××××××××××××××××××××××××××××××××××××××××××××××××××"<< std::endl << "接收到 "<<behavior_->Needs<< " 行为, num为： "<< behavior_->num<< " , type为： "<< behavior_->num / 100%10 << std::endl<< "××××××××××××××××××××××××××××××××××××××××××××××××××××××"<< std::endl;
        //保存 当前行为的 必要信息         
        behavior_name = behavior_->Needs;
        single_period_time = behavior_->TotalTime / 100.0;
        behavior_type_1 = behavior_->num / 1%10;	
        behavior_type_10 = behavior_->num / 10%10;
        behavior_type_100 = behavior_->num / 100%10;

        // 中断当前的行为
        if(!first_behavior)
            insert_new_behavihor = true;
        first_behavior = false;
        sleep(0.1);// TODO: 要不要 延迟01秒呢？  从而保证 一定能当前行为一定被打断。

        //更新行为
        behavior = *behavior_;
        behavior_cur_exist = true;
}

int main(int argc, char** argv){
    // ROS
    ros::init(argc, argv, "robot_platform");
    ros::NodeHandle n;
    cout<< "Start to Subscribe Behavior Parameter（接收ROS信息） !!\n";
    ros::Rate loop_rate(1); //loop_rate 发送数据频率10Hz

    
    sub_behavior  = n.subscribe<social_msg::bhvPara> ("behavior_pub", 10,  boost::bind(&BehaviorUpdate, _1, &n));
    ros::spinOnce();// ros::spin();
    
    pub_reply = n.advertise<social_msg::bhvReply>("behavior_Reply", 10);  
    while(ros::ok())
    {
        if(behavior_cur_exist)
            PeriodDetection();
          
        ros::spinOnce(); 
        // loop_rate.sleep();
    }
    
    return 0;
}

void  PeriodDetection(){
    if( (behavior_type_100 == 1) && ((behavior_type_10 != 0) || (behavior_type_1 != 0)) ){
        
        std::cout<< "当前为 "<<behavior.Needs<< " 行为的过渡中断行为， 延时3秒"<< std::endl;
        social_msg::bhvReply behavior_reply;
        behavior_reply.num = behavior.num;
        behavior_reply.time = behavior.time;
        behavior_reply.reply = 100;
        pub_reply.publish(behavior_reply);
        sleep(3); //TODO:  延迟时间 按照behavior_type_1 和 behavior_type_10 ？
        behavior_cur_exist = false;
        ros::spinOnce(); 
    }   
    else {
    // 
        int period_total =  100;
        int period_cur = 0;
        insert_new_behavihor = false;
        for(    ;   (period_cur <= period_total ) && (!insert_new_behavihor)    ; )
        {
            //
            std::cout<< "执行 "<<behavior.Needs<< " 行为的周期检测, ["<< period_cur << "]"<< std::endl;
        
            //查看每个行为的的起始周期，并发布行为参数
            publish( period_cur );
            bool flag = recall( period_cur );

            //如果 某一个肢体目标 在endtime 没有执行成功。 则不period_cur+1。
            if( flag == false ) {}
            else{
                social_msg::bhvReply behavior_reply;
                behavior_reply.num = behavior.num;
                behavior_reply.time = behavior.time;
                behavior_reply.reply = (int)period_cur;
                pub_reply.publish(behavior_reply);
                period_cur++;   
                if( period_cur > 100) {
                    behavior_cur_exist = false;
                    std::cout<< "执行 "<<behavior.Needs<< " 行为【完毕】"<< std::endl;
                }
            }
            ros::spinOnce(); 
        }
    }  
    
}