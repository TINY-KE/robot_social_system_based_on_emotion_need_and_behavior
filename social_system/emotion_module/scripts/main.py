#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import rospy
import numpy as np
import Data_processing
import Emotion_engine
from social_msg.msg import robot_emotion

def robot_emotion_talker(current_e):
    rospy.init_node('robot_emotion_talker', anonymous=True)
    pub = rospy.Publisher('robot_emotion_msg', robot_emotion, queue_size=10)
    eval=robot_emotion
    eval.emotion0 = current_e[0]
    eval.emotion1 = current_e[1]
    eval.emotion2 = current_e[2]
    eval.emotion3 = current_e[3]
    eval.emotion4 = current_e[4]
    eval.emotion5 = current_e[5]
    eval.emotion6 = current_e[6]
    eval.emotion7 = current_e[7]
    rate = rospy.Rate(1) # 1hz
    while not rospy.is_shutdown():
        pub.publish(eval)
        rospy.loginfo("机器人情感：%f,%f,%f,%f,%f,%f,%f,%f", eval.emotion0,eval.emotion1,eval.emotion2,eval.emotion3,eval.emotion4,eval.emotion5,eval.emotion6,eval.emotion7 )
        rate.sleep()

if __name__ == '__main__':
    #need_eval = Data_processing.listener()
    current_e = np.zeros(Emotion_engine.emtionNumber)
    current_m = 0
    print ('[0]')
    Data_processing.listener()
    print ('[1]')
    current_e += Emotion_engine.delta_e  #delta_e 情感的变化量
    print ('[2]')
    current_e = Emotion_engine.Emtion_engine(current_e,current_m,Emotion_engine.delta_e ).natural_attenuation_e()  #return current_e
    try:
        robot_emotion_talker(current_e)  #将当前的
        print ('[success] try robot_emotion_talker')
    except rospy.ROSInterruptException:
        print ('[fail] try robot_emotion_talker')
        pass