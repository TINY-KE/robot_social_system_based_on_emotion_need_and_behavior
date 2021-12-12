; Auto-generated. Do not edit!


(cl:in-package interface_sim-msg)


;//! \htmlinclude need_lists_msg.msg.html

(cl:defclass <need_lists_msg> (roslisp-msg-protocol:ros-message)
  ((person
    :reader person
    :initarg :person
    :type cl:string
    :initform "")
   (rob_emotion
    :reader rob_emotion
    :initarg :rob_emotion
    :type cl:string
    :initform "")
   (person_emotion
    :reader person_emotion
    :initarg :person_emotion
    :type cl:string
    :initform "")
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (weight
    :reader weight
    :initarg :weight
    :type cl:float
    :initform 0.0)
   (speech
    :reader speech
    :initarg :speech
    :type cl:string
    :initform ""))
)

(cl:defclass need_lists_msg (<need_lists_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <need_lists_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'need_lists_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interface_sim-msg:<need_lists_msg> is deprecated: use interface_sim-msg:need_lists_msg instead.")))

(cl:ensure-generic-function 'person-val :lambda-list '(m))
(cl:defmethod person-val ((m <need_lists_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:person-val is deprecated.  Use interface_sim-msg:person instead.")
  (person m))

(cl:ensure-generic-function 'rob_emotion-val :lambda-list '(m))
(cl:defmethod rob_emotion-val ((m <need_lists_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:rob_emotion-val is deprecated.  Use interface_sim-msg:rob_emotion instead.")
  (rob_emotion m))

(cl:ensure-generic-function 'person_emotion-val :lambda-list '(m))
(cl:defmethod person_emotion-val ((m <need_lists_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:person_emotion-val is deprecated.  Use interface_sim-msg:person_emotion instead.")
  (person_emotion m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <need_lists_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:name-val is deprecated.  Use interface_sim-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'weight-val :lambda-list '(m))
(cl:defmethod weight-val ((m <need_lists_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:weight-val is deprecated.  Use interface_sim-msg:weight instead.")
  (weight m))

(cl:ensure-generic-function 'speech-val :lambda-list '(m))
(cl:defmethod speech-val ((m <need_lists_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:speech-val is deprecated.  Use interface_sim-msg:speech instead.")
  (speech m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <need_lists_msg>) ostream)
  "Serializes a message object of type '<need_lists_msg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'person))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'person))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rob_emotion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rob_emotion))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'person_emotion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'person_emotion))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'weight))))
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <need_lists_msg>) istream)
  "Deserializes a message object of type '<need_lists_msg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'person) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'person) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rob_emotion) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rob_emotion) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'person_emotion) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'person_emotion) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'weight) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speech) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'speech) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<need_lists_msg>)))
  "Returns string type for a message object of type '<need_lists_msg>"
  "interface_sim/need_lists_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'need_lists_msg)))
  "Returns string type for a message object of type 'need_lists_msg"
  "interface_sim/need_lists_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<need_lists_msg>)))
  "Returns md5sum for a message object of type '<need_lists_msg>"
  "b3fdae128c44bcea9ca7d8a10aee1458")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'need_lists_msg)))
  "Returns md5sum for a message object of type 'need_lists_msg"
  "b3fdae128c44bcea9ca7d8a10aee1458")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<need_lists_msg>)))
  "Returns full string definition for message of type '<need_lists_msg>"
  (cl:format cl:nil "string person~%string rob_emotion~%string person_emotion~%string name~%float64 weight~%string speech~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'need_lists_msg)))
  "Returns full string definition for message of type 'need_lists_msg"
  (cl:format cl:nil "string person~%string rob_emotion~%string person_emotion~%string name~%float64 weight~%string speech~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <need_lists_msg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'person))
     4 (cl:length (cl:slot-value msg 'rob_emotion))
     4 (cl:length (cl:slot-value msg 'person_emotion))
     4 (cl:length (cl:slot-value msg 'name))
     8
     4 (cl:length (cl:slot-value msg 'speech))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <need_lists_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'need_lists_msg
    (cl:cons ':person (person msg))
    (cl:cons ':rob_emotion (rob_emotion msg))
    (cl:cons ':person_emotion (person_emotion msg))
    (cl:cons ':name (name msg))
    (cl:cons ':weight (weight msg))
    (cl:cons ':speech (speech msg))
))
