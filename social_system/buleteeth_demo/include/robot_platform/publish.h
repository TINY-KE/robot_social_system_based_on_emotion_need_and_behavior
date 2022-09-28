/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-29 11:40:12
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2022-08-24 21:41:15
 */
#include "common_include.h"

using namespace std;

class publish {
private:
    int buletooth;

    string  gaze_target_lastpub = "none" , screen_type_lastpub = "none";
public:
    publish(){}
    
    publish( int& buletooth_ ):buletooth(buletooth_)
    {   //social_msg::bhvPara hehavior
    }

    void set_ros_node(ros::NodeHandle& n){
        pub_robotic_arm = n.advertise<social_msg::Arms>("arm_action", 10);  
    }

private:   
    ros::Publisher pub_robotic_arm;  //机械臂通信专用节点



public:
// 需求满足状态  、肢体状态 、 内部感知信息（pass、 Uncooperate。 
// 感觉直接改成需求更合适，为什么要通过感知信息而多此一举呢。甚至直接改为行为？）的生成。
    void run( string parameter_buletooth,   string arm_action  ,int arm_rate)
    {
        //蓝牙发送 
        char *temp = (char *)parameter_buletooth.c_str();
        char parameter_buletooth_char[1000];
        strcpy(  parameter_buletooth_char , temp );
        printf( "行为参数 parameter_buletooth_char: %s \n" , parameter_buletooth_char);
        write(buletooth, parameter_buletooth_char, strlen(parameter_buletooth_char));

        //机械臂的ros节点发送 
        if( arm_action != "none" ){
            social_msg::Arms arm_msg;
            arm_msg.action = arm_action;
            arm_msg.rate = arm_rate;
            pub_robotic_arm.publish(arm_msg);
        }

    }
};
