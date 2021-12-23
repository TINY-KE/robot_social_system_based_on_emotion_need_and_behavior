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
#include "social_msg/bhvPara.h"
#include "social_msg/bhvReply.h"
#include "social_msg/bhvQueue.h"
#include "sensor_msgs/Image.h"
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
  void Callback_emotion(const social_msg::robot_emotion &msg);
  void Callback_emotion_image(const sensor_msgs::Image &msg);
  void Callback_body(const social_msg::robot_status &msg);
  void Callback_percetion(const social_msg::perception_msg &msg);
  void Callback_need(const social_msg::need_msg &msg);
  void Callback_bhvPara(const social_msg::bhvPara &msg);
  void Callback_bhvReply(const social_msg::bhvReply &msg);
  void Callback_bhvQueue(const social_msg::bhvQueue &msg);


Q_SIGNALS:
	void loggingUpdated();
  void rosShutdown();
  void loggingUpdated_body();
  void loggingUpdated_perception();

  void loggingUpdated_emotion();
  void loggingUpdated_emotion_image();

  void loggingUpdated_need();
  void loggingUpdated_need_newest();
  void loggingUpdated_need_prior();

  void loggingUpdated_bhvPara();
  void loggingUpdated_bhvReply();
  void loggingUpdated_bhvQueue();

private:
	int init_argc;
	char** init_argv;
	ros::Publisher chatter_publisher;
  ros::Subscriber subscriber_body;
  ros::Subscriber subscriber_perception;

  ros::Subscriber subscriber_emotion;
  ros::Subscriber subscriber_emotion_image;//  sensor_msgs/Image

  ros::Subscriber subscriber_need;
  ros::Subscriber subscriber_need_newest;
  ros::Subscriber subscriber_need_prior;

  ros::Subscriber subscriber_bhvPara;
  ros::Subscriber subscriber_bhvReply;
  ros::Subscriber subscriber_bhvQueue;

public:
  //emotion status
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
  int qt_order_largest = 0;
//  std::string need_name;
//  double need_weight;
//  std::string need_person;

  //bhvPara
  std::string gaze_target;
  std::string arm_action;
  int arm_rate;
  std::string leg_target;
  std::string leg_action;
  int leg_rate;
  int leg_distance;
  std::string screen_type;
  int sound_tone;
  int sound_rate;
  std::string speech_content;
  std::string Ebhv_action;
  std::string Ebhv_target;
  std::string Hbhv_action;
  std::string Hbhv_target;
  int gaze_call;
  int screen_call;
  int sound_call;
  int arm_call;
  int leg_call;
  bool gaze_color_flag;
  bool screen_color_flag;
  bool sound_color_flag;
  bool arm_color_flag;
  bool leg_color_flag;
  int gaze_startTime;
  int gaze_endTime;
  int screen_startTime;
  int screen_endTime;
  int sound_startTime;
  int sound_endTime;
  int arm_startTime;
  int arm_endTime;
  int leg_starTime;
  int leg_endTime;
  int bhv_Reply;
  int bhv_curOrder;
  //判断Ebhv还是Hbhv：0正常（Ebhv）1插入（Ebhv绿 Ebhv黄 Ebhv绿） 2并发（Ebhv绿 Hbhv黄）
  int UI_color_judge;
  int bhvQueue_num;
  std::string bhvQueue_need[10];
  std::string bhvQueue_obj[10];

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
