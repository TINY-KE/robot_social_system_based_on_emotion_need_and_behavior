/**
 * @file /include/msg/main_window.hpp
 *
 * @brief Qt based gui for msg.
 *
 * @date November 2010
 **/
#ifndef msg_MAIN_WINDOW_H
#define msg_MAIN_WINDOW_H

/*****************************************************************************
** Includes
*****************************************************************************/

#include <QtGui/QMainWindow>
#include "ui_main_window.h"
#include "qnode.hpp"

/*****************************************************************************
** Namespace
*****************************************************************************/

namespace msg {

/*****************************************************************************
** Interface [MainWindow]
*****************************************************************************/
/**
 * @brief Qt central, all operations relating to the view part here.
 */
class MainWindow : public QMainWindow {
Q_OBJECT

public:
	MainWindow(int argc, char** argv, QWidget *parent = 0);
	~MainWindow();

	void ReadSettings(); // Load up qt program settings at startup
	void WriteSettings(); // Save qt program settings when closing

	void closeEvent(QCloseEvent *event); // Overloaded function
	void showNoMasterMessage();

public Q_SLOTS:
	/******************************************
	** Auto-connections (connectSlotsByName())
	*******************************************/
	void on_actionAbout_triggered();
	void on_button_connect_clicked(bool check );
	void on_checkbox_use_environment_stateChanged(int state);

    /******************************************
    ** Manual connections
    *******************************************/
    void updateLoggingView(); // no idea why this can't connect automatically
    void updateLoggingView_emotion(); //add
    void updateLoggingView_body();
    void updateLoggingView_perception();
    void updateLoggingView_need();
    void updateLoggingView_bhvPara();
    void updateLoggingView_bhvReply();
    void updateLoggingView_bhvQueue();
    QString calcValue(int, QString, QString, QString, int, int);
    void slt_valueChanged_gaze(int, int, int, QString);
    void slt_valueChanged_screen(int, int, int, QString);
    void slt_valueChanged_sounder(int, int, int, QString);
    void slt_valueChanged_arm(int, int, int, QString);
    void slt_valueChanged_leg(int, int, int, QString);
public:
    std::vector<need> need_list;


private:
	Ui::MainWindowDesign ui;
	QNode qnode;
};

}  // namespace msg

#endif // msg_MAIN_WINDOW_H
