#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import rospy
from social_msg.msg import perception_msg

def perception_talker():
    rospy.init_node('perception_talker', anonymous=True)
    pub = rospy.Publisher('perception_msg', perception_msg, queue_size=10)
    rate = rospy.Rate(1) # 1hz
    while not rospy.is_shutdown():
	perc = perception_msg()
        perc.time = rospy.get_time()
    	perc.person_name ="Teacher_Li"
    	perc.speech = "good"
    	perc.person_emotion = "Happy"
        pub.publish(perc)
        rospy.loginfo("发布的消息2：%f,%s,%s,%s",perc.time,perc.person_name,perc.speech,perc.person_emotion)
        rate.sleep()

if __name__ == '__main__':
    try:
        perception_talker()
    except rospy.ROSInterruptException:
        pass
