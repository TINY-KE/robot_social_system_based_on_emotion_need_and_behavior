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
#include "manage_pkg/Arms.h"
#include "manage_pkg/Emotion.h"
#include "manage_pkg/Gaze.h"
#include "manage_pkg/Legs.h"
#include "manage_pkg/Speech.h"
#include "manage_pkg/bhvGet.h"
#include "manage_pkg/bhvPara.h"
#include "manage_pkg/bhvIssue.h"
#include "manage_pkg/bhvReply.h"
#include "manage_pkg/NeedList.h"
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
    ros::Publisher chatter_pub=n.advertise<manage_pkg::NeedList>("needlist",1);

    ros::Rate loop_rate(1); //loop_rate 发送数据频率10Hz
    int count=0;
    int i=0;
    // setlocale(LC_CTYPE, "zh_CN.utf8");
    manage_pkg::NeedList need[6];
    need[0].name = "greet";
    need[0].person = "Teacher";
    need[0].person_emotion = "Happy";
    need[0].rob_emotion = "Happy";
    need[0].speech = "Morning";
    need[0].weight = 0.89;

    need[1].name = "quest";
    need[1].person = "XiaoHong";
    need[1].person_emotion = "Nomal";
    need[1].rob_emotion = "Nomal";
    need[1].speech = "Quest";
    need[1].weight = 0.62;

    need[2].name = "patrol";
    need[2].person = "none";
    need[2].person_emotion = "none";
    need[2].rob_emotion = "Nomal";
    need[2].speech = "0";
    need[2].weight = 0.42;

    need[3].name = "check";
    need[3].person = "XiaoGang";
    need[3].person_emotion = "Nomal";
    need[3].rob_emotion = "Nomal";
    need[3].speech = "please";
    need[3].weight = 0.93;

    need[4].name = "prevent";
    need[4].person = "Parents";
    need[4].person_emotion = "Nomal";
    need[4].rob_emotion = "Nomal";
    need[4].speech = "prevent";
    need[4].weight = 0.89;

    need[5].name = "clap";
    need[5].person = "none";
    need[5].person_emotion = "none";
    need[5].rob_emotion = "Happy";
    need[5].speech = "0";
    need[5].weight = 0.49;

    
    while(ros::ok())
    {
        if(count==5)
        {
            i = 3;   
            ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].name.c_str(), need[i].person.c_str(), 
            need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
            chatter_pub.publish(need[i]);
        }
        if(count==9)
        {
            i = 5;   
            ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].name.c_str(), need[i].person.c_str(), 
            need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
            chatter_pub.publish(need[i]);
        }
        // if(count==15)
        // {
        //     i = 2;   
        //     ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].name.c_str(), need[i].person.c_str(), 
        //     need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
        //     chatter_pub.publish(need[i]);
        // }
        ros::spinOnce();

        loop_rate.sleep();
        ++count;
    }
    return 0;
}