/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-18 20:35:23
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-19 18:05:06
 */
#include "common_include.h"

class Arm_pub {
    public:
        Arm_pub(){}
    void run(){
        while (1)
        {
            std::cout<< "Arm_pub 线程成功 "<<std::endl;
        }
        
    }
    
    public:
        bool flag;
        int period;
        
};