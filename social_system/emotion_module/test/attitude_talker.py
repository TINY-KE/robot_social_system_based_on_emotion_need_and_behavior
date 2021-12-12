#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import rospy
from social_msg.msg import attitude_msg

def attitude_talker():
    rospy.init_node('attitude_talker', anonymous=True)
    pub = rospy.Publisher('attitude_msg', attitude_msg, queue_size=10)
    atti=attitude_msg()
    atti.person_name ="Teacher_Li"
    atti.attitude = "enthusiastic"
    rate = rospy.Rate(1) # 1hz
    while not rospy.is_shutdown():
        pub.publish(atti)
        rospy.loginfo("subscribe1：%s,%s",atti.person_name,atti.attitude)
        rate.sleep()

if __name__ == '__main__':
    try:
        attitude_talker()
    except rospy.ROSInterruptException:
        pass










