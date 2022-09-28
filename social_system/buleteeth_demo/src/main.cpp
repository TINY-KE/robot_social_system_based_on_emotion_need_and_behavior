/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2022-08-24 20:58:00
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2022-08-24 21:46:07
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

// ros node
ros::Subscriber sub_behavior;
ros::Publisher pub_reply;
ros::Publisher pub_need_satisfy;
ros::Publisher pub_associated_need;
ros::Publisher pub_body_status;

// 全局变量


// 蓝牙
#define PORT "/dev/rfcomm0"
// #define PORT "/dev/ttyUSB0"
#define BAUDRATE 115200
int ret;
pthread_t th;

//创建接收线程，用于读取串口数据
int bluetooth = open_serial(PORT, BAUDRATE, 8, 'N', 1);


/******************************************************************
 * 一、recall函数：  recall_buletooth会不断的接收机器人发送的信息，并存储在recall_buletooth中的成员变量中。
*******************************************************************/
recall *  recall::m_g_recall;  // 初始化recall类中的静态变量
recall recall_buletooth( &bluetooth);

/******************************************************************
 * 二、publish函数：  通过pub_buletooth中的run函数
*******************************************************************/
publish pub_buletooth( bluetooth );

/******************************************************************
 * 六、main， 周期检测函数
*******************************************************************/
int main(int argc, char** argv){

    // pthread_create(&th, NULL, recall::pthread_read, &bluetooth);

    // ROS node
    ros::init(argc, argv, "action_node");
    ros::NodeHandle n;
    
    // pub中会用到ros节点，以给机械臂发送topic
    pub_buletooth.set_ros_node(n);  
    string parameter_buletooth = "xiaoming joy";
    string arm_action = "wave";
    int arm_rate = 2 ; 
    pub_buletooth.run(parameter_buletooth,  arm_action  , arm_rate);
    return 0;
}
