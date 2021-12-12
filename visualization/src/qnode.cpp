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
  subscriber_emotion = n.subscribe("robot_emotion", 1000, &QNode::Callback_emotion, this);
  subscriber_body = n.subscribe("robot_status", 1000, &QNode::Callback_body, this);
  subscriber_perception = n.subscribe("perceptions", 1000, &QNode::Callback_percetion, this);
  subscriber_need = n.subscribe("need_lists", 1000, &QNode::Callback_need, this);

  ros::spin();
  std::cout << "Ros shutdown, proceeding to close the gui." << std::endl;
  Q_EMIT rosShutdown(); // used to signal the gui for a shutdown (useful to roslaunch)
}



//add
void QNode::Callback_emotion(const visualize::robot_emotion &msg)
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
  Q_EMIT loggingUpdated_emotion();
}
void QNode::Callback_body(const visualize::robot_status &msg){
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
void QNode::Callback_percetion(const visualize::perception_msg &msg){
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
void QNode::Callback_need(const visualize::need_msg &msg){
  std::cout << "QNode::Callback_need" << std::endl;
  need_cur.name  = msg.need_name;
  need_cur.weight = msg.weight;
  need_cur.person = msg.person_name;
  need_list.push_back(need_cur);
  need_list_sort();

  Q_EMIT loggingUpdated_need();
  sleep(3);
}

bool QNode::comp( need &a,need &b)
{
    return (a.weight > b.weight);
}

void QNode::need_list_sort(){
    sort( need_list.begin(),  need_list.end(),  comp );
}
}  // namespace msg
