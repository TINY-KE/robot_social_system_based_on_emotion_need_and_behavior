/*
 * @Descripttion: 
 * @version: 
 * @Author: sueRimn
 * @Date: 2021-12-18 20:20:34
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-30 11:37:38
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

#include <thread>
#include "common_include.h"
#include "publish.h"
#include "recall.h"
// 蓝牙通信  TODO: 无线通讯通道
#include "serial.h"

using namespace  std;

/******************************************************************
 * 零、全局变量
*******************************************************************/
// ros node
ros::Subscriber sub_behavior;
ros::Publisher pub_reply;
ros::Publisher pub_need_satisfy;
ros::Publisher pub_associated_need;
ros::Publisher pub_body_status;

// 全局变量
string behavior_name;
bool first_behavior = true;

bool behavior_cur_exist = false;
bool insert_new_behavihor = false;
social_msg::bhvPara behavior;
double single_period_time;
bool flag;

double  energy = 0.9, gaze = 1, expresion = 1, trunk = 1, arm = 1, leg = 1;
bool  idlestate = true;
social_msg::robot_status robot_status; 

int behavior_type_1;
int behavior_type_10;
int behavior_type_100;

// 蓝牙
#define PORT "/dev/rfcomm0"
// #define PORT "/dev/ttyUSB0"
#define BAUDRATE 115200
int ret;
pthread_t th;

//创建接收线程，用于读取串口数据
int bluetooth = open_serial(PORT, BAUDRATE, 8, 'N', 1);


/******************************************************************
 * 一、recall函数
*******************************************************************/
recall *  recall::m_g_recall;
recall recall_buletooth( &bluetooth);

/******************************************************************
 * 二、publish函数
*******************************************************************/
publish pub_buletooth( bluetooth );

/******************************************************************
 * 三、生成和发送  身体状态
*******************************************************************/
void body_status_check_and_pub(){
    while(1){
        // 接受 安卓板的信息 

        // 发布机器人肢体状态：
        if(
            robot_status.idleState != idlestate 
        )
        {
            robot_status.body1 = energy; 
            robot_status.body2 = gaze;
            robot_status.body3 = expresion;
            robot_status.body4 = trunk;
            robot_status.body5 = arm;
            robot_status.body6 = leg;
            robot_status.body7 = 1;
            robot_status.idleState = idlestate;
            pub_body_status.publish(robot_status);
            // std::cout<< "发送机器人状态，idleState为："<<idlestate<< std::endl;
            // ROS_DEBUG("发送机器人状态，idleState为：&d \n", (int)robot_status.idleState);
            printf( GREEN "发送机器人状态，idleState为：%d \n"NONE, (int)robot_status.idleState);  
        }
    }
}
void body_status_first_pub(){
        robot_status.body1 = 0.9; 
        robot_status.body2 = 1;
        robot_status.body3 = 1;
        robot_status.body4 = 1;
        robot_status.body5 = 1;
        robot_status.body6 = 1;
        robot_status.body7 = 1;
        robot_status.idleState = true;
        pub_body_status.publish(robot_status);
        // ROS_DEBUG("发送机器人状态，idleState为：&d \n", (int)robot_status.idleState);
        printf( GREEN "发送机器人状态，idleState为：%d \n"NONE, (int)robot_status.idleState);  
}


/******************************************************************
 * 四、需求满足状态
*******************************************************************/
void need_satisfy_pub( social_msg::bhvPara& behavior_for_satisfy, bool pn ){
    social_msg::need_satisfy_msg satisfy_msg;
    satisfy_msg.need_name = behavior_for_satisfy.Needs;
    if(pn)
        satisfy_msg.satisfy_value = behavior_for_satisfy.satisfy_value;
    else
        satisfy_msg.satisfy_value = -1 * behavior_for_satisfy.satisfy_value;
    pub_need_satisfy.publish(satisfy_msg);
} 


// public:
void  PeriodDetection();


/******************************************************************
 * 五、行为更新
*******************************************************************/
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
        
        // 机器人脱离 闲置状态
        // if( behavior_name != "Wander"  &&  behavior_name != "Chat" )  TODO: 
            idlestate = false;

        //更新行为
        behavior = *behavior_;
        behavior_cur_exist = true;
}

/******************************************************************
 * 六、main， 周期检测函数
*******************************************************************/
int main(int argc, char** argv){

    //蓝牙通信
    //蓝牙通信: 1.接受flag
    // pthread_create(&th, NULL, recall::pthread_read, &bluetooth);

    // ROS
    ros::init(argc, argv, "robot_platform");
    ros::NodeHandle n;
    cout<< "Start to Subscribe Behavior Parameter（接收ROS信息） !!\n";
    ros::Rate loop_rate(1); //loop_rate 发送数据频率10Hz

    
    sub_behavior  = n.subscribe<social_msg::bhvPara> ("behavior_pub", 10,  boost::bind(&BehaviorUpdate, _1, &n));
    ros::spinOnce();// ros::spin();
    
    pub_reply = n.advertise<social_msg::bhvReply>("behavior_Reply", 10); 
    pub_need_satisfy = n.advertise<social_msg::need_satisfy_msg>("need_satisfied", 10); 
    
    pub_associated_need = n.advertise<social_msg::need_msg>("need_lists", 10); 
    pub_body_status = n.advertise<social_msg::robot_status>("robot_status", 10); 
    
    
    sleep(1);
    body_status_first_pub();

    std::thread thread_body_status( body_status_check_and_pub );

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
    // 过渡行为
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

    // 普通行为 
    else {
        
        int period_total =  100;
        int period_cur = 0; period_cur = behavior.progress;
        insert_new_behavihor = false;
        int delay_time = 0;
        for(    ;   (period_cur <= period_total ) && (!insert_new_behavihor)    ; )
        {
            //
            std::cout<< "执行 "<<behavior.Needs<< " 行为的周期检测, ["<< period_cur << "]"<< std::endl;
        
            //查看每个行为的的起始周期，并发布行为参数
            pub_buletooth.run ( behavior, period_cur );
            bool flag = recall_buletooth.run( behavior, period_cur );

            //根据flag判断： 如果 某一个肢体目标 在endtime 没有执行成功。 则不period_cur+1。
            if( flag == false ) {
                // 当前周期（endtime）不能通过，次数到达阈值， 生成 消极需求满足
                delay_time ++;
                if( delay_time > 20 ){   //TODO: delay time的阈值  还得斟酌。
                    need_satisfy_pub( behavior , false );
                    delay_time = 0;
                }
                // 当前周期 停滞，生成 (-1)的behavior_reply
                social_msg::bhvReply behavior_reply;
                behavior_reply.num = behavior.num;
                behavior_reply.time = behavior.time;
                behavior_reply.reply = -1 ;
                pub_reply.publish(behavior_reply);       
            }
            else{
                // 1.当前周期通过后，生成behavior_reply
                social_msg::bhvReply behavior_reply;
                behavior_reply.num = behavior.num;
                behavior_reply.time = behavior.time;
                behavior_reply.reply = (int)period_cur;
                pub_reply.publish(behavior_reply);

                // 2.进入下一周期
                period_cur++;   
                
                // 3.delay_time 置为0
                delay_time = 0;

                // 4.当前行为结束后
                if( period_cur > 100) {
                    
                    //(1)关闭周期检测函数
                    behavior_cur_exist = false;
                    std::cout<< "执行 "<<behavior.Needs<< " 行为【完毕】"<< std::endl;
                    //(2)生成  积极需求满足。  TODO: 需求满足状态的msg。 在 behavior中添加 satisfy_value
                    need_satisfy_pub( behavior , true );

                    //(3)机器人进入闲置状态
                    idlestate = true;
                    
                    //(4)生成关联性需求，pass。   TODO: 内部感知信息而诞生的need msg。
                    social_msg::need_msg associated_need_pass;
                    if( behavior.Needs == "MeasureTempareture"){
                        associated_need_pass.need_name = "Pass";
                        associated_need_pass.person_name = behavior.legs.target;
                        associated_need_pass.person_emotion = "none";
                        associated_need_pass.IDtype = "none";
                        associated_need_pass.qt_order = -1;  //TODO:  要求  qt中必须当前显示。
                        associated_need_pass.rob_emotion = "Joy";
                        associated_need_pass.weight = 0.95;//TODO: need weight 还不确定。。
                        associated_need_pass.speech = "您的检查完成了，可以进学校了"; 
                        associated_need_pass.satisfy_value = 2;
                        pub_associated_need.publish(associated_need_pass);
                    }

                    // (5) 用于 小刚测体温的 打断次数的 记录，要归零。
                    recall_buletooth.delay_for_gaze_xiaogang_measureTemperate_for_needSatisfy = 0;
                }

                // 5.关联性需求，KeepOrder 1  TODO:  维持秩序的源头： 
                social_msg::need_msg associated_need_keepOrder;
                if( recall_buletooth.delay_for_gaze_xiaogang_measureTemperate_for_needSatisfy == 1 ){
                    associated_need_keepOrder.need_name = "KeepOrder";
                    associated_need_keepOrder.person_name = behavior.gaze.target;
                    associated_need_keepOrder.person_emotion = "none";
                    associated_need_keepOrder.IDtype = "none";
                    associated_need_keepOrder.qt_order = -1;  
                    associated_need_keepOrder.rob_emotion = "Anger";
                    associated_need_keepOrder.weight = 0.85;
                    associated_need_keepOrder.speech = "请配合我的工作，站在原地不要乱动";   //由行为模块根据  机器人的心情 来选择。
                    associated_need_keepOrder.satisfy_value = 2;
                    pub_associated_need.publish(associated_need_keepOrder);
                    recall_buletooth.delay_for_gaze_xiaogang_measureTemperate_for_needSatisfy = 0;
                }
                // 5.关联性需求，KeepOrder 2  
                // social_msg::need_msg associated_need_keepOrder2;
                // if(  period_cur == 71 && delay_for_gaze_xiaogang_measureTemperate_for_needSatisfy == 2 ){
                //     associated_need_keepOrder2.need_name = "KeepOrder";
                //     associated_need_keepOrder2.person_name = behavior.gaze.target;
                //     associated_need_keepOrder2.person_emotion = "none";
                //     associated_need_keepOrder2.IDtype = "none";
                //     associated_need_keepOrder2.qt_order = -1;  
                //     associated_need_keepOrder2.rob_emotion = "Anger";
                //     associated_need_keepOrder2.weight = 0.85;
                //     associated_need_keepOrder2.speech = "再乱动 我就要通知老师了"; 
                //     associated_need_keepOrder2.satisfy_value = 2;
                //     pub_associated_need.publish(associated_need_keepOrder2);
                //     delay_for_gaze_xiaogang_measureTemperate_for_needSatisfy = 0;
                // }
            }
            
            ros::spinOnce(); 
        }
        pub_buletooth.clear();
    }

    
}