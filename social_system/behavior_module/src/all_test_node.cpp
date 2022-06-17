/*
 * @Descripttion: 
 * @version: 
 * @Author: sueRimn
 * @Date: 2021-12-08 09:34:12
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2022-05-17 22:54:48
 */
#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sstream>
#include "social_msg/Arms.h"
#include "social_msg/Emotion.h"
#include "social_msg/Gaze.h"
#include "social_msg/Legs.h"
#include "social_msg/Speech.h"
#include "social_msg/bhvGet.h"
#include "social_msg/bhvPara.h"
#include "social_msg/bhvIssue.h"
#include "social_msg/bhvReply.h"
#include "social_msg/need_msg.h"

#include "social_msg/robot_emotion.h"
#include "social_msg/robot_status.h"
#include "social_msg/perception_msg.h"
#include "social_msg/attitude_msg.h"
#include "social_msg/need_satisfy_msg.h"

ros::Publisher pub_perception;
ros::Publisher pub_attitude;
ros::Publisher pub_body;
ros::Publisher pub_emotion;


int main(int argc,char **argv)
{
    //名称talker必须唯1
    ros::init(argc,argv,"test_node");
    ros::NodeHandle n;
    // 感知信息
    pub_perception  = n.advertise<social_msg::perception_msg>("perceptions", 10);
    pub_attitude  = n.advertise<social_msg::attitude_msg>("attitude", 10);
    pub_body  = n.advertise<social_msg::robot_status>("robot_status", 10);        
    // 情感
    pub_emotion  = n.advertise<social_msg::robot_emotion>("robot_emotion", 10);

    ros::Rate loop_rate(1); //loop_rate 发送数据频率10Hz
    int count=0;
    int i=0;
    // setlocale(LC_CTYPE, "zh_CN.utf8");
    social_msg::need_msg need[50];
    social_msg::perception_msg perception;
    social_msg::attitude_msg attitude; 

    while(ros::ok())
    {   int init_time = 50;
        ROS_INFO("%d ",count );   //散步后，小明想 进学校
        
        int time_flag = init_time;
        if(count == time_flag)
        {   
            // ros::Time now = ros::Time::now();
            perception.time = ros::Time::now().sec;
            perception.person_name = "小明";
            perception.IDtype = "Student";
            perception.intention = "EnterSchool";
            perception.p = 0.9;
            perception.intention_2 = "";
            perception.p_2 = 0;
            perception.person_speech = "";
            perception.speech = "小明你好,你是要进校吗";
            perception.person_emotion = "Happy";
            pub_perception.publish(perception);

                
            attitude.person_name = "小明";
            attitude.attitude = "enthusiastic";
            pub_attitude.publish(attitude);

            ROS_INFO("\n%s,  %s,\n",perception.person_name.c_str(), perception.intention.c_str() );  
        }
        int Ming_EnterSchool = 15 + 2;   //打招呼，用了15秒后。学生说“我要进学校,你给我测测体温”,用了2秒。获取到小明想 测体温


        time_flag += Ming_EnterSchool;
        if(count==time_flag)
        {   
            perception.time = ros::Time::now().sec;
            perception.person_name = "小明";
            perception.IDtype = "Student";
            perception.intention = "MeasureTempareture";
            perception.p = 0.9;
            perception.intention_2 = "";
            perception.p_2 = 0;
            perception.person_speech = "我要进学校,你给我测测体温";
            perception.speech = "好的,你站在原地不要动";
            perception.person_emotion = "Happy";
            pub_perception.publish(perception);

                
            // attitude.person_name = "小明";
            // attitude.attitude = "enthusiastic";
            // pub_attitude.publish(attitude);

            ROS_INFO("\n%s,  %s,\n",perception.person_name.c_str(), perception.intention.c_str() );  
        }
        int Ming_MeasureTempareture = 7;   //回答“好的,你站在原地不要动”，用了 秒。因此开始测体温后，过了 秒。看到李老师 想进学校


        time_flag += Ming_MeasureTempareture;
        if(count==time_flag)
        {   
            perception.time = ros::Time::now().sec;
            perception.person_name = "李老师";
            perception.IDtype = "Teacher";
            perception.intention = "EnterSchool";
            perception.p = 0.9;
            perception.intention_2 = "";
            perception.p_2 = 0;
            perception.person_speech = "";
            perception.speech = "李老师早上好";
            perception.person_emotion = "Happy";
            pub_perception.publish(perception);

                
            attitude.person_name = "李老师";
            attitude.attitude = "respectful";
            pub_attitude.publish(attitude);

            ROS_INFO("\n%s,  %s,\n",perception.person_name.c_str(), perception.intention.c_str() );  
        }
        int Li_EnterSchool = 10+15;   //跟李老师打招呼，过了10秒，扭回头来。转头回来继续测温5秒。小明扰乱秩序。
        // int Li_EnterSchool = 10+10;   //跟李老师打招呼，过了10秒，扭回头来。转头回来继续测温5秒。小明扰乱秩序。


        time_flag += Li_EnterSchool;
        if(count==time_flag)
        {   
            perception.time = ros::Time::now().sec;
            perception.person_name = "小明";
            perception.IDtype = "Student";
            perception.intention = "Uncooperate";
            perception.p = 0.9;
            perception.intention_2 = "";
            perception.p_2 = 0;
            perception.person_speech = "";
            perception.speech = "小明,请站在原地别乱动,我没法给你测体温了";
            perception.person_emotion = "Happy";
            pub_perception.publish(perception);

                
            // attitude.person_name = "小明";
            // attitude.attitude = "enthusiastic";
            // pub_attitude.publish(attitude);
        }
        int Li_Pass = 35;   //小明进校说，“小胖再见”

        time_flag += Li_Pass;
        if(count==time_flag)
        {   
            perception.time = ros::Time::now().sec;
            perception.person_name = "李老师";
            perception.IDtype = "Teacher";
            perception.intention = "MeasureTempareture";
            perception.p = 0.9;
            perception.intention_2 = "";
            perception.p_2 = 0;
            perception.person_speech = "";
            perception.speech = "李老师,久等了,我来给您测体温";
            perception.person_emotion = "Happy";
            pub_perception.publish(perception);

                
            // attitude.person_name = "小明";
            // attitude.attitude = "enthusiastic";
            // pub_attitude.publish(attitude);
        }
        


        
        ros::spinOnce();

        loop_rate.sleep();
        ++count;
    }
    return 0;
}