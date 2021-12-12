;; Auto-generated. Do not edit!


(when (boundp 'interface_sim::need_msg)
  (if (not (find-package "INTERFACE_SIM"))
    (make-package "INTERFACE_SIM"))
  (shadow 'need_msg (find-package "INTERFACE_SIM")))
(unless (find-package "INTERFACE_SIM::NEED_MSG")
  (make-package "INTERFACE_SIM::NEED_MSG"))

(in-package "ROS")
;;//! \htmlinclude need_msg.msg.html


(defclass interface_sim::need_msg
  :super ros::object
  :slots (_need_name _person_name _IDtype _rob_emotion _person_emotion _weight _speech ))

(defmethod interface_sim::need_msg
  (:init
   (&key
    ((:need_name __need_name) "")
    ((:person_name __person_name) "")
    ((:IDtype __IDtype) "")
    ((:rob_emotion __rob_emotion) "")
    ((:person_emotion __person_emotion) "")
    ((:weight __weight) 0.0)
    ((:speech __speech) "")
    )
   (send-super :init)
   (setq _need_name (string __need_name))
   (setq _person_name (string __person_name))
   (setq _IDtype (string __IDtype))
   (setq _rob_emotion (string __rob_emotion))
   (setq _person_emotion (string __person_emotion))
   (setq _weight (float __weight))
   (setq _speech (string __speech))
   self)
  (:need_name
   (&optional __need_name)
   (if __need_name (setq _need_name __need_name)) _need_name)
  (:person_name
   (&optional __person_name)
   (if __person_name (setq _person_name __person_name)) _person_name)
  (:IDtype
   (&optional __IDtype)
   (if __IDtype (setq _IDtype __IDtype)) _IDtype)
  (:rob_emotion
   (&optional __rob_emotion)
   (if __rob_emotion (setq _rob_emotion __rob_emotion)) _rob_emotion)
  (:person_emotion
   (&optional __person_emotion)
   (if __person_emotion (setq _person_emotion __person_emotion)) _person_emotion)
  (:weight
   (&optional __weight)
   (if __weight (setq _weight __weight)) _weight)
  (:speech
   (&optional __speech)
   (if __speech (setq _speech __speech)) _speech)
  (:serialization-length
   ()
   (+
    ;; string _need_name
    4 (length _need_name)
    ;; string _person_name
    4 (length _person_name)
    ;; string _IDtype
    4 (length _IDtype)
    ;; string _rob_emotion
    4 (length _rob_emotion)
    ;; string _person_emotion
    4 (length _person_emotion)
    ;; float64 _weight
    8
    ;; string _speech
    4 (length _speech)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _need_name
       (write-long (length _need_name) s) (princ _need_name s)
     ;; string _person_name
       (write-long (length _person_name) s) (princ _person_name s)
     ;; string _IDtype
       (write-long (length _IDtype) s) (princ _IDtype s)
     ;; string _rob_emotion
       (write-long (length _rob_emotion) s) (princ _rob_emotion s)
     ;; string _person_emotion
       (write-long (length _person_emotion) s) (princ _person_emotion s)
     ;; float64 _weight
       (sys::poke _weight (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _speech
       (write-long (length _speech) s) (princ _speech s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _need_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _need_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _person_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _person_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _IDtype
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _IDtype (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _rob_emotion
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _rob_emotion (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _person_emotion
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _person_emotion (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _weight
     (setq _weight (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _speech
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _speech (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get interface_sim::need_msg :md5sum-) "89d9fdc137ce49edd6361ad65d7aec1f")
(setf (get interface_sim::need_msg :datatype-) "interface_sim/need_msg")
(setf (get interface_sim::need_msg :definition-)
      "string need_name
string person_name
string IDtype
string rob_emotion
string person_emotion
float64 weight
string speech
")



(provide :interface_sim/need_msg "89d9fdc137ce49edd6361ad65d7aec1f")


