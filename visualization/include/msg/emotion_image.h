#ifndef EMOTION_IMAGE_H
#define EMOTION_IMAGE_H

#include <QThread>

#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <QtGui/QMainWindow>
#include "ui_main_window.h"

class Emotion_image : public QThread {

public:
  Emotion_image(){}
  Emotion_image(  Ui::MainWindowDesign* ui_ ):ui( ui_ )
  {}
private:
  QString page_1 = "/home/zhjd/ws/src/social_system/emotion_module/image/emotion_img.png";
  Ui::MainWindowDesign* ui;

public:
    virtual void run();


};

void Emotion_image::run()
{
    cv::Mat srcImage_1 = cv::imread(page_1.toLatin1().data());      // 读取图片数据
    cvtColor(srcImage_1, srcImage_1, COLOR_BGR2RGB);        // 图像格式转换
    QImage disImage_1 = QImage((const unsigned char*)(srcImage_1.data), srcImage_1.cols, srcImage_1.rows, QImage::Format_RGB888);
    ui->label_emotion_image->setPixmap(QPixmap::fromImage(disImage_1));  // label 显示图像
//    ui->label_emotion_image->setPixmap(QPixmap::fromImage(disImage_1.scaled(ui->label_emotion_image->size(), Qt::KeepAspectRatio)));  // label 显示图像
    /*xiaopang robot
        QImage *img=new QImage; //新建一个image对象
        img->load(":/new/prefix1/images/xiaopang.png"); //将图像资源载入对象img，注意路径，可点进图片右键复制路径
        ui.label_xiaopang -> setPixmap(QPixmap::fromImage(*img));*/
}

#endif // EMOTION_IMAGE_H
