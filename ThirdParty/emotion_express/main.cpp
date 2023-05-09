/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2022-04-14 22:17:45
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2023-05-09 10:46:26
 */
#include<ros/ros.h>
#include<string>

#include<cv_bridge/cv_bridge.h>
#include<sensor_msgs/image_encodings.h>
#include<image_transport/image_transport.h>

#include<opencv2/opencv.hpp>
#include<opencv2/highgui/highgui.hpp>
#include<opencv2/imgproc/imgproc.hpp>

#include<stdio.h>

#include <social_msg/need_msg.h>
#include <social_msg/bhvPara.h>
using namespace cv;
using namespace std;

ros::Subscriber sub_need;
ros::Subscriber sub_bhv;
image_transport::Publisher pub;
void video_transport( string video_location){
    ros::Rate loop_rate(24);
    sensor_msgs::ImagePtr msg;
    // opencv准备读取视频
    cv::VideoCapture video;
    video.open(video_location);

    if( !video.isOpened() )
    {
        ROS_INFO("Read Video failed!\n");
    }
    Mat frame;
    int count = 0;
    while(1)
    {
        video >> frame;
        if( frame.empty() )
            break;
        count++;

        msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", frame).toImageMsg();
        pub.publish(msg);

        // ROS_INFO( "read the %dth frame successfully!", count );
        loop_rate.sleep();
        ros::spinOnce();
    }
    video.release();
}

void needCallback(const social_msg::need_msg &msg){
    std::cout << "QNode::Callback_need" << std::endl;
    string emotion = msg.rob_emotion;
    string intensity = to_string(msg.rob_emotion_intensity);
    string video_location = "./video/" + emotion + intensity + ".mp4";
    video_transport(video_location);
}

void bhvCallback(const social_msg::bhvPara &msg){
    std::cout << "QNode::Callback_bhv" << std::endl;
    int behavior_type_1 = msg.num / 1%10;	
    int behavior_type_10 = msg.num / 10%10;
    int behavior_type_100 = msg.num / 100%10;
    if( (behavior_type_100 == 1) && ((behavior_type_10 != 0) || (behavior_type_1 != 0)) ){
        
    }
    else{
        string emotion = msg.emotion.type;
        string intensity = to_string(msg.emotion.rob_emotion_intensity);
        string video_location = "./video/" + emotion + intensity + ".mp4";
        video_transport(video_location);
    }
}


int main(int argc, char** argv)
{
    // ROS节点初始化
    ros::init(argc, argv, "image_publisher");
    ros::NodeHandle n; 
    ros::Time time = ros::Time::now();

     // 定义pub节点句柄   
    image_transport::ImageTransport it(n);
    //image_transport::Publisher pub = it.advertise("/camera/rgb/image_raw", 1);
    
    // string emotion = "Calm";
    // string intensity = to_string(0);
    // string video_location = "./video/" + emotion + intensity + ".mp4";
    // video_transport(video_location);

    pub = it.advertise("emotion_img", 10);
           
     // 定义sub节点句柄 
    // sub_need = n.subscribe("need_lists", 10,   needCallback);  //<social_msg::need_msg>
    sub_bhv = n.subscribe("behavior_pub", 10,   bhvCallback);  //<social_msg::bhvPara
    ros::spin();
    return 0;
}
