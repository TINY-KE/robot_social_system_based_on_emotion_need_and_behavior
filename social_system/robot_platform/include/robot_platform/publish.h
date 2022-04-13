/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-29 11:40:12
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2022-04-13 21:04:25
 */
#include "common_include.h"

using namespace std;

class publish {
private:
    int buletooth;

    string  gaze_target_lastpub = "none", screen_type_lastpub = "none", 
            sounder_tone_lastpub = "none", sounder_rate_lastpub = "none", sounder_content_lastpub = "none", 
            arm_action_lastpub = "none", arm_rate_lastpub = "none", 
            leg_target_lastpub = "none", leg_aciton_lastpub = "none", leg_rate_lastpub = "none", leg_distance_lastpub = "none";
public:
    publish(){}
    
    publish( int& buletooth_ ):buletooth(buletooth_)
    {   //social_msg::bhvPara hehavior
        
    }

    void set_ros_node(ros::NodeHandle& n){
        pub_robotic_arm = n.advertise<social_msg::Arms>("arm_action", 10);  
    }
private:   
    ros::Publisher pub_robotic_arm;

    string none_check( string s){
        string block = "none";;
        if( s == "")
            return block;
        else
            return s;
    }

    void body_parameter_check( string behavior_para ,  string &para, string &para_last ){
        string block = "none";
        // 如果 behavior_para 为空的话， para 仍是none， para-last不变。
        if( behavior_para  == ""){
            para = block ; 
        }
        // 如果behavior_para 不为空的话 ，
        else{
            // 如果behavior_para和para-last相同，则para=none， para-last不变
            if( behavior_para == para_last )
                para = block ; 
            // 如果behavior_para和para-last不同，则para=behavior_para， para-last=behavior_para，
            else{
                para = behavior_para;
                para_last = behavior_para;
            }
        }     
    }
public:
// 需求满足状态  、肢体状态 、 内部感知信息（pass、 Uncooperate。 
// 感觉直接改成需求更合适，为什么要通过感知信息而多此一举呢。甚至直接改为行为？）的生成。
    void run( social_msg::bhvPara& behavior,   int period_)
    {
        string  gaze_target = "none", screen_type = "none", 
                sounder_tone = "none", sounder_rate = "none", sounder_content = "none", 
                arm_action = "none", arm_rate = "none", 
                leg_target = "none", leg_aciton = "none", leg_rate = "none", leg_distance = "none";
    // publish gaze
        if(  (period_ >= behavior.gaze.startTime)  &&   (period_ <= behavior.gaze.endTime) )
            body_parameter_check(  behavior.gaze.target, gaze_target,  gaze_target_lastpub );
            
    // publish_screen
        if(  (period_ >= behavior.emotion.startTime)  &&   (period_ <= behavior.emotion.endTime) )
            body_parameter_check(  behavior.emotion.type, screen_type,  screen_type_lastpub );
        
    
    // publish_sounder
        if(  (period_ >= behavior.speech.startTime)  &&   (period_ <= behavior.speech.endTime) ){
            body_parameter_check(  to_string(behavior.speech.tone), sounder_tone,  sounder_tone_lastpub );
            body_parameter_check(  to_string(behavior.speech.rate), sounder_rate,  sounder_rate_lastpub );
            body_parameter_check(  behavior.speech.content, sounder_content,  sounder_content_lastpub );       
        }

    // publish_arm
        if(  (period_ >= behavior.arms.startTime)  &&   (period_ <= behavior.arms.endTime) ){
            body_parameter_check(  behavior.arms.action, arm_action,  arm_action_lastpub );
            body_parameter_check(  to_string(behavior.arms.rate), arm_rate,  arm_rate_lastpub );  
        }
    // publish_leg( period_ );
        if(  (period_ >= behavior.legs.startTime)  &&   (period_ <= behavior.legs.endTime) ){
            body_parameter_check(  behavior.legs.target, leg_target,  leg_target_lastpub );
            body_parameter_check(  behavior.legs.action, leg_aciton,  leg_aciton_lastpub );  
            body_parameter_check(  to_string(behavior.legs.rate), leg_rate,  leg_rate_lastpub );
            body_parameter_check(  to_string(behavior.legs.distance), leg_distance,  leg_distance_lastpub );  
        }


        string block = "none";
        string parameter_buletooth = 
                    gaze_target +" "+ block +" "+ block +" "+ block +" "+ block +";"+ 
                    screen_type +" "+ block +" "+ block +" "+ block +" "+ block +";"+ 
                    arm_action +" "+ arm_rate +" "+ block +" "+ block +" "+ block +";"+ 
                    sounder_tone +" "+ sounder_rate +" "+ sounder_content +" "+ block +" "+ block +";"+ 
                    leg_target +" "+ leg_aciton +" "+ leg_rate+" "+ leg_distance +" "+ block +";"
                    ;
        if( arm_action != "none" ){
            social_msg::Arms arm_msg;
            arm_msg.action = arm_action;
            arm_msg.rate = behavior.arms.rate;
            pub_robotic_arm.publish(arm_msg);
        }
        // cout<< "        行为参数：" <<parameter_buletooth<<endl;
        // char buf[] = "hello zhjd";
        // string buf1 = buf;
        char *parameter_buletooth_charstat = (char *)parameter_buletooth.c_str();
        char parameter_buletooth_char[1000];
        strcpy(  parameter_buletooth_char , parameter_buletooth_charstat );
        printf( "行为参数 parameter_buletooth_char: %s \n" , parameter_buletooth_char);
        write(buletooth, parameter_buletooth_char, strlen(parameter_buletooth_char));

    }
    void clear(){
        gaze_target_lastpub = "none";screen_type_lastpub = "none";
        sounder_tone_lastpub = "none";sounder_rate_lastpub = "none";sounder_content_lastpub = "none";
        arm_action_lastpub = "none";arm_rate_lastpub = "none";
        leg_target_lastpub = "none";leg_aciton_lastpub = "none";leg_rate_lastpub = "none";leg_distance_lastpub = "none";

    }
};
