/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-29 11:42:24
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2022-04-22 20:06:54
 */
#include "common_include.h"

// bool RUN_WITH_REAL_ROBOT;
using namespace std;
class recall
{
public:
    static recall *m_g_recall;
private:  
    int buletooth;

    bool flag_gaze_bt=0, flag_screen_bt=0, flag_sounder_bt=0, flag_arm_bt=0, flag_leg_bt=0;
    
    int ret;
    pthread_t th;

public:
    recall(/* args */){};
    recall( int* buletooth_ ):buletooth( *buletooth_){
        m_g_recall = this; 
        pthread_create(  &th, NULL, pthread_read, (void *)buletooth_   );
    }
    
    void set_REAL_ROBOT( bool RUN_WITH_REAL_ROBOT){
       if(RUN_WITH_REAL_ROBOT){ 
           flag_gaze_bt=1; 
           flag_screen_bt=1; 
           flag_sounder_bt=0; 
           flag_arm_bt=1; 
           flag_leg_bt=0;       
       }
       else{
           flag_gaze_bt=1; 
           flag_screen_bt=1; 
           flag_sounder_bt=1; 
           flag_arm_bt=1; 
           flag_leg_bt=1;
       }
    }


public:
    static void * pthread_read(void *buletooth)
    {
        int fd, ret;
        char recall[128];
        fd = *(int *)(buletooth);

        while (1)
        {   //循环读取串口数据，读到buf
            ret = read(fd, recall, sizeof recall);
            if (ret > 0){
                //读到数据后打印出来
                printf( LIGHT_PURPLE "%s \n"NONE, recall); 
                string recall_str = recall;
                stringstream ss(recall_str);
                string b;
                string type;  bool flag;
                ss >> type;  //ss >> flag;
                if( type == "gaze")     {ss >> m_g_recall -> flag_gaze_bt;          cout<<"蓝牙接受 "<<type<<" Flag"<<m_g_recall -> flag_gaze_bt<<endl;}
                if( type == "screen")     {ss >> m_g_recall -> flag_screen_bt;      cout<<"蓝牙接受 "<<type<<" Flag"<<m_g_recall -> flag_screen_bt<<endl;}
                if( type == "sounder")     {ss >> m_g_recall -> flag_sounder_bt;    cout<<"蓝牙接受 "<<type<<" Flag"<<m_g_recall -> flag_sounder_bt<<endl;}
                if( type == "arm")     {ss >> m_g_recall -> flag_arm_bt;            cout<<"蓝牙接受 "<<type<<" Flag"<<m_g_recall -> flag_arm_bt<<endl;}
                if( type == "leg")     {ss >> m_g_recall -> flag_leg_bt;            cout<<"蓝牙接受 "<<type<<" Flag"<<m_g_recall -> flag_leg_bt<<endl;}
                string debug;
                ss >> debug;
                if( debug != "")     {         
                    printf( LIGHT_PURPLE "ERROR：%s \n"NONE, debug); 
                }
                fflush(stdout);
            }
            else if (ret < 0){
                printf( LIGHT_PURPLE "read error ret\n"NONE);  
                printf("ret = %d\n", ret);
                return NULL;
            }   
        }
    }

private:
    //工具函数 
    bool compare( double delay_ , double thresh){
            if(delay_ > thresh )  
                return true;
            else 
                return  false; 
    }

    void flag_set( bool flag_new,  bool& flag_){
        if(flag_ == 1 || flag_new == 1) 
            flag_ = 1;
    }

public:
    int delay_for_gaze_xiaogang_measureTemperate = 0;
    bool delay_for_gaze_xiaogang_measureTemperate_for_needSatisfy = 0;
    bool recall_gaze(  social_msg::bhvPara& behavior,    int period_  ){      /* 检测 gaze 行为的目标 是否到达 */ 
            //end周期
            if(    period_ == behavior.gaze.endTime  ){
                //if( recall成功 )
                return true;   
            }
            // 非end周期
            else{
                return true;
            }

    }
    bool recall_screen(  social_msg::bhvPara& behavior,    int period_  ){      /* 检测 screen 行为的目标 是否到达 */ 
        return true;  //认为表情 永远能立即实现
    }
    

    bool recall_sounder(   social_msg::bhvPara& behavior,   int period_  ){      /* 检测 sounder 行为的目标 是否到达 */ 
        //end周期
        if(    period_ == behavior.speech.endTime  ){
                if(flag_sounder_bt == 1)
                    return true;    
                else
                    return false;
        }
        // 非end周期
        else{
            return true;
        }
    }
    
    bool recall_arm(  social_msg::bhvPara& behavior,    int period_  ){      /* 检测 arm 行为的目标 是否到达 */ 
        return true;  //认为手臂的摆动 永远能立即实现
    }
    bool recall_leg(  social_msg::bhvPara& behavior,    int period_  ){      /* 检测 leg 行为的目标 是否到达 */ 
        //end周期
        if(    period_ == behavior.legs.endTime  ){
            if(flag_leg_bt == 1)
                return true;    
            else
                return false;
        }
        // 非end周期
        else{
            return true;
        }
    }

public:   
    bool run( social_msg::bhvPara& behavior,     int period_  ){
        //把所有flag置为0。。（目前因为没有真正的机器人配合，先都置为1）
        
        // 必要的变量计算
        double this_period_total_time = (behavior.TotalTime /100.0) ;   /* 关键：再除以10？ */
        // if( behavior.Needs != "MeasureTempareture" )  
        {
                this_period_total_time = this_period_total_time/3.0;
        }
        /* 检测行为的目标 是否到达 */ 
        std::chrono::steady_clock::time_point t1 = std::chrono::steady_clock::now();
        bool flag_gaze=0, flag_screen=0, flag_sounder=0, flag_arm=0, flag_leg=0;
        
        bool debug_for_flagset = true;
        if( debug_for_flagset ){
            
            while (1)
            {
                std::chrono::steady_clock::time_point  t2 = std::chrono::steady_clock::now();
                double this_period_already_time = std::chrono::duration_cast<std::chrono::duration<double> >(t2 - t1).count();
                // this_period_already_time  此周期已经持续的时间。
                if(compare(this_period_already_time,this_period_total_time))  break;
            }
            
            flag_set(recall_gaze( behavior, period_ )   ,  flag_gaze);            
            flag_set(recall_screen( behavior, period_ )   ,  flag_screen);     
            flag_set(recall_sounder( behavior, period_ )   ,  flag_sounder);     
            flag_set(recall_arm( behavior, period_ )   ,  flag_arm);     
            flag_set(recall_leg( behavior, period_ )   ,  flag_leg);  
        }
        else{
            while(1){
                flag_set(recall_gaze( behavior, period_ )   ,  flag_gaze);            
                flag_set(recall_screen( behavior, period_ )   ,  flag_screen);     
                flag_set(recall_sounder( behavior, period_ )   ,  flag_sounder);     
                flag_set(recall_arm( behavior, period_ )   ,  flag_arm);     
                flag_set(recall_leg( behavior, period_ )   ,  flag_leg);     
                
                std::chrono::steady_clock::time_point  t2 = std::chrono::steady_clock::now();
                double this_period_already_time = std::chrono::duration_cast<std::chrono::duration<double> >(t2 - t1).count();
                // this_period_already_time  此周期已经持续的时间。
                if(compare(this_period_already_time,this_period_total_time))  break;
            }
        }
        

        // 以上的循环，完全是依靠  时间尺度。如果按照原来的 全部的 flag_xx 都为true了，就跳出循环，会导致 recall刚执行就结束了。
        // 按照时间尺度结束循环后， 会更体现  行为参数的预定义的重要性。
        if( (flag_gaze && flag_screen && flag_sounder && flag_arm && flag_leg) == true )
            return true;
        else
            return false;
    }
    void flag_to_false(){
        flag_gaze_bt=0; flag_screen_bt=0; flag_sounder_bt=0; flag_arm_bt=0; flag_leg_bt=0;
    }

};
