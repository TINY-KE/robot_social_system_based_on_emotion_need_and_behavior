#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import rospy
from social_msg.msg import attitude_msg

def attitude_talker():
    rospy.init_node('attitude_talker', anonymous=True)
    pub = rospy.Publisher('attitude', attitude_msg, queue_size=10)
    rate = rospy.Rate(0.05) # 1hz
    while not rospy.is_shutdown():
# #0
#         rate.sleep()
#         rate.sleep()
# #40
#         atti=attitude_msg()
#         atti.person_name ="Teacher_Li"
#         atti.attitude = "enthusiastic"
#         pub.publish(atti)
#         rospy.loginfo("subscribe1：%s,%s",atti.person_name,atti.attitude)
#         rate.sleep()
# #60
#         atti=attitude_msg()
#         atti.person_name ="Teacher_Li"
#         atti.attitude = "enthusiastic"
#         pub.publish(atti)
#         rate.sleep()
# #80
#         atti=attitude_msg()
#         atti.person_name ="Teacher_Li"
#         atti.attitude = "enthusiastic"
#         pub.publish(atti)
#         rate.sleep()
#         rate.sleep()
#         rate.sleep()
# #140
#         atti=attitude_msg()
#         atti.person_name ="Student_Hong"
#         atti.attitude = "enthusiastic"
#         pub.publish(atti)
#         rate.sleep()
# #160
#         atti=attitude_msg()
#         atti.person_name ="Student_Hong"
#         atti.attitude = "enthusiastic"
#         pub.publish(atti)
#         rate.sleep()
#         rate.sleep()
#         rate.sleep()
# #220
#         atti=attitude_msg()
#         atti.person_name ="Student_Gang"
#         atti.attitude = "enthusiastic"
#         pub.publish(atti)
#         atti=attitude_msg()
#         atti.person_name ="Student_Ming"
#         atti.attitude = "enthusiastic"
#         pub.publish(atti)
#         rate.sleep()
# #240
#         atti=attitude_msg()
#         atti.person_name ="Student_Gang"
#         atti.attitude = "enthusiastic"
#         pub.publish(atti)
#         atti=attitude_msg()
#         atti.person_name ="Student_Ming"
#         atti.attitude = "enthusiastic"
#         pub.publish(atti)
#         rate.sleep()
#         rate.sleep()
#         rate.sleep()
        
# 300
        atti=attitude_msg()
        atti.person_name ="Student_Gang"
        atti.attitude = "enthusiastic"
        pub.publish(atti)
        atti=attitude_msg()
        atti.person_name ="Student_Ming"
        atti.attitude = "enthusiastic"
        pub.publish(atti)
        rate.sleep()
        rate.sleep()
        rate.sleep()
#360
        atti=attitude_msg()
        atti.person_name ="Student_Gang"
        atti.attitude = "enthusiastic"
        pub.publish(atti)
        atti=attitude_msg()
        atti.person_name ="Student_Ming"
        atti.attitude = "enthusiastic"
        pub.publish(atti)
        rate.sleep()
#380
        atti=attitude_msg()
        atti.person_name ="Stranger"
        atti.attitude = "serious"
        pub.publish(atti)
        rate.sleep()
#400
        atti=attitude_msg()
        atti.person_name ="Father_Hong"
        atti.attitude = "enthusiastic"
        atti=attitude_msg()
        atti.person_name ="Father_Ming"
        atti.attitude = "enthusiastic"
        pub.publish(atti)
        rate.sleep()
        rate.sleep()
        rate.sleep()
#460
        atti=attitude_msg()
        atti.person_name ="Father_Hong"
        atti.attitude = "enthusiastic"
        atti=attitude_msg()
        atti.person_name ="Father_Ming"
        atti.attitude = "enthusiastic"
        pub.publish(atti)
        rate.sleep()
        rate.sleep()
        rate.sleep()
#520
        atti=attitude_msg()
        atti.person_name ="Father_Hong"
        atti.attitude = "enthusiastic"
        atti=attitude_msg()
        atti.person_name ="Father_Ming"
        atti.attitude = "enthusiastic"
        pub.publish(atti)

        rate.sleep()

if __name__ == '__main__':
    try:
        attitude_talker()
    except rospy.ROSInterruptException:
        pass










