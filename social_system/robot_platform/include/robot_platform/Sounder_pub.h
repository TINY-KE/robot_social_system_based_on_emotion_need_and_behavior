/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-18 20:42:24
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-19 18:06:03
 */
// Gaze_pub  gaze;
// Screen_pub  screen;
// Sounder_pub  sounder;
// Arm_pub  arm;
// Leg_pub  leg;

class Sounder_pub {
    public:
        Sounder_pub(){}
    void run(){
        while (1)
        {
            std::cout<< "Sounder_pub 线程成功 "<<std::endl;
        }
        
    }
    
    public:
        bool flag;
        int period;
};