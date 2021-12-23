/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-21 19:27:27
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-23 10:29:28
 */
#include "common_include.h"
#include "ros/ros.h"
ros::Publisher pub_reply;

class periodDetection
{
private:
    bool insert_new_behavihor = false;

    social_msg::bhvPara& behavior;

    double single_period_time;
    
    bool flag;
    
    ros::Publisher pub_reply;

    int behavior_type_1;
    int behavior_type_10;
    int behavior_type_100;
    // int startTime；
    // int endTime;

    bool compare( double delay_ , double thresh){
            if(delay_ > thresh )  
                return true;
            else 
                return  false; 
    }

    int total_time(    social_msg::bhvPara& behavior_  ){
        
    }
    
    void flag_set( bool flag_new,  bool& flag_){
        if(flag_ == 1 || flag_new == 1) 
            flag_ = 1;
    }

public:
    
    periodDetection( social_msg::bhvPara& behavior_,  ros::NodeHandle& n):
        behavior(behavior_)
    {
        insert_new_behavihor = false;
        single_period_time = behavior_.TotalTime / 100.0;
        behavior_type_1 = behavior_.num / 1%10;	
        behavior_type_10 = behavior_.num / 10%10;
        behavior_type_100 = behavior_.num / 100%10;
        // 个位
        // num % 10 == num / 1 % 10
        // 十位
        // num / 10 % 10
        // 百位
        // num / 100 % 10
        // 千位
        // num / 1000 % 10
        // 依次类推
        //行为进度
        pub_reply = n.advertise<social_msg::bhvReply>("behavior_Reply", 10);  
    }

    
    ~periodDetection();

public:
    void interrupt_last_behavior(){
        insert_new_behavihor = true;
    }

private:
        
    void publish_gaze( int period_  ){
        if(  (period_ >= behavior.gaze.startTime)  &&   (period_ <= behavior.gaze.endTime) ){
            /* TODO: 将 gaze的行为参数parameter(的yaml文件)  发布给机器人。 如果目标人物和上次相同，则发布空消息（必须发消息，因此每次recall需要对应一次publish）。 */
        }
    }
    void publish_screen( int period_  ){
        if(  (period_ >= behavior.emotion.startTime)  &&   (period_ <= behavior.emotion.endTime) ){
            /* TODO: 将 screen的行为参数parameter(的yaml文件)  发布给机器人。 如果表情和上次相同，则发布空消息（必须发消息，因此每次recall需要对应一次publish）。*/
        }
    }
    void publish_sounder( int period_  ){
        if(  (period_ >= behavior.speech.startTime)  &&   (period_ <= behavior.speech.endTime) ){
            /* TODO: 将 sounder的行为参数parameter(的yaml文件)  发布给机器人 。 如果语音内容和上次相同，则发布空消息（必须发消息，因此每次recall需要对应一次publish）。*/
        }
    }
    void publish_arm( int period_  ){
        if(  (period_ >= behavior.arms.startTime)  &&   (period_ <= behavior.arms.endTime) ){
            /* TODO: 将 arm的行为参数parameter(的yaml文件)  发布给机器人。 如果动作和上次相同，则发布空消息（必须发消息，因此每次recall需要对应一次publish）。 */
        }
    }
    void publish_leg( int period_  ){
        if(  (period_ >= behavior.legs.startTime)  &&   (period_ <= behavior.legs.endTime) ){
            /* TODO: 将 leg的行为参数parameter(的yaml文件)  发布给机器人。 如果目标和上次相同，则发布空消息（必须发消息，因此每次recall需要对应一次publish）。 */
        }
    }


    void publish( int period_ ){
//        string ss ;
//        behavior.arms.rate;
        // publish_gaze( period_ );
        // publish_screen( period_ );
        // publish_sounder( period_ );
        // publish_arm( period_ );
        // publish_leg( period_ );
    }

    bool recall_gaze(  int period_  ){      /* 检测 gaze 行为的目标 是否到达 */ 
        //end周期
        if(    period_ == behavior.gaze.endTime  ){
            //if( recall成功 )
            return true;
            // else
            return false;
        }
        // 非end周期
        else{
            return true;
        }
    }
    bool recall_screen(  int period_  ){      /* 检测 screen 行为的目标 是否到达 */ 
        return true;  //认为表情 永远能立即实现
    }
    bool recall_sounder(  int period_  ){      /* 检测 sounder 行为的目标 是否到达 */ 
        //end周期
        if(    period_ == behavior.speech.endTime  ){
            //if( recall成功 )
            return true;
            // else
            return false;
        }
        // 非end周期
        else{
            return true;
        }
    }
    bool recall_arm(  int period_  ){      /* 检测 arm 行为的目标 是否到达 */ 
        return true;  //认为手臂的摆动 永远能立即实现
    }
    bool recall_leg(  int period_  ){      /* 检测 leg 行为的目标 是否到达 */ 
        //end周期
        if(    period_ == behavior.legs.endTime  ){
            //if( recall成功 )
            return true;
            // else
            return false;
        }
        // 非end周期
        else{
            return true;
        }
    }
    
    bool recall(  int period_  ){
        /* 检测行为的目标 是否到达 */ 
        std::chrono::steady_clock::time_point t1 = std::chrono::steady_clock::now();
        bool flag_gaze=0, flag_screen=0, flag_sounder=0, flag_arm=0, flag_leg=0;
        
        while(1){
            flag_set(recall_gaze( period_ )   ,  flag_gaze);            
            flag_set(recall_screen( period_ )   ,  flag_screen);     
            flag_set(recall_sounder( period_ )   ,  flag_sounder);     
            flag_set(recall_arm( period_ )   ,  flag_arm);     
            flag_set(recall_leg( period_ )   ,  flag_leg);     
            
            std::chrono::steady_clock::time_point  t2 = std::chrono::steady_clock::now();
            double delay = std::chrono::duration_cast<std::chrono::duration<double> >(t2 - t1).count();
            if(compare(delay,single_period_time))  break;
        }
        // 以上的循环，完全是依靠  时间尺度。如果按照原来的 全部的 flag_xx 都为true了，就跳出循环，会导致 recall刚执行就结束了。
        // 按照时间尺度结束循环后， 会更体现  行为参数的预定义的重要性。
        if( (flag_gaze && flag_screen && flag_sounder && flag_arm && flag_leg) == true )
            return true;
        else
            return false;
    }

    bool recall_debug(){
        /* 检测行为的目标 是否到达 */ 
        sleep(2);
        return true;
    }
   


public:
    void  PeriodDetection(){
        if( (behavior_type_100 == 1) && ((behavior_type_10 != 0) || (behavior_type_1 != 0)) ){
            
            std::cout<< "当前为 "<<behavior.Needs<< " 行为的过渡中断行为"<< std::endl;
            social_msg::bhvReply behavior_reply;
            behavior_reply.num = behavior.num;
            behavior_reply.time = behavior.time;
            behavior_reply.reply = 100;
            pub_reply.publish(behavior_reply);
        }   
        else {
        // 
            int period_total =  100;
            int period_cur = 0;
            insert_new_behavihor = false;
            for(    ;   (period_cur <= period_total ) && (!insert_new_behavihor)    ; )
            {
                //
                std::cout<< "执行 "<<behavior.Needs<< " 行为的周期检测, ["<< period_cur << "]"<< std::endl;
            
                //查看每个行为的的起始周期，并发布行为参数
                publish( period_cur );
                bool flag = recall( period_cur );

                //如果 某一个肢体目标 在endtime 没有执行成功。 则不period_cur+1。
                if( flag == false ) {}
                else{
                    /* TODO:  reply的编写 */
                    social_msg::bhvReply behavior_reply;
                    behavior_reply.num = behavior.num;
                    behavior_reply.time = behavior.time;
                    behavior_reply.reply = (int)period_cur;
                    pub_reply.publish(behavior_reply);
                    period_cur++;         
                }
            }
        }
         
    }

};






































/* void publish_test( int period_  ){
        std::chrono::steady_clock::time_point t1 = std::chrono::steady_clock::now();
        if(  (period_ >= behavior.gaze.startTime)  &&   (period_ < behavior.gaze.endTime) ){
            publish();
            std::chrono::steady_clock::time_point t2 = std::chrono::steady_clock::now();
            double delay = std::chrono::duration_cast<std::chrono::duration<double> >(t2 - t1).count();
            // std::cout<< delay <<std::endl;
            while( 1 ){
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
        else if(    period_ == behavior.gaze.endTime  ){
            publish();
            while(  
                #ifdef DEBUG
                    !recall_debug() 
                #else
                    !recall() 
                #endif 
            ){ 
                std::cout<< "[1]："<< period_cur<<" 周期，最后时刻，循环等待完结。"<<std::endl;
                }        
            flag = 1;
        }
        else{
            flag = 1;
        }
    } */











// bool recall_gaze(  int period_  ){      /* 检测 gaze 行为的目标 是否到达 */ 
//         //运行周期
//         if(  (period_ >= behavior.gaze.startTime)  &&   (period_ < behavior.gaze.endTime) ){            
//            //TODO: 判断gaze目标 是否达到
//             return true
//         }
//         // 最终周期
//         else if(    period_ == behavior.gaze.endTime  ){
//             while(  
//                 !recall_debug()    //TODO: 
//                 ){ 
//                 std::cout<< "[gaze]： 第"<< period_cur<<" 周期，最后时刻，循环等待完结。"<<std::endl;
//             }        
//             return true;
//         }
//         // 非运行周期
//         else{
//             return true;
//         }
//     }
    







// periodDetection::periodDetection(/* args */)
// {
// }

// periodDetection::~periodDetection()
// {
// }

 // void  PeriodDetection( const social_msg::bhvPara& behavior ){
    //     int i = 0;
    //     while(1){
    //         //实验：？ 线程能否被打断
    //         std::cout<< "执行 "<<behavior.Needs<< " 行为的周期检测, ["<< i<< "]"<< std::endl;
    //         i++;
    //         sleep(1);
    //     }
    // }

    //  void  PeriodDetection( const social_msg::bhvPara& behavior ){
    //     int period_total = behavior.TotalTime;
    //     int period_cur = 0;
    //     insert_new_behavihor = false;
    //     for(    ;   (period_cur <= period_total ) && (!insert_new_behavihor)
    //             ;period_cur++  )
    //     {
    //         //实验：？ 线程能否被打断
    //         std::cout<< "执行 "<<behavior.Needs<< " 行为的周期检测, ["<< period_cur << "]"<< std::endl;
            
    //         sleep(1);
    //     }
    // }
