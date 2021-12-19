/*
 * @Descripttion: 
 * @version: 
 * @Author: sueRimn
 * @Date: 2021-12-18 20:20:34
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-19 23:18:09
 */
//
// Created by zhjd on 2021/5/11.
//
//ros头文件
#include <ros/ros.h>
#include "std_msgs/String.h"


#include "common_include.h"

//肢体 头文件
#include "Gaze_pub.h"
#include "Screen_pub.h"
#include "Arm_pub.h"
#include "Sounder_pub.h"
#include "Leg_pub.h"

//肢体定义
Gaze_pub  *gaze;            
Screen_pub  screen;         
Sounder_pub  sounder;
Arm_pub  *arm;
Leg_pub  leg;

// ros node
ros::Subscriber sub_behavior;
ros::Publisher pub_reply;
social_msg::bhvPara behavior_cur;
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


 */

using namespace  std;
// time_t inner_need::time_for_wandor  =  0;
int period_total;
int period_cur = 1;
// int period_num_cur;

void PeriodUpdate(  int period){
    
}

void  PeriodDetection(){
    cout<< "PeriodDetection !!\n";
    // int8 num
    // int64 time 
    // int8 reply
    social_msg::bhvReply behavior_reply;
    behavior_reply.num = behavior_cur.num;
    behavior_reply.time = behavior_cur.time;
    while( period_total != period_cur){
        // if(period_num == period_num_cur)
        // if(    (gaze.flag == 1)  &&  screen.flag == 1  &&  arm.flag == 1  &&  sounder.flag == 1  &&  arm.flag == 1 ){
        //     period_cur ++ ;
        //     // gaze.period = period_cur;
        //     // screen.period = period_cur;
        //     // sounder.period = period_cur;
        //     // arm.period = period_cur;
        //     // leg.period = period_cur;  
        //     // gaze.run(       period_cur  );
        //     // screen.run(     period_cur  );
        //     // std::thread Gaze_Thread(  gaze.run( period_cur) );
        //     // std::thread Screen_Thread(  screen.run( period_cur) );
        //     // std::thread Sounder_Thread(  Sounder_pub::run  ,  sounder);
        //     // std::thread Arm_Thread(  Arm_pub::run  ,  arm);
        //     // std::thread Leg_Thread(  Leg_pub::run  ,  leg);
        //     behavior_reply.reply = (int)(period_cur/period_total);
        // }
    }

    period_cur = 1;

}


// 需求模型
void BehaviorUpdate(const social_msg::bhvPara& behavior){
        // int16 num
        // int32 time
        // string intention
        // int8 CurOrder
        // int8 TotalOrder
        // int8 Actuator_enable
        // social_msg/Gaze gaze
        // social_msg/Emotion emotion
        // social_msg/Arms arms
        // social_msg/Speech speech
        // social_msg/Legs legs
        behavior_cur = behavior;
        period_total = behavior.TotalTime;
        
        // gaze.parameter      = behavior.gaze;
        // screen.parameter    = behavior.emotion;
        
}

int main(int argc, char** argv){
    // 为各肢体  创建单独的线程 。  
    
    
    // std::thread Gaze_Thread(  gaze.run( period_cur) );
    // std::thread Screen_Thread(  screen.run( period_cur) );
    // std::thread Sounder_Thread(  Sounder_pub::run  ,  sounder);
    // std::thread Arm_Thread(  Arm_pub::run  ,  arm);
    // std::thread Leg_Thread(  Leg_pub::run  ,  leg);
    // std::thread PeriodDetection_Thread(PeriodDetection);
    // gaze = new Gaze_pub();
    // std::thread Gaze_Thread(  &Gaze_pub::run  ,  gaze);
    // std::thread Gaze_Thread(  Gaze_pub::run  ,  gaze);
    // std::thread Screen_Thread(  Screen_pub::run  ,  screen);
    // std::thread Sounder_Thread(  Sounder_pub::run  ,  sounder);
    arm =new Arm_pub();
    std::thread Arm_Thread(  &Arm_pub::run  ,  arm);
    // std::thread Arm_Thread(  Arm_pub::run  ,  arm);
    // std::thread Leg_Thread(  &/Leg_pub::run  ,  &leg);
    

//    mpLoopCloser = new LoopClosing(mpMap, mpKeyFrameDatabase, mpVocabulary, mSensor!=MONOCULAR);
    // mptLoopClosing = new thread(&ORB_SLAM2::LoopClosing::Run, mpLoopCloser);

    // ROS
    ros::init(argc, argv, "social_msg");
    ros::NodeHandle n;
    cout<< "Start to Subscribe Behavior Parameter（接收ROS信息） !!\n";
    //行为参数的接收
    sub_behavior  = n.subscribe("behavior_pub", 10, BehaviorUpdate);
    
    //行为进度
    pub_reply = n.advertise<social_msg::bhvReply>("behavior_Reply", 10);  
    
    ros::spin();    //库是节点读取数据道消息响应循环，当消息到达的时候，回调函数就会被调用。当按下Ctrl+C时，节点会退出消息循环，于是循环结束。
    return 0;
}
