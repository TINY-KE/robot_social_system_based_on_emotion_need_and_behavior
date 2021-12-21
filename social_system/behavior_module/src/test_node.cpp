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
    ros::Publisher chatter_pub=n.advertise<social_msg::need_msg>("need_lists",1);

    ros::Rate loop_rate(1); //loop_rate 发送数据频率10Hz
    int count=0;
    int i=0;
    // setlocale(LC_CTYPE, "zh_CN.utf8");
    social_msg::need_msg need[50];
    need[0].need_name = "Greet";
    need[0].person_name= "Teacher_Li";
    need[0].person_emotion = "Happy";
    need[0].rob_emotion = "Happy";
    need[0].speech = "李老师你好啊";
    need[0].weight = 0.89;

    need[1].need_name = "Doubt";
    need[1].person_name= "XiaoHong";
    need[1].person_emotion = "Nomal";
    need[1].rob_emotion = "Nomal";
    need[1].speech = "Quest";
    need[1].weight = 0.62;

    need[2].need_name = "Wander";
    need[2].person_name= "none";
    need[2].person_emotion = "none";
    need[2].rob_emotion = "Nomal";
    need[2].speech = "怎么还没有人来";
    need[2].weight = 0.42;

    need[3].need_name = "MeasureTempareture";
    need[3].person_name= "Teacher_Li";
    need[3].person_emotion = "Nomal";
    need[3].rob_emotion = "Nomal";
    need[3].speech = "一日之计在于晨，李老师真是一位敬业的老师。我们先来测一下体温";
    need[3].weight = 0.93;

    need[4].need_name = "StopStranger";
    need[4].person_name= "Parents";
    need[4].person_emotion = "Nomal";
    need[4].rob_emotion = "Nomal";
    need[4].speech = "先生请留步，学校不允许无关人员进入";
    need[4].weight = 0.89;

    need[5].need_name = "Remind";
    need[5].person_name= "Teacher_Li";
    need[5].person_emotion = "none";
    need[5].rob_emotion = "Happy";
    need[5].speech = "李老师您的体温正常，可以进学校了";
    need[5].weight = 0.96;

    need[6].need_name = "Pass";
    need[6].person_name= "Teacher_Li";
    need[6].person_emotion = "none";
    need[6].rob_emotion = "Happy";
    need[6].speech = "李老师您的体温正常，可以进学校了";
    need[6].weight = 0.96;
    
    //greet xiaohong
    need[7].need_name = "Greet";
    need[7].person_name= "Hong";
    need[7].person_emotion = "Happy";
    need[7].rob_emotion = "Happy";
    need[7].speech = "你好啊小红";
    need[7].weight = 0.89;
    
    //MeasureTempareture xiaohong
    need[8].need_name = "MeasureTempareture";
    need[8].person_name= "Hong";
    need[8].person_emotion = "Nomal";
    need[8].rob_emotion = "Nomal";
    need[8].speech = "我们先来测一下体温";
    need[8].weight = 0.93;
    
    //pass xiaohong
    need[9].need_name = "Pass";
    need[9].person_name= "Hong";
    need[9].person_emotion = "none";
    need[9].rob_emotion = "Happy";
    need[9].speech = "小红你的体温正常，可以进学校了";
    need[9].weight = 0.96;

    //remind xiaohong
    need[10].need_name = "Remind";
    need[10].person_name= "Hong";
    need[10].person_emotion = "none";
    need[10].rob_emotion = "Happy";
    need[10].speech = "李老师表扬你，昨天卫生做的很棒";
    need[10].weight = 0.90;

    //greet xiaoming
    need[11].need_name = "Greet";
    need[11].person_name= "Ming";
    need[11].person_emotion = "none";
    need[11].rob_emotion = "Happy";
    need[11].speech = "你好啊小明";
    need[11].weight = 0.90;

    //greet xiaogang
    need[12].need_name = "Greet";
    need[12].person_name= "Gang";
    need[12].person_emotion = "none";
    need[12].rob_emotion = "Happy";
    need[12].speech = "你好啊小刚";
    need[12].weight = 0.90;

    //temp ming
    need[13].need_name = "MeasureTempareture";
    need[13].person_name= "Ming";
    need[13].person_emotion = "none";
    need[13].rob_emotion = "Nomal";
    need[13].speech = "工作期间不能闲聊哦";
    need[13].weight = 0.90;

    //pass ming
    need[14].need_name = "Pass";
    need[14].person_name= "Ming";
    need[14].person_emotion = "none";
    need[14].rob_emotion = "Nomal";
    need[14].speech = "小明你的体温正常，可以进学校了";
    need[14].weight = 0.90;

    //temp gang
    need[15].need_name = "MeasureTempareture";
    need[15].person_name= "Gang";
    need[15].person_emotion = "none";
    need[15].rob_emotion = "Angry";
    need[15].speech = "小刚同学，请配合我的工作，否则我就通知老师了";
    need[15].weight = 0.90;
    //pass gang
    need[16].need_name = "Pass";
    need[16].person_name= "Gang";
    need[16].person_emotion = "none";
    need[16].rob_emotion = "Nomal";
    need[16].speech = "小刚你的体温正常，可以进学校了";
    need[16].weight = 0.90;
    //remind gang
    need[17].need_name = "Remind";
    need[17].person_name= "Gang";
    need[17].person_emotion = "none";
    need[17].rob_emotion = "Angry";
    need[17].speech = "小刚同学，你妈妈让我提醒你，在学校要记得喝水，上课要认真听讲，不要乱动";
    need[17].weight = 0.90;
    //wander
    need[18].need_name = "Wander";
    need[18].person_name= "none";
    need[18].person_emotion = "none";
    need[18].rob_emotion = "Nomal";
    need[18].speech = "怎么还没有人来";
    need[18].weight = 0.90;
    //stopstranger
    need[19].need_name = "StopStranger";
    need[19].person_name= "Stranger";
    need[19].person_emotion = "none";
    need[19].rob_emotion = "Angry";
    need[19].speech = "先生请留步，学校不允许无关人员进入";
    need[19].weight = 0.90;
    //greet hongD
    need[20].need_name = "Greet";
    need[20].person_name= "Parent Hong";
    need[20].person_emotion = "none";
    need[20].rob_emotion = "Happy";
    need[20].speech = "小红爸爸您好";
    need[20].weight = 0.90;
    //temp HongD
    need[21].need_name = "MeasureTempareture";
    need[21].person_name= "Parent Hong";
    need[21].person_emotion = "none";
    need[21].rob_emotion = "Nomal";
    need[21].speech = "我们先来测一下体温";
    need[21].weight = 0.90;
    //pass Hongd
    need[22].need_name = "Pass";
    need[22].person_name= "Parent Hong";
    need[22].person_emotion = "none";
    need[22].rob_emotion = "Nomal";
    need[22].speech = "李老师家长会的地址是在教学楼的三班";
    need[22].weight = 0.90;
    //greet Mingd
    need[23].need_name = "Greet";
    need[23].person_name= "Parent Ming";
    need[23].person_emotion = "none";
    need[23].rob_emotion = "Angry";
    need[23].speech = "小明爸爸您好";
    need[23].weight = 0.90;

    need[24].need_name = "Doubt";
    need[24].person_name= "Parent Ming";
    need[24].person_emotion = "none";
    need[24].rob_emotion = "Doubt";
    need[24].speech = "请问您是来参加家长会的吗";
    need[24].weight = 0.90;

    need[25].need_name = "MeasureTempareture";
    need[25].person_name= "Parent Ming";
    need[25].person_emotion = "none";
    need[25].rob_emotion = "Nomal";
    need[25].speech = "小刚同学，请配合我的工作，否则我就通知老师了";
    need[25].weight = 0.90;

    need[26].need_name = "Pass";
    need[26].person_name= "Parent Ming";
    need[26].person_emotion = "none";
    need[26].rob_emotion = "Nomal";
    need[26].speech = "小刚同学，请配合我的工作，否则我就通知老师了";
    need[26].weight = 0.90;

    need[27].need_name = "Answer";
    need[27].person_name= "Parent Ming";
    need[27].person_emotion = "none";
    need[27].rob_emotion = "Happy";
    need[27].speech = "很高兴为你服务";
    need[27].weight = 0.90;

    need[28].need_name = "Greet";
    need[28].person_name= "HeadMaster";
    need[28].person_emotion = "none";
    need[28].rob_emotion = "Happy";
    need[28].speech = "校长早上好，请问有什么事吗";
    need[28].weight = 0.90;

    need[29].need_name = "Answer";
    need[29].person_name= "HeadMaster";
    need[29].person_emotion = "none";
    need[29].rob_emotion = "Nomal";
    need[29].speech = "小刚家长还没有到学校哦";
    need[29].weight = 0.90;

    need[30].need_name = "MeasureTempareture";
    need[30].person_name= "Ming";
    need[30].person_emotion = "none";
    need[30].rob_emotion = "Nomal";
    need[30].speech = "...";
    need[30].weight = 0.50;

    need[31].need_name = "StopStranger";
    need[31].person_name= "Ming";
    need[31].person_emotion = "none";
    need[31].rob_emotion = "Nomal";
    need[31].speech = "工作期间不能闲聊";
    need[31].weight = 0.90;

    while(ros::ok())
    {
        int nn = 1;//1 测试 2 跑脚本
        if(nn == 1){
            if(count==2)// 111
            // if(count==23)
            {
                i = 30;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==6)// 111
            // if(count==23)
            {
                i = 31;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
        }
        else{
            //  1.1
            if(count==3)
            {
                i = 2;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            // 1.3
            if(count==8)
            {
                i = 0;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            // 1.4 体温检测，放行
            if(count==19)
            {
                i = 3;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==30)
            {
                i = 6;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            //1.6
            if(count==41)
            {
                i = 2;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            //1.7 Xiaohong

            if(count==45)//greet xiaohong
            {
                i = 7;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==56)//MeasureTempareture xiaohong
            {
                i = 8;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==67)//pass xiaohong
            {
                i = 9;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==78)//remind xiaohong
            {
                i = 10;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
        // 1.8迎接小明和小刚
            if(count==89)//
            // if(count==2)
            {
                i = 11;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==91)//100
            // if(count==5)
            {
                i = 12;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            //1.9小明的入校检查，并行
            if(count==93)// 111
            // if(count==23)
            {
                i = 13;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==95)// 122
            {
                i = 14;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            //1.10小刚的入校检查 133
            if(count==97)
            // if(count == 2)
            {
                i = 15;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==99)//144 pass
            {
                i = 16;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==155)//remind
            {
                i = 17;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            //1.11
            if(count==160)//wander
            {
                i = 18;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==170)//stop
            {
                i = 19;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            //1.12
            if(count==181)//greet
            {
                i = 20;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==192)//temp
            {
                i = 21;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==203)//pass
            {
                i = 22;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            //1.13
            if(count==214)//greet
            {
                i = 23;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==225)//doubt
            {
                i = 24;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            //1.14
            if(count==236)//temp
            {
                i = 25;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==247)//pass
            {
                i = 26;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==258)//answer
            {
                i = 27;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            //1.15
            if(count==269)//greet
            {
                i = 28;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
            if(count==280)//answer
            {
                i = 29;   
                ROS_INFO("%s, %s, %s, %s, %s, %.2f",need[i].need_name.c_str(), need[i].person_name.c_str(), 
                need[i].person_emotion.c_str(), need[i].rob_emotion.c_str(), need[i].speech.c_str(), need[i].weight);
                chatter_pub.publish(need[i]);
            }
        }
        ros::spinOnce();

        loop_rate.sleep();
        ++count;
    }
    return 0;
}