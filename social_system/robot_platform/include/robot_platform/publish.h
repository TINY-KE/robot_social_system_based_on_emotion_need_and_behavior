/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-29 11:40:12
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-29 12:07:19
 */
#include "common_include.h"

using namespace std;


string  gaze_target_lastpub = "none", screen_type_lastpub = "none", 
            sounder_tone_lastpub = "none", sounder_rate_lastpub = "none", sounder_content_lastpub = "none", 
            arm_action_lastpub = "none", arm_rate_lastpub = "none", 
            leg_target_lastpub = "none", leg_aciton_lastpub = "none", leg_rate_lastpub = "none", leg_distance_lastpub = "none";
//工具函数 
string none_check( string s){
    string block = "none";;
    if( s == "")
        return block;
    else
        return s;
}


// 需求满足状态  、肢体状态 、 内部感知信息（pass、 Uncooperate。 
// 感觉直接改成需求更合适，为什么要通过感知信息而多此一举呢。甚至直接改为行为？）的生成。
void publish( social_msg::bhvPara& behavior,   int period_,  int& buletooth)
{
    string  gaze_target = "none", screen_type = "none", 
            sounder_tone = "none", sounder_rate = "none", sounder_content = "none", 
            arm_action = "none", arm_rate = "none", 
            leg_target = "none", leg_aciton = "none", leg_rate = "none", leg_distance = "none";
    // publish gaze
        if(  (period_ >= behavior.gaze.startTime)  &&   (period_ <= behavior.gaze.endTime) ){
                if(behavior.gaze.target != gaze_target_lastpub){
                    gaze_target = none_check(behavior.gaze.target);
                    gaze_target_lastpub = gaze_target;
                }
            }

    // publish_screen
        if(  (period_ >= behavior.emotion.startTime)  &&   (period_ <= behavior.emotion.endTime) ){
                if(behavior.emotion.type != screen_type_lastpub){
                    screen_type = none_check(behavior.emotion.type);
                    screen_type_lastpub = screen_type;
                }    
            }
        
    // publish_sounder
        if(  (period_ >= behavior.speech.startTime)  &&   (period_ <= behavior.speech.endTime) ){
                if( 
                    (sounder_tone_lastpub != to_string(behavior.speech.tone))   ||
                    (sounder_rate_lastpub != to_string(behavior.speech.rate))   ||
                    (sounder_content_lastpub != behavior.speech.content)       
                ){
                    sounder_tone = none_check(to_string(behavior.speech.tone)); 
                    sounder_rate = none_check(to_string(behavior.speech.rate));
                    sounder_content = none_check(behavior.speech.content);
                    sounder_tone = sounder_tone_lastpub; 
                    sounder_rate = sounder_rate_lastpub;
                    sounder_content = sounder_content_lastpub;
                }        
            }

    // publish_arm
        if(  (period_ >= behavior.arms.startTime)  &&   (period_ <= behavior.arms.endTime) ){
                if(
                    (arm_action_lastpub != behavior.arms.action)            ||
                    (arm_rate_lastpub != to_string(behavior.arms.rate))
                ){
                    arm_action = none_check(behavior.arms.action);
                    arm_rate = none_check(to_string(behavior.arms.rate));
                    arm_action = arm_action_lastpub;
                    arm_rate = arm_rate_lastpub;
                }   
            }
    // publish_leg( period_ );
        if(  (period_ >= behavior.legs.startTime)  &&   (period_ <= behavior.legs.endTime) ){
                if(
                    (leg_target_lastpub != behavior.legs.target)           ||
                    (leg_aciton_lastpub != behavior.legs.action)           ||
                    (leg_rate_lastpub != to_string(behavior.legs.rate))    ||
                    (leg_distance_lastpub != to_string(behavior.legs.distance))
                ){
                    leg_target = none_check(behavior.legs.target);
                    leg_aciton = none_check(behavior.legs.action);
                    leg_rate = none_check(to_string(behavior.legs.rate));
                    leg_distance = none_check(to_string(behavior.legs.distance));
                    leg_target = leg_target_lastpub;
                    leg_aciton = leg_aciton_lastpub;
                    leg_rate = leg_rate_lastpub;
                    leg_distance = leg_distance_lastpub;
                }
            }


        string block = "none";
        string parameter_buletooth = gaze_target +" "+ block +" "+ block +" "+ block +" "+ block +" "+ 
                    screen_type +" "+ block +" "+ block +" "+ block +" "+ block +" "+ 
                    sounder_tone +" "+ sounder_rate +" "+ sounder_content +" "+ block +" "+ block +" "+ 
                    arm_action +" "+ arm_rate +" "+ block +" "+ block +" "+ block +" "+ 
                    leg_target +" "+ leg_aciton +" "+ leg_rate+" "+ leg_distance +" "+ block +" "
                    ;
        cout<< "        行为参数：" <<parameter_buletooth<<endl;
        // char buf[] = "hello zhjd";
        // string buf1 = buf;
        char parameter_buletooth_char[] = parameter_buletooth;
        write(buletooth, parameter_buletooth_char, strlen(parameter_buletooth_char));    

}