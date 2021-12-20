/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-18 20:42:25
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-20 22:48:01
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
#include <chrono>
class Gaze_pub {
    public:
        Gaze_pub(){
            wheather_run  = false;
        }
        Gaze_pub( social_msg::Gaze& para  ){
            parameter = para;
        }

    private:
        void publish(){
            /* 将行为参数parameter  发布给机器人 */
        }

        bool recall(){
            /* 检测行为的目标 是否到达 */ 
            return false;
        }

    public:  
        std::atomic_bool flag;
        std::atomic_bool wheather_run;
        // int period;
        int period_cur = -1;
        social_msg::Gaze parameter;

        void updatePara(  const  social_msg::Gaze& para  )  {
            parameter = para;
            // wheather_run = true;
        }

        void updatePeriodCur( int period_cur_  ){
            if(period_cur < period_cur_){
                period_cur = period_cur_;
                wheather_run = true;
            }
        }
        
        bool compare( double delay_){
            if(delay_ > 1.0)  
                return true;
            else 
                return  false; 
        }
        void run( ){/* int period_cur */
            while(1){
                    if( wheather_run ){

                    flag = 0;
                    // publish();
                    // sleep(10);
                    // time_t now = time(0); char* dt = ctime(&now);  std::cout << "Gaze_pub 本地日期和时间：" << dt << std::endl;
                    // std::cout<< "Gaze_pub 运行成功 "<<std::endl;
                    std::cout<< "[1]当前为...行为的第 "<< period_cur<<" 周期"<<std::endl;
                    std::chrono::steady_clock::time_point t1 = std::chrono::steady_clock::now();
                    if(  (period_cur >= parameter.startTime)  &&   (period_cur < parameter.endTime) ){
                        publish();
                        std::chrono::steady_clock::time_point t2 = std::chrono::steady_clock::now();
                        double delay = std::chrono::duration_cast<std::chrono::duration<double> >(t2 - t1).count();
                        // std::cout<< delay <<std::endl;
                        while( 1 ){
                            // std::cout << "Gaze_pub 当前处于第：" << period_cur << "周期， delay为：" <<  delay << "秒"  << std::endl;
                            
                            if(    recall()     ){
                                flag = 1;
                            }
                            sleep(0.2)         ;
                            t2 = std::chrono::steady_clock::now();
                            double delay = std::chrono::duration_cast<std::chrono::duration<double> >(t2 - t1).count();
                            // std::cout << "Gaze_pub delay为：" <<  delay << "秒,  判断为" << compare(delay) << std::endl;
                            if(compare(delay))  break;
                        }
                        flag = 1;
                    }
                    else if(    period_cur == parameter.endTime  ){
                        publish();
                        while(  !recall()   ){  }        
                        flag = 1;
                    }
                    else{
                        flag = 1;
                    }
                
                
                }  
                /* if 结束,代表 gaze的当前周期  执行完毕。等待新的周期开始，即“周期检测函数”中period+1 并赋值wheather_run为true时，开启该肢体的新的周期。 */
                wheather_run = false;
            }
            
        }
        
};