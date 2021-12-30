#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import rospy
from social_msg.msg import need_satisfy_msg

def need_satisfy_talker():
    rospy.init_node('need_satisfy_talker', anonymous=True)
    pub = rospy.Publisher('need_satisfy', need_satisfy_msg, queue_size=10)
    rate = rospy.Rate(0.05) # 1hz
    while not rospy.is_shutdown():
#0
        need=need_satisfy_msg()
        need.need_name ="Greet"
        need.satisfy_value = -2
        # pub.publish(need)
        # rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)
        rate.sleep()
        rate.sleep()
#40
        need=need_satisfy_msg()
        need.need_name ="Greet"
        need.satisfy_value = -2
        pub.publish(need)
        rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)
        rate.sleep()


#60

        need=need_satisfy_msg()
        need.need_name ="Greet"
        need.satisfy_value = 2
        pub.publish(need)
        rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)
        rate.sleep()
#80

        need=need_satisfy_msg()
        need.need_name ="Greet"
        need.satisfy_value = 2
        pub.publish(need)
        rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)
        rate.sleep()
        rate.sleep()
        rate.sleep()
#140

        need=need_satisfy_msg()
        need.need_name ="MeasureTempareture"
        need.satisfy_value = 2
        pub.publish(need)
        rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)
        rate.sleep()
#160

        need=need_satisfy_msg()
        need.need_name ="MeasureTempareture"
        need.satisfy_value = 0
        pub.publish(need)
        rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)
        rate.sleep()
        rate.sleep()
        rate.sleep()
#220

        need=need_satisfy_msg()
        need.need_name ="Remind"
        need.satisfy_value = 2
        pub.publish(need)
        rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)
        rate.sleep()
#240
        need=need_satisfy_msg()
        need.need_name ="Chat"
        need.satisfy_value = 0
        pub.publish(need)
        rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)
        rate.sleep()
        rate.sleep()
        rate.sleep()
#300
        need=need_satisfy_msg()
        need.need_name ="MeasureTempareture"
        need.satisfy_value = -2
        pub.publish(need)
        need=need_satisfy_msg()
        need.need_name ="KeepOrder"
        need.satisfy_value = -2
        pub.publish(need)
        rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)

        rate.sleep()
        rate.sleep()
        rate.sleep()
#360
        need=need_satisfy_msg()
        need.need_name ="KeepOrder"
        need.satisfy_value = -2
        pub.publish(need)
        need=need_satisfy_msg()
        need.need_name ="MeasureTempareture"
        need.satisfy_value = -2
        pub.publish(need)
        rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)
        rate.sleep()
#380
        need=need_satisfy_msg()
        need.need_name ="MeasureTempareture"
        need.satisfy_value = -2
        pub.publish(need)
        need=need_satisfy_msg()
        need.need_name ="KeepOrder"
        need.satisfy_value = -2
        pub.publish(need)
        rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)
        rate.sleep()

#400

        need=need_satisfy_msg()
        need.need_name ="MeasureTempareture"
        need.satisfy_value = 2
        pub.publish(need)
        rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)
        rate.sleep()
        rate.sleep()
        rate.sleep()
#460

        need=need_satisfy_msg()
        need.need_name ="MeasureTempareture"
        need.satisfy_value = 2
        pub.publish(need)
        rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)
        rate.sleep()
        rate.sleep()
        rate.sleep()
#520
        need=need_satisfy_msg()
        need.need_name ="MeasureTempareture"
        need.satisfy_value = 2
        pub.publish(need)
        rospy.loginfo("发布的消息3：%s,%d",need.need_name,need.satisfy_value)
        rate.sleep()


if __name__ == '__main__':
    try:
        need_satisfy_talker()
    except rospy.ROSInterruptException:
        pass
