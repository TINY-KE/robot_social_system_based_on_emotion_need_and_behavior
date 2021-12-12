;; Auto-generated. Do not edit!


(when (boundp 'interface_sim::robot_emotion)
  (if (not (find-package "INTERFACE_SIM"))
    (make-package "INTERFACE_SIM"))
  (shadow 'robot_emotion (find-package "INTERFACE_SIM")))
(unless (find-package "INTERFACE_SIM::ROBOT_EMOTION")
  (make-package "INTERFACE_SIM::ROBOT_EMOTION"))

(in-package "ROS")
;;//! \htmlinclude robot_emotion.msg.html


(defclass interface_sim::robot_emotion
  :super ros::object
  :slots (_emotion1 _emotion2 _emotion3 _emotion4 _emotion5 _emotion6 _emotion7 _emotion8 ))

(defmethod interface_sim::robot_emotion
  (:init
   (&key
    ((:emotion1 __emotion1) 0.0)
    ((:emotion2 __emotion2) 0.0)
    ((:emotion3 __emotion3) 0.0)
    ((:emotion4 __emotion4) 0.0)
    ((:emotion5 __emotion5) 0.0)
    ((:emotion6 __emotion6) 0.0)
    ((:emotion7 __emotion7) 0.0)
    ((:emotion8 __emotion8) 0.0)
    )
   (send-super :init)
   (setq _emotion1 (float __emotion1))
   (setq _emotion2 (float __emotion2))
   (setq _emotion3 (float __emotion3))
   (setq _emotion4 (float __emotion4))
   (setq _emotion5 (float __emotion5))
   (setq _emotion6 (float __emotion6))
   (setq _emotion7 (float __emotion7))
   (setq _emotion8 (float __emotion8))
   self)
  (:emotion1
   (&optional __emotion1)
   (if __emotion1 (setq _emotion1 __emotion1)) _emotion1)
  (:emotion2
   (&optional __emotion2)
   (if __emotion2 (setq _emotion2 __emotion2)) _emotion2)
  (:emotion3
   (&optional __emotion3)
   (if __emotion3 (setq _emotion3 __emotion3)) _emotion3)
  (:emotion4
   (&optional __emotion4)
   (if __emotion4 (setq _emotion4 __emotion4)) _emotion4)
  (:emotion5
   (&optional __emotion5)
   (if __emotion5 (setq _emotion5 __emotion5)) _emotion5)
  (:emotion6
   (&optional __emotion6)
   (if __emotion6 (setq _emotion6 __emotion6)) _emotion6)
  (:emotion7
   (&optional __emotion7)
   (if __emotion7 (setq _emotion7 __emotion7)) _emotion7)
  (:emotion8
   (&optional __emotion8)
   (if __emotion8 (setq _emotion8 __emotion8)) _emotion8)
  (:serialization-length
   ()
   (+
    ;; float64 _emotion1
    8
    ;; float64 _emotion2
    8
    ;; float64 _emotion3
    8
    ;; float64 _emotion4
    8
    ;; float64 _emotion5
    8
    ;; float64 _emotion6
    8
    ;; float64 _emotion7
    8
    ;; float64 _emotion8
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _emotion1
       (sys::poke _emotion1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _emotion2
       (sys::poke _emotion2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _emotion3
       (sys::poke _emotion3 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _emotion4
       (sys::poke _emotion4 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _emotion5
       (sys::poke _emotion5 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _emotion6
       (sys::poke _emotion6 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _emotion7
       (sys::poke _emotion7 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _emotion8
       (sys::poke _emotion8 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _emotion1
     (setq _emotion1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _emotion2
     (setq _emotion2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _emotion3
     (setq _emotion3 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _emotion4
     (setq _emotion4 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _emotion5
     (setq _emotion5 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _emotion6
     (setq _emotion6 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _emotion7
     (setq _emotion7 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _emotion8
     (setq _emotion8 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get interface_sim::robot_emotion :md5sum-) "3fa29132f7142bca92b48823212b5e10")
(setf (get interface_sim::robot_emotion :datatype-) "interface_sim/robot_emotion")
(setf (get interface_sim::robot_emotion :definition-)
      "float64 emotion1
float64 emotion2
float64 emotion3
float64 emotion4
float64 emotion5
float64 emotion6
float64 emotion7
float64 emotion8
")



(provide :interface_sim/robot_emotion "3fa29132f7142bca92b48823212b5e10")


