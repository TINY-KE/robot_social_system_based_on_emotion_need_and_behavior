/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-19 20:22:40
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-26 21:29:57
 */


#include <sstream>

#include "social_msg/perception_msg.h"
#include "social_msg/need_msg.h"
#include "social_msg/need_satisfy_msg.h"
#include "social_msg/robot_emotion.h"
#include "social_msg/robot_status.h"
#include "social_msg/need_compare.h"
#include "social_msg/bhvPara.h"
#include "social_msg/bhvReply.h"

#include "social_msg/Gaze.h"
#include "social_msg/Emotion.h"
#include "social_msg/Speech.h"
#include "social_msg/Arms.h"
#include "social_msg/Legs.h"

#include "dynamic_reconfigure/server.h" 
#include <thread>
#include <atomic>
#include <stdio.h>
#include <iostream>
#include <algorithm>
#include <fstream>
#include <chrono>
#include <functional>
#include <pthread.h>


#define NONE "\033[m"   //正常终端颜色
#define RED "\033[0;32;31m"    //红色
#define LIGHT_RED "\033[1;31m"  //粗体红色
#define GREEN "\033[0;32;32m"    //绿色
#define LIGHT_GREEN "\033[1;32m"  
#define BLUE "\033[0;32;34m"     //蓝色
#define LIGHT_BLUE "\033[1;34m"
#define DARY_GRAY "\033[1;30m"   //暗灰色
#define CYAN "\033[0;36m"
#define LIGHT_CYAN "\033[1;36m"
#define PURPLE "\033[0;35m"
#define LIGHT_PURPLE "\033[1;35m"  //淡紫色
#define YELLOW "\033[1;33m"      //黄色
#define WHITE "\033[1;37m"    //粗体白色


#define DEBUG