/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-18 20:42:25
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-19 22:48:59
 */
// Gaze_pub  gaze;
// Screen_pub  screen;
// Sounder_pub  sounder;
// Arm_pub  arm;
// Leg_pub  leg;

// bool call
// int8  
// string target
// int8 startTime
// int8 endTime
// 摄像头：在每一个扫描周期内，一直对准target即可。因此只要摄像头中有交互对象，flag就置为1.
// 思考：对于音响、轮子而言是，只要flag赋值1后，之后个各个周期都是等于1.  **
#include "common_include.h"

class Gaze_pub {
    public:
        Gaze_pub(){}
        Gaze_pub( social_msg::Gaze& para  ){
            parameter = para;
        }

    private:
        // bool timeDelay(int time){
        //     sleep(time);
        //     return true;
        // }
        void publish(){
            /* 发布行为参数  给机器人 */
        }

        bool recall(){
            /* 检测行为的目标 是否到达 */ 
        }

    public:  
        bool flag;
        bool update  = true;
        // int period;
        int period_cur;
        social_msg::Gaze parameter;

        void updatePara(    social_msg::Gaze& para  )  {
            parameter = para;
            update = true;
        }
        
        void run( ){/* int period_cur */
            if( update ){

                flag = 0;
                publish();
                sleep(10);
                std::cout<< "Gaze_pub 运行成功 "<<std::endl;
                /* 
                std::chrono::steady_clock::time_point t1 = std::chrono::steady_clock::now();
                if(  (period_cur >= parameter.startTime)  &&   (period_cur < parameter.endTime) ){
                    publish();
                    std::chrono::steady_clock::time_point t2 = std::chrono::steady_clock::now();
                    while(  (t2-t1) < 1    ){
                        std::cout<< (t2 -t1) <<std::endl;
                        if(    recall()     ){
                            flag = 1;
                        }         
                        t2 = std::chrono::steady_clock::now();
                    }
                    flag = 1;
                }
                else if(    period_cur == parameter.endTime  ){
                    while(  !recall()   ){  }        
                    flag = 1;
                } */
            }
            
        }
        
};