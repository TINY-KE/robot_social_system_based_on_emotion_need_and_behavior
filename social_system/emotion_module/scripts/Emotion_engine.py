#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import numpy as np
import math
from bisect import bisect_left
from social_msg.msg import robot_emotion
emtionNumber = 8
increaseKP = 0.95 # 情感更新时持续时间延长系数（大于0小于1）
eci=[1,1,1,-1,-1,-1,-1,-1] # 情绪类别
kmi=np.zeros(emtionNumber);a=np.zeros(emtionNumber);b=np.zeros(emtionNumber)
h0=0;h1=np.zeros(emtionNumber);h2=np.zeros(emtionNumber)
h3=np.zeros(emtionNumber);h4=np.zeros(emtionNumber)
# 先把每一维情感的固定参数简化为相同情况,后续可存成csv/txt
for i in range(0,emtionNumber-1):
    kmi[i] = 0.2 # 心境对情绪的作用系数
    a[i] = 0 # 幅度值
    b[i] = 0 # 衰减系数
    h1[i] = 0.1 #unaware情感阈值
    h2[i] = 0.4
    h3[i] = 0.7
    h4[i] = 1

a_m = 0 # 幅度值
b_m = 0.0077 # 衰减系数
c_m = 0 # 情绪偏置，设置性格
kei = 0.2 # 情绪对心境的作用系数,先默认在同向情绪下相同
updatecount = 10 # 情绪更新周期数，默认为10

delta_e = np.zeros(emtionNumber)

class Emtion_engine:
    def __init__(self,current_e,current_m,delta_e):
        self.current_e = current_e
        self.current_m = current_m
        self.delta_e = delta_e
        self.delta_m = 0

    # def robot_emotion_talker(current_e):
    #     rospy.init_node('robot_emotion_talker2', anonymous=True)
    #     pub = rospy.Publisher('robot_emotion_msg', robot_emotion, queue_size=10)
    #     eval=robot_emotion
    #     eval.emotion0 = current_e[0]
    #     eval.emotion1 = current_e[1]
    #     eval.emotion2 = current_e[2]
    #     eval.emotion3 = current_e[3]
    #     eval.emotion4 = current_e[4]
    #     eval.emotion5 = current_e[5]
    #     eval.emotion6 = current_e[6]
    #     eval.emotion7 = current_e[7]
    #     rate = rospy.Rate(1) # 1hz
    #     while not rospy.is_shutdown():
    #         pub.publish(eval)
    #         rospy.loginfo("机器人情感：%f,%f,%f,%f,%f,%f,%f,%f", eval.emotion0,eval.emotion1,eval.emotion2,eval.emotion3,eval.emotion4,eval.emotion5,eval.emotion6,eval.emotion7 )
    #         rate.sleep()


    def judge_mode(self):
        mode=np.zeros(emtionNumber)
        for i in range(len(self.current_e)):
            flag = eci[i]*kmi*self.current_m
            new_e = self.delta_e[i] + flag
            if new_e > 0:
                if new_e > self.current_e[i]:
                    mode[i] = 0 # 当前情绪值为前一时刻心境和当前刺激的综合作用
                else:
                    mode[i] = 1 # 是延长了情绪体验时间
            else:
                if (self.delta_e[i]+self.current_e[i])>abs(flag):
                    mode[i] = 2 # 情绪与刺激间影响力更强的
                else:
                    mode[i] = 3 # 刺激不引起变化，自然衰减
        return mode

    def natural_attenuation_e(self,current_t,start_t):
        for i in range(len(self.current_e)):
            if self.current_e[i] > h1[i]:
                threshold = [h0,h1[i],h2[i],h3[i],h4[i]]
                h = bisect_left(threshold,self.current_e[i])
                eai=(math.ln(self.current_e[i])-math.ln(h))/abs(self.delta_e) * (current_t-start_t)
                self.current_e[i] = self.current_e[i]*math.exp((-1)*eai)
        return self.current_e

    def empathize_e(self,mode):
        for i in range(len(self.current_e)):
            flag = eci[i]*kmi*self.current_m
            if mode[i]==0:
                self.current_e = self.delta_e+flag
            if mode[i]==1:
                for i in range(len(self.current_e)):
                    if self.current_e[i] > h1[i]:
                        threshold = [h0,h1[i],h2[i],h3[i],h4[i]]
                        h = bisect_left(threshold,self.current_e[i])
                        eai=(math.ln(self.current_e[i])-math.ln(h))/abs(increaseKP*self.delta_e) * (current_t-start_t)
                        self.current_e[i] = self.current_e[i]*math.exp((-1)*eai)
            if mode[i]==2:
                self.current_e[i] += self.delta_e[i]
            if mode[i]==3:
                self.current_e[i] +=0
        return self.current_e

    def update_m(self):
        
        for i in range(len(self.current_e)):
            self.delta_m += eci[i]*kei*self.delta_e/(len(np.nonzero(self.delta_m)[0])*updatecount)

        self.current_m +=self.delta_m
        return self.current_m
                
    def natural_attenuation_m(self,current_t,start_t):
        self.current_m *= math.exp((-1)*b_m*(current_t-start_t))+ c_m
        return self.current_e