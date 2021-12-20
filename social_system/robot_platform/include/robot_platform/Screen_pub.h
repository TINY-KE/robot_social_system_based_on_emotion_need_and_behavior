/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-18 20:42:26
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-20 14:33:05
 */
// Gaze_pub  gaze;
// Screen_pub  screen;
// Sounder_pub  sounder;
// Arm_pub  arm;
// Leg_pub  leg;
#include "common_include.h"

class Screen_pub {
    public:
        Screen_pub(){}
    
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
        bool wheather_run  = false;
        // int period;
        int period_cur;
        social_msg::Emotion parameter;

        void updatePara(  const  social_msg::Emotion& para  )  {
            parameter = para;
            wheather_run = true;
        }
        
        void close(){
            wheather_run = false;
        }
        void run( /* int period_cur */){
            if( wheather_run ){
                
                flag = 0;
                publish();
                // sleep(10);
                // std::cout<< "Screen_pub 运行成功 "<<std::endl;
                time_t now = time(0); char* dt = ctime(&now);  std::cout << "Screen_pub 本地日期和时间：" << dt << std::endl;
                
                std::chrono::steady_clock::time_point t1 = std::chrono::steady_clock::now();
                if(  (period_cur >= parameter.startTime)  &&   (period_cur < parameter.endTime) ){
                    publish();
                    std::chrono::steady_clock::time_point t2 = std::chrono::steady_clock::now();
                    double delay = std::chrono::duration_cast<std::chrono::duration<double> >(t2 - t1).count();
                    std::cout<< delay <<std::endl;
                    while(  delay < 1    ){
                        if(    recall()     ){
                            flag = 1;
                        }         
                        t2 = std::chrono::steady_clock::now();
                        double delay = std::chrono::duration_cast<std::chrono::duration<double> >(t2 - t1).count();
                    }
                    flag = 1;
                }
                else if(    period_cur == parameter.endTime  ){
                    while(  !recall()   ){  }        
                    flag = 1;
                }
                else{
                    flag = 1;
                }
            }
            
        }
};