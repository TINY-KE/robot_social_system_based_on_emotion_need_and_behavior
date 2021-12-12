#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import rospy
from social_msg.msg import perception_msg

def perception_talker():
    rospy.init_node('perception_talker', anonymous=True)
    pub = rospy.Publisher('perception_msg', perception_msg, queue_size=10)
    perc=perception_msg()
    perc.person_name ="Teacher_Li"
    perc.speech = "Very good"
    perc.person_emotion = "Happy"
    rate = rospy.Rate(1) # 1hz
    while not rospy.is_shutdown():
        pub.publish(perc)
        rospy.loginfo("发布的消息2：%s,%s,%s",perc.person_name,perc.speech,perc.person_emotion)
        rate.sleep()

if __name__ == '__main__':
    try:
        perception_talker()
    except rospy.ROSInterruptException:
        pass