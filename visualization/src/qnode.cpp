/**
 * @file /src/qnode.cpp
 *
 * @brief Ros communication central!
 *
 * @date February 2011
 **/

/*****************************************************************************
** Includes
*****************************************************************************/

#include <ros/ros.h>
#include <ros/network.h>
#include <string>
#include <std_msgs/String.h>
#include <sstream>
#include "../include/msg/qnode.hpp"



#include<sensor_msgs/image_encodings.h>


/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace msg {

/*****************************************************************************
** Implementation
*****************************************************************************/

QNode::QNode(int argc, char** argv ) :
	init_argc(argc),
	init_argv(argv)
	{}

QNode::~QNode() {
    if(ros::isStarted()) {
      ros::shutdown(); // explicitly needed since we use ros::start();
      ros::waitForShutdown();
    }
	wait();
}

bool QNode::init() {
	ros::init(init_argc,init_argv,"msg");
	if ( ! ros::master::check() ) {
		return false;
	}
	start();
	return true;
}

bool QNode::init(const std::string &master_url, const std::string &host_url) {
	std::map<std::string,std::string> remappings;
  remappings["__master"] = master_url;
	remappings["__hostname"] = host_url;
	ros::init(remappings,"msg");
	if ( ! ros::master::check() ) {
		return false;
	}
	start();
	return true;
}

void QNode::run() {

  std::cout << "change  2." << std::endl;
  ros::start(); // explicitly needed since our nodehandle is going out of scope.
  ros::NodeHandle n;
  // Add your ros communications here.
  subscriber_body = n.subscribe("robot_status", 1000, &QNode::Callback_body, this);
  subscriber_perception = n.subscribe("perceptions", 1000, &QNode::Callback_percetion, this);

  subscriber_emotion = n.subscribe("robot_emotion", 1000, &QNode::Callback_emotion, this);   //(2))
  subscriber_emotion_image = n.subscribe("emotion_img", 1000, &QNode::Callback_emotion_image, this);   //    subscriber_emotion_image;//  sensor_msgs/Image

  subscriber_need = n.subscribe("need_lists", 1000, &QNode::Callback_need, this);
//  subscriber_need_newest =  no use

  subscriber_bhvPara = n.subscribe("behavior_pub", 1000, &QNode::Callback_bhvPara, this);
  subscriber_bhvReply = n.subscribe("behavior_Reply", 1000, &QNode::Callback_bhvReply, this);
  subscriber_bhvQueue = n.subscribe("behaviorQ_pub", 1000, &QNode::Callback_bhvQueue, this);
  ros::spin();
  std::cout << "Ros shutdown, proceeding to close the gui." << std::endl;
  Q_EMIT rosShutdown(); // used to signal the gui for a shutdown (useful to roslaunch)
}



//add
void QNode::Callback_emotion(const social_msg::robot_emotion &msg)
{
  std::cout << "QNode::Callback_emotion" << std::endl;
  emotion1 = msg.emotion1;
  emotion2 = msg.emotion2;
  emotion3 = msg.emotion3;
  emotion4 = msg.emotion4;
  emotion5 = msg.emotion5;
  emotion6 = msg.emotion6;
  emotion7 = msg.emotion7;
  emotion8 = msg.emotion8;
  Q_EMIT loggingUpdated_emotion();      //(2.2)  singal to qt
}
void QNode::Callback_emotion_image(const sensor_msgs::Image &msg)
{
  std::cout << "QNode::Callback_emotion_image" << std::endl;
//  cv::Mat image = cv_bridge::toCvShare(msg, "bgr8")->image;
//  cv_bridge::CvImagePtr cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
//  cv::imshow("view", cv_ptr->image);
  Q_EMIT loggingUpdated_emotion();      //(2.2)  singal to qt
}
void QNode::Callback_body(const social_msg::robot_status &msg){
  std::cout << "QNode::Callback_body" << std::endl;
  body1 = msg.body1;
  body2 = msg.body2;
  body3 = msg.body3;
  body4 = msg.body4;
  body5 = msg.body5;
  body6 = msg.body6;
  body7 = msg.body7;
  body8 = msg.idleState;
  Q_EMIT loggingUpdated_body();
}

void QNode::Callback_percetion(const social_msg::perception_msg &msg){

  std::cout << "QNode::Callback_perception" << std::endl;
  per_time = msg.time;
  per_person = msg.person_name;
  per_person_IDtype = msg.IDtype;
  per_intention = msg.intention;
  per_p = msg.p;
  per_speech = msg.speech;
  per_personEmotion = msg.person_emotion;
  Q_EMIT loggingUpdated_perception();
}
void QNode::Callback_need(const social_msg::need_msg &msg){
  std::cout << "QNode::Callback_need" << std::endl;
  need_cur.name  = msg.need_name;
  need_cur.weight = msg.weight;
  need_cur.person = msg.person_name;

  //  原来展示 need序列的。但现在 有了行为序列 不需要了
  //  need_list.push_back(need_cur);
  //  need_list_sort();

  if( msg.qt_order == qt_order_largest){
      need_list.push_back(need_cur);
  }
  else  if(msg.qt_order > qt_order_largest){
      qt_order_largest = msg.qt_order;
      need_list.clear();
      need_list.push_back(need_cur);
  }

  Q_EMIT loggingUpdated_need();
//  sleep(3);
}

void QNode::Callback_bhvPara(const social_msg::bhvPara &msg){
  std::cout << "QNode::Callback_bhvPara ------ " << msg.Needs<< std::endl;
  Ebhv_action = msg.Needs;
  Ebhv_target = msg.gaze.target;
//  Hbhv_action = msg.HeadBehavior;
//  Hbhv_target = msg.HeadBehavior_person;
  UI_color_judge = msg.num%1000/100;
  bhv_curOrder = msg.CurOrder;
  gaze_call = msg.gaze.call;
  arm_call = msg.arms.call;
  sound_call = msg.speech.call;
  screen_call = msg.emotion.call;
  leg_call = msg.legs.call;
  if(msg.gaze.call != 0){
    //gaze_call = msg.gaze.call;
    gaze_target = msg.gaze.target;
    gaze_startTime = msg.gaze.startTime;
    gaze_endTime = msg.gaze.endTime;
    gaze_color_flag = msg.gaze.IsYellow;
  }
  if(msg.arms.call != 0){
    arm_action = msg.arms.action;
    arm_rate = msg.arms.rate;
    arm_startTime = msg.arms.startTime;
    arm_endTime = msg.arms.endTime;
    //arm_call = msg.arms.call;
    arm_color_flag = msg.arms.IsYellow;
  }
  if(msg.speech.call != 0){
    sound_tone = msg.speech.tone;
    sound_rate = msg.speech.rate;
    speech_content = msg.speech.content;
    sound_startTime = msg.speech.startTime;
    sound_endTime = msg.speech.endTime;
    //sound_call = msg.speech.call;
    sound_color_flag = msg.speech.IsYellow;
  }
  if(msg.emotion.call != 0){
    screen_type = msg.emotion.type;
    screen_startTime = msg.emotion.startTime;
    screen_endTime = msg.emotion.endTime;
   // screen_call = msg.emotion.call;
    screen_color_flag = msg.emotion.IsYellow;
  }
  if(msg.legs.call != 0){
    leg_target = msg.legs.target;
    leg_action = msg.legs.action;
    leg_rate = msg.legs.rate;
    leg_distance = msg.legs.distance;
    leg_starTime = msg.legs.startTime;
    leg_endTime = msg.legs.endTime;
    //leg_call = msg.legs.call;
    leg_color_flag = msg.legs.IsYellow;
  }
  Q_EMIT loggingUpdated_bhvPara();
}

void QNode::Callback_bhvReply(const social_msg::bhvReply &msg){
  std::cout << "QNode::Callback_bhvReply" << std::endl;
  bhv_Reply = msg.reply;

  Q_EMIT loggingUpdated_bhvReply();
}


void QNode::Callback_bhvQueue(const social_msg::bhvQueue &msg){
  std::cout << "QNode::Callback_bhvQueue" << std::endl;
  bhvQueue_num = msg.n;
  for(int i=0; i<bhvQueue_num; i++){
      bhvQueue_need[i] = msg.need[i];
      bhvQueue_obj[i] = msg.obj[i];
  }

  Q_EMIT loggingUpdated_bhvQueue();
}

bool QNode::comp( need &a,need &b)
{
    return (a.weight > b.weight);
}

void QNode::need_list_sort(){
    sort( need_list.begin(),  need_list.end(),  comp );
}
}  // namespace msg
