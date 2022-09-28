/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-29 11:42:24
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2022-08-24 21:27:10
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

    bool flag_gaze_bt=0; //, flag_screen_bt=0, flag_sounder_bt=0, flag_arm_bt=0, flag_leg_bt=0;
    
    int ret;
    pthread_t th;

public:
    recall(/* args */){};
    recall( int* buletooth_ ):buletooth( *buletooth_){
        m_g_recall = this; 
        pthread_create(  &th, NULL, pthread_read, (void *)buletooth_   );
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
                //接收数据
                printf( LIGHT_PURPLE "%s \n"NONE, recall); 
                string recall_str = recall;
                stringstream ss(recall_str);
                
                //处理数据
                string type;  bool flag;
                ss >> type;  //接收到的蓝牙数据的形式为“肢体类型 是否完成目标”，这里将肢体类型存入type变量中。
                if( type == "gaze")     {
                    ss >> m_g_recall -> flag_gaze_bt;         //这里将‘是否完成目标’存入m_g_recall->flag_gaze_bt变量中
                    cout<<"蓝牙接受 "<<type<<" Flag"<<m_g_recall -> flag_gaze_bt<<endl;
                }

                //检查时候有残留
                string debug;   
                ss >> debug;
                if( debug != "")   {         
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

};
