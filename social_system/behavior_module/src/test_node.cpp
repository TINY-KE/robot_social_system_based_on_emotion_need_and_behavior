/*
 * @Descripttion: 
 * @version: 
 * @Author: sueRimn
 * @Date: 2021-12-08 09:34:12
 * @LastEditors: sueRimn
 * @LastEditTime: 2021-12-08 09:44:40
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

int main(int argc,char **argv)
{
    //名称talker必须唯1
    ros::init(argc,argv,"test_node");
    ros::NodeHandle n;
    ros::Publisher chatter_pub=n.advertise<social_msg::need_msg>("needlist",1);

    ros::Rate loop_rate(1); //loop_rate 发送数据频率10Hz
    int count=0;
    int i=0;
    // setlocale(LC_CTYPE, "zh_CN.utf8");
    social_msg::need_msg need[6];
    need[0].need_name = "greet";
    need[0].person_name= "Teacher";
    need[0].person_emotion = "Happy";
    need[0].rob_emotion = "Happy";
    need[0].speech = "Morning";
    need[0].weight = 0.89;

    need[1].need_name = "quest";
    need[1].person_name= "XiaoHong";
    need[1].person_emotion = "Nomal";
    need[1].rob_emotion = "Nomal";
    need[1].speech = "Quest";
    need[1].weight = 0.62;

    need[2].need_name = "patrol";
    need[2].person_name= "none";
    need[2].person_emotion = "none";
    need[2].rob_emotion = "Nomal";
    need[2].speech = "0";
    need[2].weight = 0.42;

    need[3].need_name = "check";
    need[3].person_name= "XiaoGang";
    need[3].person_emotion = "Nomal";
    need[3].rob_emotion = "Nomal";
    need[3].speech = "please";
    need[3].weight = 0.93;

    need[4].need_name = "prevent";
    need[4].person_name= "Parents";
    need[4].person_emotion = "Nomal";
    need[4].rob_emotion = "Nomal";
    need[4].speech = "prevent";
    need[4].weight = 0.89;

    need[5].need_name = "clap";
    need[5].person_name= "none";
    need[5].person_emotion = "none";
    need[5].rob_emotion = "Happy";
    need[5].speech = "0";
    need[5].weight = 0.49;

    
    while(ros::ok())
    {
        if(count==5)
        {
            i = 3;   
            ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
            need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
            chatter_pub.publish(need[i]);
        }
        if(count==9)
        {
            i = 5;   
            ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
            need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
            chatter_pub.publish(need[i]);
        }
        // if(count==15)
        // {
        //     i = 2;   
        //     ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person.c_str(), 
        //     need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
        //     chatter_pub.publish(need[i]);
        // }
        ros::spinOnce();

        loop_rate.sleep();
        ++count;
    }
    return 0;
}