/*
 * @Descripttion: 
 * @version: 
 * @Author: sueRimn
 * @Date: 2021-12-18 20:20:34
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-22 10:24:56
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


#include "common_include.h"

#include "periodDetection.h"

using namespace  std;

// 肢体定义       
periodDetection  *period_detection;

// ros node
ros::Subscriber sub_behavior;

social_msg::bhvPara behavior_cur;

// 线程
std::thread* period_Thread;
// std::thread* gaze_Thread;
// std::thread* screen_Thread;
// 为周期检测  创建线程
// std::thread Period_Thread(  PeriodDetection  );
// 为各肢体  创建单独的线程 。  
// gaze = new Gaze_pub();
// std::thread Gaze_Thread(  &Gaze_pub::run ,  gaze);
// screen = new Screen_pub();
// std::thread Screen_Thread(  &Screen_pub::run ,  screen);




// 全局变量
string behavior_name;
// bool insert_new_behavior;
bool first_behavior = true;

// 行为更新
void BehaviorUpdate(const social_msg::bhvPara::ConstPtr& behavior ,  ros::NodeHandle*  n){
        std::cout<< "××××××××××××××××××××××××××××××××××××××××××××××××××××××"<< std::endl << "接收到 "<<behavior->Needs<< " 行为, num为： "<< behavior->num<< " , type为： "<< behavior->num / 100%10 << std::endl<< "××××××××××××××××××××××××××××××××××××××××××××××××××××××"<< std::endl;
        //保存 当前行为的信息         
        behavior_cur = *behavior;
        behavior_name = behavior->Needs;
        
        if(!first_behavior)
            period_detection -> interrupt_last_behavior();
        first_behavior = false;
        //创建一个“周期检测函数”的线程
        //     mpLocalMapper = new LocalMapping(mpMap, mSensor==MONOCULAR, flag);
        // mptLocalMapping = new thread(&ORB_SLAM2::LocalMapping::Run,mpLocalMapper);
        period_detection = new periodDetection( behavior_cur , *n);
        period_Thread = new  thread(  &periodDetection::PeriodDetection , period_detection);
        // cout<<"数字传入："<< n;
        

}

int main(int argc, char** argv){
    // ROS
    ros::init(argc, argv, "robot_platform");
    ros::NodeHandle n;
    cout<< "Start to Subscribe Behavior Parameter（接收ROS信息） !!\n";
    int nn =1;
    sub_behavior  = n.subscribe<social_msg::bhvPara> ("behavior_pub", 10,  boost::bind(&BehaviorUpdate, _1, &n));
    
    //<social_msg::bhvPara> 

    ros::spin();    //库是节点读取数据道消息响应循环，当消息到达的时候，回调函数就会被调用。当按下Ctrl+C时，节点会退出消息循环，于是循环结束。
    return 0;
}



//  while( 1 )
//     {
//     // std::cout<< "等待 运行 Period Detection !!\n";   
//     if(wheather_run){ 
//         std::cout<< "Period Detection !!\n";   
//         // int8 num
//         // int64 time 
//         // int8 reply
//         social_msg::bhvReply behavior_reply;
//         behavior_reply.num = behavior_cur.num;
//         behavior_reply.time = behavior_cur.time;
//         insert_behavior = false;
//         while( period_cur  <=  period_total)
//         {
//             // 更新 当前的周期序号  到5个肢体中
//             gaze -> updatePeriodCur(period_cur);
//             screen -> updatePeriodCur(period_cur);
            
//             if(    (gaze->flag == 1) /* &&  screen->flag == 1 */  ){  //
//                 period_cur_temp = period_cur;
//                 period_cur ++ ;
//                 behavior_reply.reply = (int)(period_cur*100/period_total);
//                 pub_reply.publish(behavior_reply);
//             }
//             if(insert_behavior)  break;
            
//         }

//         //周期数 到达period_total，当前行为执行完毕，不再执行。
//         wheather_run = false;

//     }
//     }