
(cl:in-package :asdf)

(defsystem "interface_sim-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "need_msg" :depends-on ("_package_need_msg"))
    (:file "_package_need_msg" :depends-on ("_package"))
    (:file "perception_msg" :depends-on ("_package_perception_msg"))
    (:file "_package_perception_msg" :depends-on ("_package"))
    (:file "robot_emotion" :depends-on ("_package_robot_emotion"))
    (:file "_package_robot_emotion" :depends-on ("_package"))
    (:file "robot_status" :depends-on ("_package_robot_status"))
    (:file "_package_robot_status" :depends-on ("_package"))
  ))