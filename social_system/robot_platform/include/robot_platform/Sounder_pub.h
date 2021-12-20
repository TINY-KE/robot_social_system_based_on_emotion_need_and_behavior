/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-18 20:42:24
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-20 22:49:41
 */
// Gaze_pub  gaze;
// Screen_pub  screen;
// Sounder_pub  sounder;
// Arm_pub  arm;
// Leg_pub  leg;

// b)音响：进入start周期次数后，开始播放文字的音频。一般情况下，flag不先置为。只有进入end周期次数时，flag先置为0 。等音频播放完毕，flag置为1 。

#include "common_include.h"
class Sounder_pub {
    public:
        Sounder_pub(){
            wheather_run  = false;
        }
        Sounder_pub( social_msg::Speech& para  ){
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
        social_msg::Speech parameter;

        void updatePara(  const  social_msg::Speech& para  )  {
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
                    // time_t now = time(0); char* dt = ctime(&now);  std::cout << "Sounder_pub 本地日期和时间：" << dt << std::endl;
                    // std::cout<< "Sounder_pub 运行成功 "<<std::endl;
                    std::cout<< "[1]当前为...行为的第 "<< period_cur<<" 周期"<<std::endl;
                    std::chrono::steady_clock::time_point t1 = std::chrono::steady_clock::now();
                    if(  (period_cur >= parameter.startTime)  &&   (period_cur < parameter.endTime) ){
                        publish();
                        std::chrono::steady_clock::time_point t2 = std::chrono::steady_clock::now();
                        double delay = std::chrono::duration_cast<std::chrono::duration<double> >(t2 - t1).count();
                        // std::cout<< delay <<std::endl;
                        while( 1 ){
                            // std::cout << "Sounder_pub 当前处于第：" << period_cur << "周期， delay为：" <<  delay << "秒"  << std::endl;
                            
                            if(    recall()     ){
                                flag = 1;
                            }
                            sleep(0.2)         ;
                            t2 = std::chrono::steady_clock::now();
                            double delay = std::chrono::duration_cast<std::chrono::duration<double> >(t2 - t1).count();
                            // std::cout << "Sounder_pub delay为：" <<  delay << "秒,  判断为" << compare(delay) << std::endl;
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
                /* if 结束,代表 Sounder的当前周期  执行完毕。等待新的周期开始，即“周期检测函数”中period+1 并赋值wheather_run为true时，开启该肢体的新的周期。 */
                wheather_run = false;
            }
            
        }
};