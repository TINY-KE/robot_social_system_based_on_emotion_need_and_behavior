/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-19 20:22:40
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-20 10:34:51
 */


#include <sstream>

#include "social_msg/perception_msg.h"
#include "social_msg/need_msg.h"
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

#include <stdio.h>
#include <iostream>
#include <algorithm>
#include <fstream>
#include <chrono>
