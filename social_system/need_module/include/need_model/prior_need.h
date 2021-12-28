//
// Created by zhjd on 2021/5/11.
//
#include <iostream>
#include <vector>
#include <string>
// #include "behavior.h"
#include "perception.h"
#include <map>
#include "task_need.h"
#include "inner_need.h"

#ifndef TEST_CHECKRULE_H
#define TEST_CHECKRULE_H

//std::vector< std::string > need_list    = { "greet_teacher", "greet_student", "greet_parent"};
//std::vector< int > weight_list          = {5,4,3,2,1};



class prior_need {
private:

    /* 任务 类 */
    task_need *task_model =  new task_need();;
    /* 生理 类 */
    inner_need *inner_model = new inner_need();
    /* 结构体 ，用于发送给行为管理*/
    
    perception per_;
    perception per_second;
    std::vector<perception> per_list ;
    bool first_per_undeal = false;
    double emotion_[8];
    double body_[8];
    int need_num;
    bool updateInit_perception = false;
    bool updateInit_emotion = false;
    bool updateInit_status = false;
public:
    prior_need(  ) {
        perceptionClear();
     }
    
    void PerceptionUpdate(perception per ){ 
        // if( first_per_undeal) {
        //     per_second = per;
        //     printf(  YELLOW "     Update Peception second\n"NONE);
        // }
        // else{
        //     per_ = per;
        //     first_per_undeal = true;
        //     printf(  YELLOW "     Update Peception first\n"NONE);
        // }
        per_ = per;
        per_list.push_back( per );
        printf(  YELLOW "     Update Peception first\n"NONE);
        updateInit_perception = true;
        // cout<< "     Update Peception\n";
        
    }

    void RobotEmotionUpdate(double emotion[8] ){ 
        for(int i = 0 ; i < 8 ; i ++ ) emotion_[i] = emotion[i];
        updateInit_emotion = true;
        // cout<< "     Update Robot Emotion \n";
        printf(  YELLOW "     Update Robot Emotion \n"NONE);
    }

    void RobotStatusUpdate(double body[8] ){ 
        for(int i = 0 ; i < 8 ; i ++ ) body_[i] = body[i];
        updateInit_status = true;
        printf(  YELLOW "     Update Robot Status\n"NONE);
        // cout<< "     Update Robot Status\n";
    }
    
    void input_update(perception per ,double emotion[8], double body[8] ){ 
        per_ = per;
        for(int i = 0 ; i < 8 ; i ++ ) emotion_[i] = emotion[i];
        for(int i = 0 ; i < 8 ; i ++ ) body_[i] = body[i];
    }

    void perceptionClear(){
        per_list.clear();
        // per_.intention_ = "";
        // per_.person_name_ = "";
        // per_.IDtype_ = "";
        // per_.person_emotion_ = "";
        // per_.speech_ = "";

    }
    
    bool updateInit(){  return (/* updateInit_perception &&  */updateInit_emotion && updateInit_status);}
    
    std::vector<need> need_compute_all(){
        cout<< "Start to Need Computation !!\n";
        std::vector<need> output_need_list;
        std::vector<need> temp;
        if( per_list.size() != 0  ){
            for( int i = 0 ; i < per_list.size(); i++ )
            {
                perception per = per_list[i];
                task_model -> update( per, emotion_, body_ );
                inner_model -> update(per, emotion_, body_);   
                // 任务性需求
                temp = task_model -> need_output();
                for(int j = 0 ; j < temp.size() ; j ++ )  output_need_list.push_back( temp[j] );
                // 生理性需求
                temp = inner_model -> need_compute_and_output();;
                for(int k = 0 ; k < temp.size() ; k ++ )  output_need_list.push_back( temp[k] );  
            }
        }
        else{
            perception per_none;  per_none.p_ = 0;
            task_model -> update( per_none, emotion_, body_ );
            inner_model -> update(per_none, emotion_, body_); 
            // 任务性需求
            temp = task_model -> need_output();
            for(int j = 0 ; j < temp.size() ; j ++ )  output_need_list.push_back( temp[j] );
            // 生理性需求
            temp = inner_model -> need_compute_and_output();;
            for(int k = 0 ; k < temp.size() ; k ++ )  output_need_list.push_back( temp[k] );  
        }
        
        
        
         //清空 perception
        perceptionClear();  //TODO: ??
        
        // printf 当前周期中生成的需求
        if( output_need_list.size() != 0 )
            for(int i = 0; i< output_need_list.size() ; i++  )  
            {
                std::cout <<  "    Output Need " << i+1 << "：" << output_need_list[i].need_name << " ,Weight: " <<output_need_list[i].weight;
                if (  output_need_list[i].person_name != "")
                    std::cout <<" ,for " <<output_need_list[i].person_name<<" as " <<output_need_list[i].IDtype;
                std::cout<<std::endl;
            }     
        else std::cout<<"    No need generated !\n";
        // 输出
        return output_need_list;
    }



    // void task_wu(need_wu n){
    //     task_model -> weightUpdate(n);
    // }

    // void inner_wu(need_wu n){
    //     inner_model -> weightUpdate(n);
    // }

};
#endif //TEST_CHECKRULE_H


    