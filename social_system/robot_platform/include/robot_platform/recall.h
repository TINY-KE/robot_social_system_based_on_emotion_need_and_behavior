/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-29 11:42:24
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-29 12:05:14
 */


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


#define DEBUG_delay_for_gaze_xiaogang_measureTemperate
int delay_for_gaze_xiaogang_measureTemperate = 0;
bool delay_for_gaze_xiaogang_measureTemperate_for_needSatisfy = 0;
// DEBUG_delay_for_gaze_xiaogang_measureTemperate
bool recall_gaze(  social_msg::bhvPara& behavior,    int period_  ){      /* 检测 gaze 行为的目标 是否到达 */ 
    #ifdef DEBUG_delay_for_gaze_xiaogang_measureTemperate
    if( behavior.Needs == "MeasureTempareture" && behavior.gaze.target == "Gang"){
        //end周期
        if(    period_ == behavior.gaze.endTime  ){
            //if( recall成功 )
            return true;   //TODO: 
            // else
            return false;
        }
        // 非end周期
        else if( period_ == 30){
                if(delay_for_gaze_xiaogang_measureTemperate > 25){
                    delay_for_gaze_xiaogang_measureTemperate = 0;
                    delay_for_gaze_xiaogang_measureTemperate_for_needSatisfy  = 1;// delay_for_gaze_xiaogang_measureTemperate_for_needSatisfy ++ ; 
                    return true;
                }
                else{
                    return false;
                } 
        }
        else if( period_ == 70){
                if(delay_for_gaze_xiaogang_measureTemperate > 25){
                    delay_for_gaze_xiaogang_measureTemperate = 0;
                    delay_for_gaze_xiaogang_measureTemperate_for_needSatisfy = 1;// delay_for_gaze_xiaogang_measureTemperate_for_needSatisfy ++ ; 
                    return true;
                }
                else{
                    return false;
                } 
        }
        else{
            return true;
        }
    }
    else{
        //end周期
        if(    period_ == behavior.gaze.endTime  ){
        //if( recall成功 )
        return true;   //TODO: 
        // else
        return false;
        }
        // 非end周期
        else{
            return true;
        }
    }
    #else
        //end周期
        if(    period_ == behavior.gaze.endTime  ){
        //if( recall成功 )
        return true;   //TODO: 
        // else
        return false;
        }
        // 非end周期
        else{
            return true;
        }
    #endif
}
bool recall_screen(  social_msg::bhvPara& behavior,    int period_  ){      /* 检测 screen 行为的目标 是否到达 */ 
    return true;  //认为表情 永远能立即实现
}

#define DEBUG_delay_for_sounder_endtime
int delay_for_sounder_endtime = 0;
bool recall_sounder(   social_msg::bhvPara& behavior,   int period_  ){      /* 检测 sounder 行为的目标 是否到达 */ 
    //end周期
    if(    period_ == behavior.speech.endTime  ){
        #ifdef DEBUG_delay_for_sounder_endtime
        {
            if( behavior.Needs == "Answer" ){
                if(delay_for_sounder_endtime > 25){
                    delay_for_sounder_endtime = 0;
                    return true;
                }
                else{
                    return false;
                } 
            }
            else
                return true;
            
        }  
        #else
        {
            //if( recall成功 )
            return true;   //TODO: 
            // else
            return false;
        }
        #endif 
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
        //if( recall成功 )
        return true;    //TODO: 
        // else
        return false;
    }
    // 非end周期
    else{
        return true;
    }
}
    
bool recall( social_msg::bhvPara& behavior,     int period_  ){
    //必要的变量计算
    double single_period_time = behavior.TotalTime /100.0 ;
    
    /* 检测行为的目标 是否到达 */ 
    std::chrono::steady_clock::time_point t1 = std::chrono::steady_clock::now();
    bool flag_gaze=0, flag_screen=0, flag_sounder=0, flag_arm=0, flag_leg=0;
    
    while(1){
        flag_set(recall_gaze( behavior, period_ )   ,  flag_gaze);            
        flag_set(recall_screen( behavior, period_ )   ,  flag_screen);     
        flag_set(recall_sounder( behavior, period_ )   ,  flag_sounder);     
        flag_set(recall_arm( behavior, period_ )   ,  flag_arm);     
        flag_set(recall_leg( behavior, period_ )   ,  flag_leg);     
        
        std::chrono::steady_clock::time_point  t2 = std::chrono::steady_clock::now();
        double delay = std::chrono::duration_cast<std::chrono::duration<double> >(t2 - t1).count();
        if(compare(delay,single_period_time))  break;
    }
    #ifdef DEBUG_delay_for_sounder_endtime
        if(    period_ == behavior.speech.endTime  )
                delay_for_sounder_endtime ++ ;
    #endif
    #ifdef DEBUG_delay_for_gaze_xiaogang_measureTemperate
        if( behavior.Needs == "MeasureTempareture" && behavior.gaze.target == "Gang" )
            if( period_ == 30 ||  period_ == 70)
                delay_for_gaze_xiaogang_measureTemperate ++ ;
    #endif
    // 以上的循环，完全是依靠  时间尺度。如果按照原来的 全部的 flag_xx 都为true了，就跳出循环，会导致 recall刚执行就结束了。
    // 按照时间尺度结束循环后， 会更体现  行为参数的预定义的重要性。
    if( (flag_gaze && flag_screen && flag_sounder && flag_arm && flag_leg) == true )
        return true;
    else
        return false;
}
