#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import rospy
from social_msg.msg import perception_msg

def perception_talker():
    rospy.init_node('perception_talker', anonymous=True)
    pub = rospy.Publisher('perceptions', perception_msg, queue_size=10)
    rate = rospy.Rate(0.05) # 1hz
    while not rospy.is_shutdown():
	perc = perception_msg()
# #0
#         perc.time = rospy.get_time()
#     	perc.person_name =""
#     	perc.speech = ""
#     	perc.person_emotion = ""
#         pub.publish(perc)
#         rospy.loginfo("发布的消息2：%f,%s,%s,%s",perc.time,perc.person_name,perc.speech,perc.person_emotion)
#         rate.sleep()
#         rate.sleep()
# #40
#         perc.time = rospy.get_time()
#     	perc.person_name =""
#     	perc.speech = ""
#     	perc.person_emotion = ""
#         pub.publish(perc)
#         rospy.loginfo("发布的消息2：%f,%s,%s,%s",perc.time,perc.person_name,perc.speech,perc.person_emotion)
#         rate.sleep()

# #60
#         perc.time = rospy.get_time()
#     	perc.person_name ="Teacher_Li"
#     	perc.speech = ""
#     	perc.person_emotion = "None"
#         pub.publish(perc)
#         rospy.loginfo("发布的消息2：%f,%s,%s,%s",perc.time,perc.person_name,perc.speech,perc.person_emotion)
#         rate.sleep()
# #80
#         perc.time = rospy.get_time()
#     	perc.person_name ="Teacher_Li"
#     	perc.speech = ""
#     	perc.person_emotion = "Happy"
#         pub.publish(perc)
#         rospy.loginfo("发布的消息2：%f,%s,%s,%s",perc.time,perc.person_name,perc.speech,perc.person_emotion)
#         rate.sleep()
#         rate.sleep()
#         rate.sleep()
# #140
#         perc.time = rospy.get_time()
#     	perc.person_name ="Student_Hong"
#     	perc.speech = "good"
#     	perc.person_emotion = "Happy"
#         pub.publish(perc)
#         rospy.loginfo("发布的消息2：%f,%s,%s,%s",perc.time,perc.person_name,perc.speech,perc.person_emotion)
#         rate.sleep()
# #160
#         perc.time = rospy.get_time()
#     	perc.person_name ="Student_Hong"
#     	perc.speech = ""
#     	perc.person_emotion = "None"
#         pub.publish(perc)
#         rospy.loginfo("发布的消息2：%f,%s,%s,%s",perc.time,perc.person_name,perc.speech,perc.person_emotion)
#         rate.sleep()
#         rate.sleep()
#         rate.sleep()
# #220
#         perc.time = rospy.get_time()
#     	perc.person_name ="Student_Hong"
#     	perc.speech = ""
#     	perc.person_emotion = "Happy"
#         pub.publish(perc)
#         rospy.loginfo("发布的消息2：%f,%s,%s,%s",perc.time,perc.person_name,perc.speech,perc.person_emotion)
#         rate.sleep()
# #240
#         perc.time = rospy.get_time()
#     	perc.person_name ="Student_Ming"
#     	perc.speech = ""
#     	perc.person_emotion = "None"
#         pub.publish(perc)
#         rospy.loginfo("发布的消息2：%f,%s,%s,%s",perc.time,perc.person_name,perc.speech,perc.person_emotion)
#         perc.time = rospy.get_time()
#     	perc.person_name ="Student_Gang"
#     	perc.speech = ""
#     	perc.person_emotion = "None"
#         pub.publish(perc)
#         rate.sleep()
#         rate.sleep()
#         rate.sleep()
#300
        perc.time = rospy.get_time()
    	perc.person_name ="Student_Ming"
    	perc.speech = ""
    	perc.person_emotion = "None"
        pub.publish(perc)
        rospy.loginfo("发布的消息2：%f,%s,%s,%s",perc.time,perc.person_name,perc.speech,perc.person_emotion)
        perc.time = rospy.get_time()
    	perc.person_name ="Student_Gang"
    	perc.speech = ""
    	perc.person_emotion = "None"
        pub.publish(perc)
        rate.sleep()
        rate.sleep()
        rate.sleep()
#360
        perc.time = rospy.get_time()
    	perc.person_name ="Student_Ming"
    	perc.speech = ""
    	perc.person_emotion = "None"
        pub.publish(perc)
        rospy.loginfo("发布的消息2：%f,%s,%s,%s",perc.time,perc.person_name,perc.speech,perc.person_emotion)
        perc.time = rospy.get_time()
    	perc.person_name ="Student_Gang"
    	perc.speech = ""
    	perc.person_emotion = "None"
        pub.publish(perc)
        rate.sleep()
#380
        perc.time = rospy.get_time()
    	perc.person_name ="Student_Gang"
    	perc.speech = ""
    	perc.person_emotion = "None"
        pub.publish(perc)
        rate.sleep()
#400
        perc.time = rospy.get_time()
    	perc.person_name ="Stranger"
    	perc.speech = ""
    	perc.person_emotion = "None"
        pub.publish(perc)
        rospy.loginfo("发布的消息2：%f,%s,%s,%s",perc.time,perc.person_name,perc.speech,perc.person_emotion)
        rate.sleep()
        rate.sleep()
        rate.sleep()
#460
        perc.time = rospy.get_time()
    	perc.person_name ="Father_Hong"
    	perc.speech = ""
    	perc.person_emotion = "None"
        pub.publish(perc)
        rospy.loginfo("发布的消息2：%f,%s,%s,%s",perc.time,perc.person_name,perc.speech,perc.person_emotion)
        rate.sleep()
        rate.sleep()
        rate.sleep()
#520
        perc.time = rospy.get_time()
    	perc.person_name ="Father_Ming"
    	perc.speech = ""
    	perc.person_emotion = "None"
        pub.publish(perc)
        rospy.loginfo("发布的消息2：%f,%s,%s,%s",perc.time,perc.person_name,perc.speech,perc.person_emotion)
        rate.sleep()

if __name__ == '__main__':
    try:
        perception_talker()
    except rospy.ROSInterruptException:
        pass
