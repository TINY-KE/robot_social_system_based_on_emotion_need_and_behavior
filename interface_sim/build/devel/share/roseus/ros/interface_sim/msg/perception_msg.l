;; Auto-generated. Do not edit!


(when (boundp 'interface_sim::perception_msg)
  (if (not (find-package "INTERFACE_SIM"))
    (make-package "INTERFACE_SIM"))
  (shadow 'perception_msg (find-package "INTERFACE_SIM")))
(unless (find-package "INTERFACE_SIM::PERCEPTION_MSG")
  (make-package "INTERFACE_SIM::PERCEPTION_MSG"))

(in-package "ROS")
;;//! \htmlinclude perception_msg.msg.html


(defclass interface_sim::perception_msg
  :super ros::object
  :slots (_time _person_name _IDtype _intention _p _speech _person_emotion ))

(defmethod interface_sim::perception_msg
  (:init
   (&key
    ((:time __time) 0.0)
    ((:person_name __person_name) "")
    ((:IDtype __IDtype) "")
    ((:intention __intention) "")
    ((:p __p) 0.0)
    ((:speech __speech) "")
    ((:person_emotion __person_emotion) "")
    )
   (send-super :init)
   (setq _time (float __time))
   (setq _person_name (string __person_name))
   (setq _IDtype (string __IDtype))
   (setq _intention (string __intention))
   (setq _p (float __p))
   (setq _speech (string __speech))
   (setq _person_emotion (string __person_emotion))
   self)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:person_name
   (&optional __person_name)
   (if __person_name (setq _person_name __person_name)) _person_name)
  (:IDtype
   (&optional __IDtype)
   (if __IDtype (setq _IDtype __IDtype)) _IDtype)
  (:intention
   (&optional __intention)
   (if __intention (setq _intention __intention)) _intention)
  (:p
   (&optional __p)
   (if __p (setq _p __p)) _p)
  (:speech
   (&optional __speech)
   (if __speech (setq _speech __speech)) _speech)
  (:person_emotion
   (&optional __person_emotion)
   (if __person_emotion (setq _person_emotion __person_emotion)) _person_emotion)
  (:serialization-length
   ()
   (+
    ;; float64 _time
    8
    ;; string _person_name
    4 (length _person_name)
    ;; string _IDtype
    4 (length _IDtype)
    ;; string _intention
    4 (length _intention)
    ;; float64 _p
    8
    ;; string _speech
    4 (length _speech)
    ;; string _person_emotion
    4 (length _person_emotion)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _time
       (sys::poke _time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _person_name
       (write-long (length _person_name) s) (princ _person_name s)
     ;; string _IDtype
       (write-long (length _IDtype) s) (princ _IDtype s)
     ;; string _intention
       (write-long (length _intention) s) (princ _intention s)
     ;; float64 _p
       (sys::poke _p (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _speech
       (write-long (length _speech) s) (princ _speech s)
     ;; string _person_emotion
       (write-long (length _person_emotion) s) (princ _person_emotion s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _time
     (setq _time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _person_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _person_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _IDtype
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _IDtype (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _intention
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _intention (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _p
     (setq _p (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _speech
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _speech (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _person_emotion
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _person_emotion (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get interface_sim::perception_msg :md5sum-) "c6c78bdb9d238a06de9c10c3d3b3dce6")
(setf (get interface_sim::perception_msg :datatype-) "interface_sim/perception_msg")
(setf (get interface_sim::perception_msg :definition-)
      "float64 time
string person_name
string IDtype
string intention
float64 p
string speech
string person_emotion
")



(provide :interface_sim/perception_msg "c6c78bdb9d238a06de9c10c3d3b3dce6")


