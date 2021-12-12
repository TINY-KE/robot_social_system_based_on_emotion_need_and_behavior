;; Auto-generated. Do not edit!


(when (boundp 'interface_sim::robot_status)
  (if (not (find-package "INTERFACE_SIM"))
    (make-package "INTERFACE_SIM"))
  (shadow 'robot_status (find-package "INTERFACE_SIM")))
(unless (find-package "INTERFACE_SIM::ROBOT_STATUS")
  (make-package "INTERFACE_SIM::ROBOT_STATUS"))

(in-package "ROS")
;;//! \htmlinclude robot_status.msg.html


(defclass interface_sim::robot_status
  :super ros::object
  :slots (_body1 _body2 _body3 _body4 _body5 _body6 _body7 _idleState ))

(defmethod interface_sim::robot_status
  (:init
   (&key
    ((:body1 __body1) 0.0)
    ((:body2 __body2) 0.0)
    ((:body3 __body3) 0.0)
    ((:body4 __body4) 0.0)
    ((:body5 __body5) 0.0)
    ((:body6 __body6) 0.0)
    ((:body7 __body7) 0.0)
    ((:idleState __idleState) nil)
    )
   (send-super :init)
   (setq _body1 (float __body1))
   (setq _body2 (float __body2))
   (setq _body3 (float __body3))
   (setq _body4 (float __body4))
   (setq _body5 (float __body5))
   (setq _body6 (float __body6))
   (setq _body7 (float __body7))
   (setq _idleState __idleState)
   self)
  (:body1
   (&optional __body1)
   (if __body1 (setq _body1 __body1)) _body1)
  (:body2
   (&optional __body2)
   (if __body2 (setq _body2 __body2)) _body2)
  (:body3
   (&optional __body3)
   (if __body3 (setq _body3 __body3)) _body3)
  (:body4
   (&optional __body4)
   (if __body4 (setq _body4 __body4)) _body4)
  (:body5
   (&optional __body5)
   (if __body5 (setq _body5 __body5)) _body5)
  (:body6
   (&optional __body6)
   (if __body6 (setq _body6 __body6)) _body6)
  (:body7
   (&optional __body7)
   (if __body7 (setq _body7 __body7)) _body7)
  (:idleState
   (&optional __idleState)
   (if __idleState (setq _idleState __idleState)) _idleState)
  (:serialization-length
   ()
   (+
    ;; float64 _body1
    8
    ;; float64 _body2
    8
    ;; float64 _body3
    8
    ;; float64 _body4
    8
    ;; float64 _body5
    8
    ;; float64 _body6
    8
    ;; float64 _body7
    8
    ;; bool _idleState
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _body1
       (sys::poke _body1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _body2
       (sys::poke _body2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _body3
       (sys::poke _body3 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _body4
       (sys::poke _body4 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _body5
       (sys::poke _body5 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _body6
       (sys::poke _body6 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _body7
       (sys::poke _body7 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _idleState
       (if _idleState (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _body1
     (setq _body1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _body2
     (setq _body2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _body3
     (setq _body3 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _body4
     (setq _body4 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _body5
     (setq _body5 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _body6
     (setq _body6 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _body7
     (setq _body7 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _idleState
     (setq _idleState (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get interface_sim::robot_status :md5sum-) "6f24a8e12bb39a74b5495d323c297d73")
(setf (get interface_sim::robot_status :datatype-) "interface_sim/robot_status")
(setf (get interface_sim::robot_status :definition-)
      "float64 body1
float64 body2
float64 body3
float64 body4
float64 body5
float64 body6
float64 body7
bool idleState
")



(provide :interface_sim/robot_status "6f24a8e12bb39a74b5495d323c297d73")


