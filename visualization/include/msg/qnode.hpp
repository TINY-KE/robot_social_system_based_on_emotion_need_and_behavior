/**
 * @file /include/msg/qnode.hpp
 *
 * @brief Communications central!
 *
 * @date February 2011
 **/
/*****************************************************************************
** Ifdefs
*****************************************************************************/

#ifndef msg_QNODE_HPP_
#define msg_QNODE_HPP_

/*****************************************************************************
** Includes
*****************************************************************************/

// To workaround boost/qt4 problems that won't be bugfixed. Refer to
//    https://bugreports.qt.io/browse/QTBUG-22829
#ifndef Q_MOC_RUN
#include <ros/ros.h>
#endif

#include <QThread>
#include <QStringListModel>
#include <std_msgs/String.h>  //add

#include "social_msg/perception_msg.h"
#include "social_msg/need_msg.h"
#include "social_msg/robot_emotion.h"
#include "social_msg/robot_status.h"
#include "social_msg/need_compare.h"

#include "common.h"
/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace msg {

/*****************************************************************************
** Class
*****************************************************************************/

class QNode : public QThread {
    Q_OBJECT
public:
	QNode(int argc, char** argv );
	virtual ~QNode();
	bool init();
	bool init(const std::string &master_url, const std::string &host_url);
	void run();

	/*********************
	** Logging
	**********************/
	enum LogLevel {
	         Debug,
	         Info,
	         Warn,
	         Error,
	         Fatal
	 };

//	QStringListModel* loggingModel() { return &logging_model; }
//	void log( const LogLevel &level, const std::string &msg);
//  QStringListModel* loggingModel_sub() { return &logging_model_sub; } //add
//  void log_sub( const LogLevel &level, const std::string &msg); //add
  void Callback_emotion(const social_msg::robot_emotion &msg);   //(1,2)call back  program
  void Callback_body(const social_msg::robot_status &msg);
  void Callback_percetion(const social_msg::perception_msg &msg);
  void Callback_need(const social_msg::need_msg &msg);
//  void Callback_behavior(const social_msg::behavior &msg);
//  void Callback_reply(const social_msg::behavior &msg);
//  void Callback_behavior_queue(const social_msg::behavior &msg);
Q_SIGNALS:    //(2)  connect  ros and  qt
	void loggingUpdated();
  void rosShutdown();
  void loggingUpdated_emotion();  //add
  void loggingUpdated_body();  //add
  void loggingUpdated_perception();  //add   (2.1)
  void loggingUpdated_need();  //add
//  void loggingUpdated_body();  //add
//  void loggingUpdated_perception();  //add
//  void loggingUpdated_need();  //add
private:
	int init_argc;
	char** init_argv;
	ros::Publisher chatter_publisher;
  ros::Subscriber subscriber_emotion;
  ros::Subscriber subscriber_body;    //(1.1))
  ros::Subscriber subscriber_perception;
  ros::Subscriber subscriber_need;
//  ros::Subscriber subscriber_perception;
//  ros::Subscriber subscriber_need;
//  ros::Subscriber subscriber_perception;
//  ros::Subscriber subscriber_need;

public:
  //emotion status   (3))通过sub  callback函数   把topic的内容 存储到成员变量中。
  double emotion1;
  double emotion2;
  double emotion3;
  double emotion4;
  double emotion5;
  double emotion6;
  double emotion7;
  double emotion8;
  //body status
  double body1;
  double body2;
  double body3;
  double body4;
  double body5;
  double body6;
  double body7;
  double body8;
  //perception
  double per_time;
  std::string per_person;
  std::string per_person_IDtype;
  std::string per_intention;
  double per_p;
  std::string per_personEmotion;
  std::string per_speech;
  //need
  std::vector<need> need_list;
//  std::string need_name;
//  double need_weight;
//  std::string need_person;

//  double need_answer;
//  double need_greet;
//  double need_parent_ensure;
//  double need_tempareture_check;
//  double need_charge;
//  double need_chat;
//  double need_question;
//  double need_wander;

//  std::string need_answer_person;
//  std::string need_greet_person;
//  std::string need_parent_ensure_person;
//  std::string need_tempareture_check_person;
//  std::string need_charge_person;
//  std::string need_chat_person;
//  std::string need_question_person;
//  std::string need_wander_person;

//  QStringListModel per_intention;
public:
  static bool comp( need &a,need &b);
  need need_cur;
  void need_list_sort();

};

}  // namespace msg

#endif /* msg_QNODE_HPP_ */
