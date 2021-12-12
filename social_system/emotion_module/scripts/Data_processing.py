#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# coding=utf-8
# -*- coding: utf-8 -*-
import csv
import numpy as np
import pandas as pd
from aip import AipNlp

import rospy
import message_filters
from social_msg.msg import attitude_msg
from social_msg.msg import need_satisfy_msg
from social_msg.msg import perception_msg
# import social_msg.msg import attitude_msg
import Emotion_engine

### 配置百度文本情感趋势分析接口
APP_ID = '25295465'
API_KEY = 'WxY0AiFTs0HgWZaSsWGB6lM4'
SECRET_KEY = '9oGOc6MmGGkFcYp6aGaRRy1fT87TYQ1t'
client = AipNlp(APP_ID, API_KEY, SECRET_KEY)

def input_emotion_stimulate(need_eval):
       for i in range(len(need_eval)/2):
              Emotion_engine.delta_e[int(need_eval[2*i])]=need_eval[2*i+1]



def callback_need(need_satisfy_msg):
       #rospy.loginfo( "I heard %s %d", need_satisfy_msg.need_name,need_satisfy_msg.satisfy_value)
       
       # 自我满足信息处理，通过查找dataframe实现值映射
       tmp_lst = []
       with open('/home/zhjd/ws/src/social_system/emotion_module/scripts/need_satisfy.csv', 'r') as f:
              reader = csv.reader(f)
              for row in reader:
                     tmp_lst.append(row)
       df = pd.DataFrame(tmp_lst[1:], columns=tmp_lst[0]) 
       df.set_index(["satisfy_value"], inplace=True)
       emotion_val=df.loc[str(need_satisfy_msg.satisfy_value),need_satisfy_msg.need_name]
       t = emotion_val.split(',')
       #### 由  自我状态满足  带来的情绪变化状况 [ float_情绪种类，float_情绪变化强度 ]
       need_eval= map(float,t) 
       print('Internal_eval: ',need_eval)
       # Emotion_engine.delta_e[int(need_eval[0])]=need_eval[1]  #('need_eval: ', [4.0, 0.4, 3.0, 0.2])  其中的need_eval[2 3] 是做什么的？
       input_emotion_stimulate(need_eval)

def callback_a_p(attitude_msg,perception_msg):   #用户情绪迁移 + 用户语音输入
       #rospy.loginfo( "I heard %s %s %s %s %s",perception_msg.person_name,perception_msg.speech,\
              #perception_msg.person_emotion,attitude_msg.person_name,attitude_msg.attitude)

       # 社交态度信息处理
       if attitude_msg.person_name == perception_msg.person_name:
              tmp_lst = []
              with open('/home/zhjd/ws/src/social_system/emotion_module/scripts/attitude.csv', 'r') as f:
                     reader = csv.reader(f)
                     for row in reader:
                            tmp_lst.append(row)
              df = pd.DataFrame(tmp_lst[1:], columns=tmp_lst[0]) 
              df.set_index(["person_emotion"], inplace=True)
              emotion_val=df.loc[perception_msg.person_emotion,attitude_msg.attitude]
              t = emotion_val.split(',')
              #### 由  社交态度  带来的情绪变化状况 [ float_情绪种类，float_情绪变化强度 ]
              attitude_eval= map(float,t) 
              print ('PeopleEmotionTransfer_eval: ',attitude_eval)
              # Emotion_engine.delta_e[int(attitude_eval[0])]=attitude_eval[1]
              input_emotion_stimulate(need_eval)

       else:
              print("The social attitude object is different from the conversation object ! ")

       # 他人评价信息处理
       text = perception_msg.speech
       charset="UTF-8"
       eclass=client.sentimentClassify(text)[u'items'][0][u'sentiment'] #文本对应情感类别标签
       tmp_lst1 = []
       with open('/home/zhjd/ws/src/social_system/emotion_module/scripts/perception.csv', 'r') as f1:
              reader = csv.reader(f1)
              for row in reader:
                     tmp_lst1.append(row)
       df = pd.DataFrame(tmp_lst1[1:], columns=tmp_lst1[0]) 
       df.set_index(["speech_emotion"], inplace=True)
       emotion_val=df.loc[str(eclass),'empathy']
       t = emotion_val.split(',')
       #### 由  他人评价 带来的情绪变化状况 [ float_情绪种类，float_情绪变化强度 ]
       perception_eval= map(float,t) 
       print('External_eval: ',perception_eval)
       # Emotion_engine.delta_e[int(perception_eval[0])]=perception_eval[1]   #delta_e是8维向量
       input_emotion_stimulate(need_eval)


# 订阅三种情感来源消息
def listener():
       rospy.init_node('emotion_listener', anonymous=True)
       t1 = message_filters.Subscriber("attitude_msg", attitude_msg)
       t2 = message_filters.Subscriber("need_satisfy_msg", need_satisfy_msg)
       t3 = message_filters.Subscriber("perception_msg", perception_msg)
       ts = message_filters.ApproximateTimeSynchronizer([t1, t3], 1, 1, allow_headerless=True)
       t2.registerCallback(callback_need)
       ts.registerCallback(callback_a_p)
       # spin() simply keeps python from exiting until this node is stopped
       rospy.spin()

