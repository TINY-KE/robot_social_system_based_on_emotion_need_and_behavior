/**
 * @file /src/main_window.cpp
 *
 * @brief Implementation for the qt gui.
 *
 * @date February 2011
 **/
/**********************************tab_manager******************************************
** Includes
*****************************************************************************/

#include <QtGui>
#include <QMessageBox>
#include <iostream>
#include "../include/msg/main_window.hpp"
//QTextCodec::setCodecForCStrings(QTextCodec::codecForName("GB2312"));
/*****************************************************************************
** Namespaces
*****************************************************************************/
std::string Curtemp1,Curtemp2;
namespace msg {

using namespace Qt;

/*****************************************************************************
** Implementation [MainWindow]
*****************************************************************************/

MainWindow::MainWindow(int argc, char** argv, QWidget *parent)
	: QMainWindow(parent)
	, qnode(argc,argv)
{
    ui.setupUi(this); // Calling this incidentally connects all ui's triggers to on_...() callbacks in this class.
    ui.dock_status->setHidden(true);
    QObject::connect(ui.actionAbout_Qt, SIGNAL(triggered(bool)), qApp, SLOT(aboutQt())); // qApp is a global variable for the application

    ReadSettings();
	setWindowIcon(QIcon(":/images/icon.png"));
    QObject::connect(&qnode, SIGNAL(rosShutdown()), this, SLOT(close()));

/*xiaopang robot*/
    QImage *img=new QImage; //新建一个image对象
    img->load(":/new/prefix1/images/xiaopang.png"); //将图像资源载入对象img，注意路径，可点进图片右键复制路径
    ui.label_xiaopang -> setPixmap(QPixmap::fromImage(*img));



  /*********************
	** Logging
	**********************/

    QObject::connect(&qnode, SIGNAL(loggingUpdated()), this, SLOT(updateLoggingView()));
    QObject::connect(&qnode, SIGNAL(loggingUpdated_emotion()), this, SLOT(updateLoggingView_emotion()));
    QObject::connect(&qnode, SIGNAL(loggingUpdated_body()), this, SLOT(updateLoggingView_body()));
    QObject::connect(&qnode, SIGNAL(loggingUpdated_perception()), this, SLOT(updateLoggingView_perception()));
    QObject::connect(&qnode, SIGNAL(loggingUpdated_need()), this, SLOT(updateLoggingView_need()));
    QObject::connect(&qnode, SIGNAL(loggingUpdated_bhvPara()), this, SLOT(updateLoggingView_bhvPara()));
    QObject::connect(&qnode, SIGNAL(loggingUpdated_bhvReply()), this, SLOT(updateLoggingView_bhvReply()));
    QObject::connect(&qnode, SIGNAL(loggingUpdated_bhvQueue()), this, SLOT(updateLoggingView_bhvQueue()));
    //(1.1)qt  connect   ros singal  and  ui_progrem
//    QObject::connect(&qnode, SIGNAL(loggingUpdated_need()), this, SLOT(updateLoggingView_need()));

    /*********************
    ** Auto Start
    **********************/
    qnode.init();
//    if ( ui.checkbox_remember_settings->isChecked() ) {
//        on_button_connect_clicked(true);
//    }
}

MainWindow::~MainWindow() {}

/*****************************************************************************
** Implementation [Slots]
*****************************************************************************/

void MainWindow::showNoMasterMessage() {
	QMessageBox msgBox;
	msgBox.setText("Couldn't find the ros master.");
	msgBox.exec();
    close();
}

/*
 * These triggers whenever the button is clicked, regardless of whether it
 * is already checked or not.
 */

void MainWindow::on_button_connect_clicked(bool check ) {
  if ( ui.checkbox_use_environment->isChecked() ) {
    if ( !qnode.init() ) {
      showNoMasterMessage();
    } else {
      ui.button_connect->setEnabled(false);
    }
  } else {
    if ( ! qnode.init(ui.line_edit_master->text().toStdString(),
           ui.line_edit_host->text().toStdString()) ) {
      showNoMasterMessage();
    } else {
      ui.button_connect->setEnabled(false);
      ui.line_edit_master->setReadOnly(true);
      ui.line_edit_host->setReadOnly(true);
      ui.line_edit_topic->setReadOnly(true);

    }
  }
}


void MainWindow::on_checkbox_use_environment_stateChanged(int state) {
	bool enabled;
	if ( state == 0 ) {
		enabled = true;
	} else {
		enabled = false;
	}
	ui.line_edit_master->setEnabled(enabled);
	ui.line_edit_host->setEnabled(enabled);
	//ui.line_edit_topic->setEnabled(enabled);
}

/*****************************************************************************
** Implemenation [Slots][manually connected]
*****************************************************************************/

/**
 * This function is signalled by the underlying model. When the model changes,
 * this will drop the cursor down to the last line in the QListview to ensure
 * the user can always see the latest log message.
 */
//(2))  progrem to update ui
//void updateLoggingView_behavior(){}
//void updateLoggingView_reply(){}
//void updateLoggingView_behavior_queue(){}

void MainWindow::updateLoggingView() {
}
//add
//进度条分段函数
QString MainWindow::calcValue(int nValue, QString color1, QString color2, QString color3, int breakpoint1, int breakpoint2){
    float scale_A, scale_a, scale_B, scale_b;
    QString str1, str1a, str2, str2a;
    QString strStyle = "";
    if(breakpoint1 == 0)
        breakpoint1 = breakpoint1 + 0.001;
    if(nValue < breakpoint1)
    {
      strStyle = color1;
    }
    else if(nValue >= breakpoint1 && nValue < breakpoint2) {
      scale_A = (float)breakpoint1 / (float)nValue;
      scale_a = scale_A + 0.001;
      str1 = str1.setNum(scale_A,'f',6);
      str1a = str1a.setNum(scale_a,'f',6);
      strStyle = QString("qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 %1, stop:%2 %3, stop:%4 %5, stop:1 %6)")
                      .arg(color1)
                      .arg(str1)
                      .arg(color1)
                      .arg(str1a)
                      .arg(color2)
                      .arg(color2);
    }
    else{
      scale_A = (float)breakpoint1 / (float)nValue;
      scale_a = scale_A + 0.000004;
      if(breakpoint2 == 100)
          breakpoint2 = 99.9999;
      scale_B = (float)breakpoint2 / (float)nValue;

//          scale_b = scale_B;
//      else
      scale_b = scale_B + 0.000004;
      str1 = str1.setNum(scale_A,'f',6);
      str1a = str1a.setNum(scale_a,'f',6);
      str2 = str2.setNum(scale_B,'f',6);
      str2a = str2a.setNum(scale_b,'f',6);
      strStyle = QString("qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 %1, stop:%2 %3, stop:%4 %5, stop:%6 %7, stop:%8 %9, stop:1 %10)")
                      .arg(color1)
                      .arg(str1)
                      .arg(color1)
                      .arg(str1a)
                      .arg(color2)
                      .arg(str2)
                      .arg(color2)
                      .arg(str2a)
                      .arg(color3)
                      .arg(color3);
    }
    return strStyle;
}
//progressBar_behavior_gaze设置
void MainWindow::slt_valueChanged_gaze(int value, int breakpoint1, int breakpoint2,  QString color){
  ui.progressBar_behavior_gaze->setValue(value);
  ui.progressBar_behavior_gaze->setStyleSheet(QString(""

      "	QProgressBar {"

      "	border: 2px solid grey;"

      "	border-radius: 5px;"

      ""

      "}"



      "QProgressBar::chunk {"

          "	background-color: "

          "%1;"

      "}").arg(calcValue(value,"white", color, "white", breakpoint1, breakpoint2)));
}

void MainWindow::slt_valueChanged_screen(int value, int breakpoint1, int breakpoint2,  QString color){
  ui.progressBar_behavior_screen->setValue(value);
  ui.progressBar_behavior_screen->setStyleSheet(QString(""

      "	QProgressBar {"

      "	border: 2px solid grey;"

      "	border-radius: 5px;"

      ""

      "}"



      "QProgressBar::chunk {"

          "	background-color: "

          "%1;"

      "}").arg(calcValue(value,"white", color, "white", breakpoint1, breakpoint2)));
}

void MainWindow::slt_valueChanged_sounder(int value, int breakpoint1, int breakpoint2,  QString color){
  ui.progressBar_behavior_sounder->setValue(value);
  ui.progressBar_behavior_sounder->setStyleSheet(QString(""

      "	QProgressBar {"

      "	border: 2px solid grey;"

      "	border-radius: 5px;"

      ""

      "}"



      "QProgressBar::chunk {"

          "	background-color: "

          "%1;"

      "}").arg(calcValue(value,"white", color, "white", breakpoint1, breakpoint2)));
}

void MainWindow::slt_valueChanged_arm(int value, int breakpoint1, int breakpoint2,  QString color){
  ui.progressBar_behavior_arm->setValue(value);
  ui.progressBar_behavior_arm->setStyleSheet(QString(""

      "	QProgressBar {"

      "	border: 2px solid grey;"

      "	border-radius: 5px;"

      ""

      "}"



      "QProgressBar::chunk {"

          "	background-color: "

          "%1;"

      "}").arg(calcValue(value,"white", color, "white", breakpoint1, breakpoint2)));
}

void MainWindow::slt_valueChanged_leg(int value, int breakpoint1, int breakpoint2,  QString color){
  ui.progressBar_behavior_leg->setValue(value);
  ui.progressBar_behavior_leg->setStyleSheet(QString(""

      "	QProgressBar {"

      "	border: 2px solid grey;"

      "	border-radius: 5px;"

      ""

      "}"



      "QProgressBar::chunk {"

          "	background-color: "

          "%1;"

      "}").arg(calcValue(value,"white", color, "white", breakpoint1, breakpoint2)));
}


void MainWindow::updateLoggingView_bhvPara() {
  //QPalette pal =ui.lineEdit_executing_behavior_type->QPalette();
//  QPalette palette_green,palette_orange,palette_black;
//  palette_green.setColor(QPalette::Text, QColor(0, 205, 102));
//  palette_orange.setColor(QPalette::Text, QColor(255, 165, 0));
//  palette_black.setColor(QPalette::Text, QColor(0, 0, 0));

    if(qnode.gaze_call != 0){
     ui.lineEdit_behavior_gaze_target->setText(QString::fromStdString(qnode.gaze_target));
    }
    if(qnode.arm_call != 0){
      ui.lineEdit_behavior_arm_action->setText(QString::fromStdString(qnode.arm_action));
      ui.lineEdit_behavior_arm_rate->setText(QString::number(qnode.arm_rate,'f',2));
    }
    if(qnode.leg_call != 0){
      ui.lineEdit_behavior_leg_target->setText(QString::fromStdString(qnode.leg_target));
      ui.lineEdit_behavior_leg_action->setText(QString::fromStdString(qnode.leg_action));
      ui.lineEdit_behavior_leg_rate->setText(QString::number(qnode.leg_rate,'f',2));
      ui.lineEdit_behavior_leg_distance->setText(QString::number(qnode.leg_distance,'f',2));
    }
    if(qnode.screen_call != 0){
      ui.lineEdit_behavior_screen_type->setText(QString::fromStdString(qnode.screen_type));
    }
    if(qnode.sound_call != 0){
      ui.lineEdit_behavior_sounder_tone->setText(QString::number(qnode.sound_tone,'f',2));
      ui.lineEdit_behavior_sounder_rate->setText(QString::number(qnode.sound_rate,'f',2));
      ui.lineEdit_behavior_sounder_content->setText(QString::fromStdString(qnode.speech_content));
    }
  if(qnode.UI_color_judge == 0){
    ui.lineEdit_executing_behavior_type->setText(QString::fromStdString(qnode.Ebhv_action));
    ui.lineEdit_executing_behavior_person->setText(QString::fromStdString(qnode.Ebhv_target));
  }
  else if(qnode.UI_color_judge == 1){
    if(qnode.bhv_curOrder == 3 ){
      ui.lineEdit_executing_behavior_type->setStyleSheet(QString("color:orange"));
      ui.lineEdit_executing_behavior_person->setStyleSheet(QString("color:orange"));
      ui.lineEdit_executing_behavior_type->setText(QString::fromStdString(qnode.Ebhv_action));
      ui.lineEdit_executing_behavior_person->setText(QString::fromStdString(qnode.Ebhv_target));
      ui.lineEdit_executing_behavior_type->setStyleSheet(QString("color:black"));
      ui.lineEdit_executing_behavior_person->setStyleSheet(QString("color:black"));
    }
    else{
      ui.lineEdit_executing_behavior_type->setStyleSheet("QLineEdit{color: 0x20B2AA;}");
      ui.lineEdit_executing_behavior_person->setStyleSheet("QLineEdit{color: 0x20B2AA;}");
//      ui.lineEdit_executing_behavior_type->setPalette(palette_green);
//      ui.lineEdit_executing_behavior_person->setPalette(palette_green);
//      ui.lineEdit_executing_behavior_type->setObjectName("green");
//      ui.lineEdit_executing_behavior_person->setObjectName("green");
      ui.lineEdit_executing_behavior_type->setText(QString::fromStdString(qnode.Ebhv_action));
      ui.lineEdit_executing_behavior_person->setText(QString::fromStdString(qnode.Ebhv_target));
      ui.lineEdit_executing_behavior_type->setStyleSheet("color:black");
      ui.lineEdit_executing_behavior_person->setStyleSheet("color:black");
    }
  }
  else if(qnode.UI_color_judge == 2){

      if(qnode.bhv_curOrder == 1){
        Curtemp1 = qnode.Ebhv_action;
        Curtemp2 = qnode.Ebhv_target;
      }
      else{
        ui.lineEdit_executing_behavior_type->setStyleSheet(QString("color:green"));
        ui.lineEdit_executing_behavior_person->setStyleSheet(QString("color:green"));
        ui.lineEdit_executing_behavior_type->setText(QString::fromStdString(Curtemp1));
        ui.lineEdit_executing_behavior_person->setText(QString::fromStdString(Curtemp2));
        ui.lineEdit_executing_behavior_type->setStyleSheet(QString("color:black"));
        ui.lineEdit_executing_behavior_person->setStyleSheet(QString("color:black"));

        ui.lineEdit_head_behavior_type->setStyleSheet(QString("color:orange"));
        ui.lineEdit_head_behavior_person->setStyleSheet(QString("color:orange"));
        ui.lineEdit_head_behavior_type->setText(QString::fromStdString(qnode.Ebhv_action));
        ui.lineEdit_head_behavior_person->setText(QString::fromStdString(qnode.Ebhv_target));
        ui.lineEdit_head_behavior_type->setStyleSheet(QString("color:black"));
        ui.lineEdit_head_behavior_person->setStyleSheet(QString("color:black"));
      }
  }
  //设置进度条
  //设置进度条
  if(qnode.gaze_call){
      if(qnode.gaze_color_flag) {
          slt_valueChanged_gaze(100, qnode.gaze_startTime, qnode.gaze_endTime, "orange");
      }
      else {
          slt_valueChanged_gaze(100, qnode.gaze_startTime, qnode.gaze_endTime, "green");
      }
  }
  if(qnode.screen_call){
      if(qnode.screen_color_flag) {
          slt_valueChanged_screen(100, qnode.screen_startTime, qnode.screen_endTime, "orange");
      }
      else {
          slt_valueChanged_screen(100, qnode.screen_startTime, qnode.screen_endTime, "green");
      }
  }
  if(qnode.sound_call){
      if(qnode.sound_color_flag) {
          slt_valueChanged_sounder(100, qnode.sound_startTime, qnode.sound_endTime, "orange");
      }
      else {
          slt_valueChanged_sounder(100, qnode.sound_startTime, qnode.sound_endTime, "green");
      }
  }
  if(qnode.arm_call){
      if(qnode.arm_color_flag) {
          slt_valueChanged_arm(100, qnode.arm_startTime, qnode.arm_endTime, "orange");
      }
      else {
          slt_valueChanged_arm(100, qnode.arm_startTime, qnode.arm_endTime, "green");
      }
  }
  if(qnode.leg_call){
      if(qnode.leg_color_flag) {
          slt_valueChanged_leg(100, qnode.leg_starTime, qnode.leg_endTime, "orange");
      }
      else {
          slt_valueChanged_leg(100, qnode.leg_starTime, qnode.leg_endTime, "green");
      }
  }
  //xiaoming temp

  //xiaogang temp


}
void MainWindow::updateLoggingView_bhvReply() {
    ui.progressBar_behavior_progress->setValue(int(qnode.bhv_Reply));


    if(qnode.bhv_Reply == 100){
      ui.lineEdit_executing_behavior_type->setText("");
      ui.lineEdit_executing_behavior_person->setText("");
      ui.lineEdit_head_behavior_type->setText("");
      ui.lineEdit_head_behavior_person->setText("");
      ui.lineEdit_behavior_gaze_target->setText("");
      ui.lineEdit_behavior_arm_action->setText("");
      ui.lineEdit_behavior_arm_rate->setText("");
      ui.lineEdit_behavior_leg_target->setText("");
      ui.lineEdit_behavior_leg_action->setText("");
      ui.lineEdit_behavior_leg_rate->setText("");
      ui.lineEdit_behavior_leg_distance->setText("");
      ui.lineEdit_behavior_screen_type->setText("");
      ui.lineEdit_behavior_sounder_tone->setText("");
      ui.lineEdit_behavior_sounder_rate->setText("");
      ui.lineEdit_behavior_sounder_content->setText("");

      ui.progressBar_behavior_screen->setValue(0);
      ui.progressBar_behavior_leg->setValue(0);
      ui.progressBar_behavior_arm->setValue(0);
      ui.progressBar_behavior_sounder->setValue(0);
      ui.progressBar_behavior_gaze->setValue(0);
    }
}
void MainWindow::updateLoggingView_bhvQueue() {
    QStringList list;
    int temp = qnode.bhvQueue_num;
    ui.listWidget->clear();
    for(int i=0; i<temp; i++){
        std::string s = qnode.bhvQueue_need[i] + "  for  " + qnode.bhvQueue_obj[i];
        //list<<QString::fromStdString(qnode.bhvQueue_need[i])<<QString::fromStdString(qnode.bhvQueue_obj[i]);
        list<<QString::fromStdString(s);
    }
    ui.listWidget->addItems(list);
}
//add
void MainWindow::updateLoggingView_emotion() {
  ui.progressBar_emotion1->setValue(int(qnode.emotion1*100));
  ui.lineEdit_emotion1->setText(QString::number(qnode.emotion1,'f',2));
  ui.progressBar_emotion2->setValue(int(qnode.emotion2*100));
  ui.lineEdit_emotion2->setText(QString::number(qnode.emotion2,'f',2));
  ui.progressBar_emotion3->setValue(int(qnode.emotion3*100));
  ui.lineEdit_emotion3->setText(QString::number(qnode.emotion3,'f',2));
  ui.progressBar_emotion4->setValue(int(qnode.emotion4*100));
  ui.lineEdit_emotion4->setText(QString::number(qnode.emotion4,'f',2));
  ui.progressBar_emotion5->setValue(int(qnode.emotion5*100));
  ui.lineEdit_emotion5->setText(QString::number(qnode.emotion5,'f',2));
  ui.progressBar_emotion6->setValue(int(qnode.emotion6*100));
  ui.lineEdit_emotion6->setText(QString::number(qnode.emotion6,'f',2));
  ui.progressBar_emotion7->setValue(int(qnode.emotion7*100));
  ui.lineEdit_emotion7->setText(QString::number(qnode.emotion7,'f',2));
  ui.progressBar_emotion8->setValue(int(qnode.emotion8*100));
  ui.lineEdit_emotion8->setText(QString::number(qnode.emotion8,'f',2));
}
void MainWindow::updateLoggingView_body() {
  ui.progressBar_body1->setValue(int(qnode.body1*100));
  ui.lineEdit_body1->setText(QString::number(qnode.body1,'f',2));
  ui.progressBar_body2->setValue(int(qnode.body2*100));
  ui.lineEdit_body2->setText(QString::number(qnode.body2,'f',2));
  ui.progressBar_body3->setValue(int(qnode.body3*100));
  ui.lineEdit_body3->setText(QString::number(qnode.body3,'f',2));
  ui.progressBar_body4->setValue(int(qnode.body4*100));
  ui.lineEdit_body4->setText(QString::number(qnode.body4,'f',2));
  ui.progressBar_body5->setValue(int(qnode.body5*100));
  ui.lineEdit_body5->setText(QString::number(qnode.body5,'f',2));
  ui.progressBar_body6->setValue(int(qnode.body6*100));
  ui.lineEdit_body6->setText(QString::number(qnode.body6,'f',2));
  ui.progressBar_body7->setValue(int(qnode.body7*100));
  ui.lineEdit_body7->setText(QString::number(qnode.body7,'f',2));
  ui.progressBar_body8_atwork->setValue(int(qnode.body8*100));
  ui.lineEdit_body8->setText(QString::number(qnode.body8,'f',2));
}
void MainWindow::updateLoggingView_perception() {
  ui.lineEdit_per_time -> setText(QString::number(qnode.per_time,'f',2));
  ui.lineEdit_per_person -> setText(QString::fromStdString(qnode.per_person_IDtype));
  ui.lineEdit_per_person_name -> setText(QString::fromStdString(qnode.per_person));
  ui.lineEdit_per_intention -> setText(QString::fromStdString(qnode.per_intention));
  ui.lineEdit_per_p -> setText(QString::number(qnode.per_p,'f',2));
  ui.lineEdit_per_speech -> setText(QString::fromStdString(qnode.per_speech));
  ui.lineEdit_per_personEmotion -> setText(QString::fromStdString(qnode.per_personEmotion));
}
void MainWindow::updateLoggingView_need() {
  //listWidget
//  ui.listWidget->clear();
//  need_list = qnode.need_list;
//  for(int i =0; i < need_list.size();  i ++){
//    std::string s = need_list[i].name  +" for "+ need_list[i].person  +" as "+  std::to_string(need_list[i].weight);
//    QString list = QString::fromStdString(s);
//    ui.listWidget->addItem(list);
//  }

  //progressBar
//   {
//     //clear
//     ui.progressBar_need_answer->setValue(0);
//     ui.progressBar_need_charge->setValue(0);
//     ui.progressBar_need_chat->setValue(0);
//     ui.progressBar_need_greet->setValue(0);
//     ui.progressBar_need_parent_ensure->setValue(0);
//     ui.progressBar_need_question->setValue(0);
//     ui.progressBar_need_remind->setValue(0);
//     ui.progressBar_need_tempareture_check->setValue(0);
//     ui.progressBar_need_wander ->setValue(0);
//     ui.progressBar_need_KeepOrder ->setValue(0);
//     ui.progressBar_need_StopStranger ->setValue(0);

//     ui.lineEdit_need_answer  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_charge  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_chat  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_greet  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_parent_ensure  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_question  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_remind  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_tempareture_check  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_wander  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_KeepOrder  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_StopStranger  -> setText(QString::fromStdString(""));

//     ui.lineEdit_need_answer_2  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_charge_2  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_chat_2  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_greet_2  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_parent_ensure_2  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_question_2  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_remind_2  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_tempareture_check_2  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_wander_2  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_KeepOrder_2  -> setText(QString::fromStdString(""));
//     ui.lineEdit_need_StopStranger_2  -> setText(QString::fromStdString(""));
//   }
//  {
//    //show current need
//    if(qnode.need_cur.name == "Anwser")
//        {ui.progressBar_need_answer->setValue(int(qnode.need_cur.weight*100));
//        ui.lineEdit_need_answer  -> setText(QString::number(qnode.need_cur.weight,'f',2));
//        ui.lineEdit_need_answer_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
//    if(qnode.need_cur.name == "Charge")
//        {ui.progressBar_need_charge->setValue(int(qnode.need_cur.weight*100));
//        ui.lineEdit_need_charge  -> setText(QString::number(qnode.need_cur.weight,'f',2));
//        ui.lineEdit_need_charge_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
//    if(qnode.need_cur.name == "Chat")
//        {ui.progressBar_need_chat->setValue(int(qnode.need_cur.weight*100));
//        ui.lineEdit_need_chat  -> setText(QString::number(qnode.need_cur.weight,'f',2));
//        ui.lineEdit_need_chat_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
//    if(qnode.need_cur.name == "Greet")
//        {ui.progressBar_need_greet->setValue(int(qnode.need_cur.weight*100));
//        ui.lineEdit_need_greet  -> setText(QString::number(qnode.need_cur.weight,'f',2));
//        ui.lineEdit_need_greet_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
//    if(qnode.need_cur.name == "ParentIdentity")
//        {ui.progressBar_need_parent_ensure->setValue(int(qnode.need_cur.weight*100));
//        ui.lineEdit_need_parent_ensure  -> setText(QString::number(qnode.need_cur.weight,'f',2));
//        ui.lineEdit_need_parent_ensure_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
//    if(qnode.need_cur.name == "Doubt")
//        {ui.progressBar_need_question->setValue(int(qnode.need_cur.weight*100));
//        ui.lineEdit_need_question  -> setText(QString::number(qnode.need_cur.weight,'f',2));
//        ui.lineEdit_need_question_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
//    if(qnode.need_cur.name == "MeasureTempareture")
//        {ui.progressBar_need_tempareture_check->setValue(int(qnode.need_cur.weight*100));
//        ui.lineEdit_need_tempareture_check  -> setText(QString::number(qnode.need_cur.weight,'f',2));
//        ui.lineEdit_need_tempareture_check_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
//    if(qnode.need_cur.name == "Wander")
//        {ui.progressBar_need_wander->setValue(int(qnode.need_cur.weight*100));
//        ui.lineEdit_need_wander  -> setText(QString::number(qnode.need_cur.weight,'f',2));
//        ui.lineEdit_need_wander_2  -> setText(QString::fromStdString(qnode.need_cur.person));}

//    if(qnode.need_cur.name == "KeepOrder")
//        {ui.progressBar_need_KeepOrder->setValue(int(qnode.need_cur.weight*100));
//        ui.lineEdit_need_KeepOrder  -> setText(QString::number(qnode.need_cur.weight,'f',2));
//        ui.lineEdit_need_KeepOrder_2  -> setText(QString::fromStdString(qnode.need_cur.person));}

//    if(qnode.need_cur.name == "StopStranger")
//        {ui.progressBar_need_StopStranger->setValue(int(qnode.need_cur.weight*100));
//        ui.lineEdit_need_StopStranger  -> setText(QString::number(qnode.need_cur.weight,'f',2));
//        ui.lineEdit_need_StopStranger_2  -> setText(QString::fromStdString(qnode.need_cur.person));}

//    if(qnode.need_cur.name == "Remind")
//        {ui.progressBar_need_remind->setValue(int(qnode.need_cur.weight*100));
//        ui.lineEdit_need_remind  -> setText(QString::number(qnode.need_cur.weight,'f',2));
//        ui.lineEdit_need_remind_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
//  }
}
/*****************************************************************************
** Implementation [Menu]
*****************************************************************************/

void MainWindow::on_actionAbout_triggered() {
    QMessageBox::about(this, tr("About ..."),tr("<h2>PACKAGE_NAME Test Program 0.10</h2><p>Copyright Yujin Robot</p><p>This package needs an about description.</p>"));
}

/*****************************************************************************
** Implementation [Configuration]
*****************************************************************************/

void MainWindow::ReadSettings() {
    QSettings settings("Qt-Ros Package", "msg");
    restoreGeometry(settings.value("geometry").toByteArray());
    restoreState(settings.value("windowState").toByteArray());
    QString master_url = settings.value("master_url",QString("http://192.168.1.2:11311/")).toString();
    QString host_url = settings.value("host_url", QString("192.168.1.3")).toString();
    //QString topic_name = settings.value("topic_name", QString("/chatter")).toString();
    ui.line_edit_master->setText(master_url);
    ui.line_edit_host->setText(host_url);
    //ui.line_edit_topic->setText(topic_name);
    bool remember = settings.value("remember_settings", false).toBool();
    ui.checkbox_remember_settings->setChecked(remember);
    bool checked = settings.value("use_environment_variables", false).toBool();
    ui.checkbox_use_environment->setChecked(checked);
    if ( checked ) {
    	ui.line_edit_master->setEnabled(false);
    	ui.line_edit_host->setEnabled(false);
    	//ui.line_edit_topic->setEnabled(false);
    }
}

void MainWindow::WriteSettings() {
    QSettings settings("Qt-Ros Package", "msg");
    settings.setValue("master_url",ui.line_edit_master->text());
    settings.setValue("host_url",ui.line_edit_host->text());
    //settings.setValue("topic_name",ui.line_edit_topic->text());
    settings.setValue("use_environment_variables",QVariant(ui.checkbox_use_environment->isChecked()));
    settings.setValue("geometry", saveGeometry());
    settings.setValue("windowState", saveState());
    settings.setValue("remember_settings",QVariant(ui.checkbox_remember_settings->isChecked()));
}

void MainWindow::closeEvent(QCloseEvent *event)
{
	WriteSettings();
	QMainWindow::closeEvent(event);
}

}  // namespace msg
