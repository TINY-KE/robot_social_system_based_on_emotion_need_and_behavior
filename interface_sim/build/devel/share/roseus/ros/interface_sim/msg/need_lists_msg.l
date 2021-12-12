;; Auto-generated. Do not edit!


(when (boundp 'interface_sim::need_lists_msg)
  (if (not (find-package "INTERFACE_SIM"))
    (make-package "INTERFACE_SIM"))
  (shadow 'need_lists_msg (find-package "INTERFACE_SIM")))
(unless (find-package "INTERFACE_SIM::NEED_LISTS_MSG")
  (make-package "INTERFACE_SIM::NEED_LISTS_MSG"))

(in-package "ROS")
;;//! \htmlinclude need_lists_msg.msg.html


(defclass interface_sim::need_lists_msg
  :super ros::object
  :slots (_person _rob_emotion _person_emotion _name _weight _speech ))

(defmethod interface_sim::need_lists_msg
  (:init
   (&key
    ((:person __person) "")
    ((:rob_emotion __rob_emotion) "")
    ((:person_emotion __person_emotion) "")
    ((:name __name) "")
    ((:weight __weight) 0.0)
    ((:speech __speech) "")
    )
   (send-super :init)
   (setq _person (string __person))
   (setq _rob_emotion (string __rob_emotion))
   (setq _person_emotion (string __person_emotion))
   (setq _name (string __name))
   (setq _weight (float __weight))
   (setq _speech (string __speech))
   self)
  (:person
   (&optional __person)
   (if __person (setq _person __person)) _person)
  (:rob_emotion
   (&optional __rob_emotion)
   (if __rob_emotion (setq _rob_emotion __rob_emotion)) _rob_emotion)
  (:person_emotion
   (&optional __person_emotion)
   (if __person_emotion (setq _person_emotion __person_emotion)) _person_emotion)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:weight
   (&optional __weight)
   (if __weight (setq _weight __weight)) _weight)
  (:speech
   (&optional __speech)
   (if __speech (setq _speech __speech)) _speech)
  (:serialization-length
   ()
   (+
    ;; string _person
    4 (length _person)
    ;; string _rob_emotion
    4 (length _rob_emotion)
    ;; string _person_emotion
    4 (length _person_emotion)
    ;; string _name
    4 (length _name)
    ;; float64 _weight
    8
    ;; string _speech
    4 (length _speech)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _person
       (write-long (length _person) s) (princ _person s)
     ;; string _rob_emotion
       (write-long (length _rob_emotion) s) (princ _rob_emotion s)
     ;; string _person_emotion
       (write-long (length _person_emotion) s) (princ _person_emotion s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float64 _weight
       (sys::poke _weight (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _speech
       (write-long (length _speech) s) (princ _speech s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _person
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _person (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _rob_emotion
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _rob_emotion (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _person_emotion
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _person_emotion (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _weight
     (setq _weight (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _speech
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _speech (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get interface_sim::need_lists_msg :md5sum-) "b3fdae128c44bcea9ca7d8a10aee1458")
(setf (get interface_sim::need_lists_msg :datatype-) "interface_sim/need_lists_msg")
(setf (get interface_sim::need_lists_msg :definition-)
      "string person
string rob_emotion
string person_emotion
string name
float64 weight
string speech
")



(provide :interface_sim/need_lists_msg "b3fdae128c44bcea9ca7d8a10aee1458")


