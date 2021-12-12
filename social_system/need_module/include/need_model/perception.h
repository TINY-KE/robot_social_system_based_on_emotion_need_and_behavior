/*
 * @Descripttion: 
 * @version: 
 * @Author: sueRimn
 * @Date: 2021-09-21 21:16:50
 * @LastEditors: sueRimn
 * @LastEditTime: 2021-09-29 10:38:41
 */
//
// Created by zhjd on 2021/5/11.
//

#ifndef TEST_PERCEPTION_H
#define TEST_PERCEPTION_H
#include <string>
class perception{
public:
    double time_;
    std::string person_name_;
    std::string IDtype_;
    std::string intention_;
    double p_;
    std::string speech_;
    std::string person_emotion_;
    
public:
    perception(){};
    perception(std::string person_name, std::string IDtype, std::string intention, double p, std::string speech, std::string emotion):
        person_name_(person_name), IDtype_(IDtype), intention_(intention), p_(p), speech_(speech), person_emotion_(emotion)
        {
            
        }
};

#endif //TEST_PERCEPTION_H
