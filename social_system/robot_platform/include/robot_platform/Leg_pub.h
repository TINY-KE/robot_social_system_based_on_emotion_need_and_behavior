/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-18 20:42:25
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-20 09:50:54
 */
// Gaze_pub  gaze;
// Screen_pub  screen;
// Sounder_pub  sounder;
// Arm_pub  arm;
// Leg_pub  leg;
#include "common_include.h"
class Leg_pub {
    public:
        Leg_pub(){}
    
    public:
        bool flag;
        int period;
        void run( int period_cur){}
};