; Auto-generated. Do not edit!


(cl:in-package interface_sim-msg)


;//! \htmlinclude perception_msg.msg.html

(cl:defclass <perception_msg> (roslisp-msg-protocol:ros-message)
  ((time
    :reader time
    :initarg :time
    :type cl:float
    :initform 0.0)
   (person_name
    :reader person_name
    :initarg :person_name
    :type cl:string
    :initform "")
   (IDtype
    :reader IDtype
    :initarg :IDtype
    :type cl:string
    :initform "")
   (intention
    :reader intention
    :initarg :intention
    :type cl:string
    :initform "")
   (p
    :reader p
    :initarg :p
    :type cl:float
    :initform 0.0)
   (speech
    :reader speech
    :initarg :speech
    :type cl:string
    :initform "")
   (person_emotion
    :reader person_emotion
    :initarg :person_emotion
    :type cl:string
    :initform ""))
)

(cl:defclass perception_msg (<perception_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <perception_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'perception_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interface_sim-msg:<perception_msg> is deprecated: use interface_sim-msg:perception_msg instead.")))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <perception_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:time-val is deprecated.  Use interface_sim-msg:time instead.")
  (time m))

(cl:ensure-generic-function 'person_name-val :lambda-list '(m))
(cl:defmethod person_name-val ((m <perception_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:person_name-val is deprecated.  Use interface_sim-msg:person_name instead.")
  (person_name m))

(cl:ensure-generic-function 'IDtype-val :lambda-list '(m))
(cl:defmethod IDtype-val ((m <perception_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:IDtype-val is deprecated.  Use interface_sim-msg:IDtype instead.")
  (IDtype m))

(cl:ensure-generic-function 'intention-val :lambda-list '(m))
(cl:defmethod intention-val ((m <perception_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:intention-val is deprecated.  Use interface_sim-msg:intention instead.")
  (intention m))

(cl:ensure-generic-function 'p-val :lambda-list '(m))
(cl:defmethod p-val ((m <perception_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:p-val is deprecated.  Use interface_sim-msg:p instead.")
  (p m))

(cl:ensure-generic-function 'speech-val :lambda-list '(m))
(cl:defmethod speech-val ((m <perception_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:speech-val is deprecated.  Use interface_sim-msg:speech instead.")
  (speech m))

(cl:ensure-generic-function 'person_emotion-val :lambda-list '(m))
(cl:defmethod person_emotion-val ((m <perception_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:person_emotion-val is deprecated.  Use interface_sim-msg:person_emotion instead.")
  (person_emotion m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <perception_msg>) ostream)
  "Serializes a message object of type '<perception_msg>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'person_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'person_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'IDtype))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'IDtype))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'intention))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'intention))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'p))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'speech))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'speech))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'person_emotion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'person_emotion))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <perception_msg>) istream)
  "Deserializes a message object of type '<perception_msg>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'person_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'person_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'IDtype) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'IDtype) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'intention) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'intention) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'p) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speech) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'speech) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'person_emotion) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'person_emotion) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<perception_msg>)))
  "Returns string type for a message object of type '<perception_msg>"
  "interface_sim/perception_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'perception_msg)))
  "Returns string type for a message object of type 'perception_msg"
  "interface_sim/perception_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<perception_msg>)))
  "Returns md5sum for a message object of type '<perception_msg>"
  "c6c78bdb9d238a06de9c10c3d3b3dce6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'perception_msg)))
  "Returns md5sum for a message object of type 'perception_msg"
  "c6c78bdb9d238a06de9c10c3d3b3dce6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<perception_msg>)))
  "Returns full string definition for message of type '<perception_msg>"
  (cl:format cl:nil "float64 time~%string person_name~%string IDtype~%string intention~%float64 p~%string speech~%string person_emotion~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'perception_msg)))
  "Returns full string definition for message of type 'perception_msg"
  (cl:format cl:nil "float64 time~%string person_name~%string IDtype~%string intention~%float64 p~%string speech~%string person_emotion~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <perception_msg>))
  (cl:+ 0
     8
     4 (cl:length (cl:slot-value msg 'person_name))
     4 (cl:length (cl:slot-value msg 'IDtype))
     4 (cl:length (cl:slot-value msg 'intention))
     8
     4 (cl:length (cl:slot-value msg 'speech))
     4 (cl:length (cl:slot-value msg 'person_emotion))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <perception_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'perception_msg
    (cl:cons ':time (time msg))
    (cl:cons ':person_name (person_name msg))
    (cl:cons ':IDtype (IDtype msg))
    (cl:cons ':intention (intention msg))
    (cl:cons ':p (p msg))
    (cl:cons ':speech (speech msg))
    (cl:cons ':person_emotion (person_emotion msg))
))
