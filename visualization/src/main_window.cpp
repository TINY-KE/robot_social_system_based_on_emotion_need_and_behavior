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

/*****************************************************************************
** Namespaces
*****************************************************************************/

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

	/*********************
	** Logging
	**********************/

    QObject::connect(&qnode, SIGNAL(loggingUpdated()), this, SLOT(updateLoggingView()));

    QObject::connect(&qnode, SIGNAL(loggingUpdated_emotion()), this, SLOT(updateLoggingView_emotion()));
    QObject::connect(&qnode, SIGNAL(loggingUpdated_body()), this, SLOT(updateLoggingView_body()));
    QObject::connect(&qnode, SIGNAL(loggingUpdated_perception()), this, SLOT(updateLoggingView_perception()));
    QObject::connect(&qnode, SIGNAL(loggingUpdated_need()), this, SLOT(updateLoggingView_need()));
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
void MainWindow::updateLoggingView() {

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
  ui.lineEdit_per_person -> setText(QString::fromStdString(qnode.per_person));
  ui.lineEdit_per_intention -> setText(QString::fromStdString(qnode.per_intention));
  ui.lineEdit_per_p -> setText(QString::number(qnode.per_p,'f',2));
  ui.lineEdit_per_speech -> setText(QString::fromStdString(qnode.per_speech));
  ui.lineEdit_per_personEmotion -> setText(QString::fromStdString(qnode.per_personEmotion));
}
void MainWindow::updateLoggingView_need() {
  //listWidget
  ui.listWidget->clear();
  need_list = qnode.need_list;
  for(int i =0; i < need_list.size();  i ++){
    std::string s = need_list[i].name  +" for "+ need_list[i].person  +" as "+  std::to_string(need_list[i].weight);
    QString list = QString::fromStdString(s);
    ui.listWidget->addItem(list);
  }

  //progressBar
   {
     //clear
     ui.progressBar_need_answer->setValue(0);
     ui.progressBar_need_charge->setValue(0);
     ui.progressBar_need_chat->setValue(0);
     ui.progressBar_need_greet->setValue(0);
     ui.progressBar_need_parent_ensure->setValue(0);
     ui.progressBar_need_question->setValue(0);
     ui.progressBar_need_remind->setValue(0);
     ui.progressBar_need_tempareture_check->setValue(0);
     ui.progressBar_need_wander ->setValue(0);
     ui.progressBar_need_KeepOrder ->setValue(0);
     ui.progressBar_need_StopStranger ->setValue(0);

     ui.lineEdit_need_answer  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_charge  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_chat  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_greet  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_parent_ensure  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_question  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_remind  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_tempareture_check  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_wander  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_KeepOrder  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_StopStranger  -> setText(QString::fromStdString(""));

     ui.lineEdit_need_answer_2  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_charge_2  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_chat_2  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_greet_2  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_parent_ensure_2  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_question_2  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_remind_2  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_tempareture_check_2  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_wander_2  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_KeepOrder_2  -> setText(QString::fromStdString(""));
     ui.lineEdit_need_StopStranger_2  -> setText(QString::fromStdString(""));
   }
  {
    //show current need
    if(qnode.need_cur.name == "Anwser")
        {ui.progressBar_need_answer->setValue(int(qnode.need_cur.weight*100));
        ui.lineEdit_need_answer  -> setText(QString::number(qnode.need_cur.weight,'f',2));
        ui.lineEdit_need_answer_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
    if(qnode.need_cur.name == "Charge")
        {ui.progressBar_need_charge->setValue(int(qnode.need_cur.weight*100));
        ui.lineEdit_need_charge  -> setText(QString::number(qnode.need_cur.weight,'f',2));
        ui.lineEdit_need_charge_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
    if(qnode.need_cur.name == "Chat")
        {ui.progressBar_need_chat->setValue(int(qnode.need_cur.weight*100));
        ui.lineEdit_need_chat  -> setText(QString::number(qnode.need_cur.weight,'f',2));
        ui.lineEdit_need_chat_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
    if(qnode.need_cur.name == "Greet")
        {ui.progressBar_need_greet->setValue(int(qnode.need_cur.weight*100));
        ui.lineEdit_need_greet  -> setText(QString::number(qnode.need_cur.weight,'f',2));
        ui.lineEdit_need_greet_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
    if(qnode.need_cur.name == "ParentIdentity")
        {ui.progressBar_need_parent_ensure->setValue(int(qnode.need_cur.weight*100));
        ui.lineEdit_need_parent_ensure  -> setText(QString::number(qnode.need_cur.weight,'f',2));
        ui.lineEdit_need_parent_ensure_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
    if(qnode.need_cur.name == "Doubt")
        {ui.progressBar_need_question->setValue(int(qnode.need_cur.weight*100));
        ui.lineEdit_need_question  -> setText(QString::number(qnode.need_cur.weight,'f',2));
        ui.lineEdit_need_question_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
    if(qnode.need_cur.name == "MeasureTempareture")
        {ui.progressBar_need_tempareture_check->setValue(int(qnode.need_cur.weight*100));
        ui.lineEdit_need_tempareture_check  -> setText(QString::number(qnode.need_cur.weight,'f',2));
        ui.lineEdit_need_tempareture_check_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
    if(qnode.need_cur.name == "Wander")
        {ui.progressBar_need_wander->setValue(int(qnode.need_cur.weight*100));
        ui.lineEdit_need_wander  -> setText(QString::number(qnode.need_cur.weight,'f',2));
        ui.lineEdit_need_wander_2  -> setText(QString::fromStdString(qnode.need_cur.person));}

    if(qnode.need_cur.name == "KeepOrder")
        {ui.progressBar_need_KeepOrder->setValue(int(qnode.need_cur.weight*100));
        ui.lineEdit_need_KeepOrder  -> setText(QString::number(qnode.need_cur.weight,'f',2));
        ui.lineEdit_need_KeepOrder_2  -> setText(QString::fromStdString(qnode.need_cur.person));}

    if(qnode.need_cur.name == "StopStranger")
        {ui.progressBar_need_StopStranger->setValue(int(qnode.need_cur.weight*100));
        ui.lineEdit_need_StopStranger  -> setText(QString::number(qnode.need_cur.weight,'f',2));
        ui.lineEdit_need_StopStranger_2  -> setText(QString::fromStdString(qnode.need_cur.person));}

    if(qnode.need_cur.name == "Remind")
        {ui.progressBar_need_remind->setValue(int(qnode.need_cur.weight*100));
        ui.lineEdit_need_remind  -> setText(QString::number(qnode.need_cur.weight,'f',2));
        ui.lineEdit_need_remind_2  -> setText(QString::fromStdString(qnode.need_cur.person));}
  }
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

