#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import rospy
from social_msg.msg import need_satisfy_msg

def need_satisfy_talker():
    rospy.init_node('need_satisfy_talker', anonymous=True)
    pub = rospy.Publisher('need_satisfy_msg', need_satisfy_msg, queue_size=10)
    need=need_satisfy_msg()
    need.need_name ="KeepOrder"
    need.satisfy_value = -2
    rate = rospy.Rate(1) # 1hz
    while not rospy.is_shutdown():
        pub.publish(need)
        rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)
        rate.sleep()



if __name__ == '__main__':
    try:
        need_satisfy_talker()
    except rospy.ROSInterruptException:
        pass