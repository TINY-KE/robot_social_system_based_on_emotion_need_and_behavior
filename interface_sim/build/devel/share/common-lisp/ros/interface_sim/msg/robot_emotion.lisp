; Auto-generated. Do not edit!


(cl:in-package interface_sim-msg)


;//! \htmlinclude robot_emotion.msg.html

(cl:defclass <robot_emotion> (roslisp-msg-protocol:ros-message)
  ((emotion1
    :reader emotion1
    :initarg :emotion1
    :type cl:float
    :initform 0.0)
   (emotion2
    :reader emotion2
    :initarg :emotion2
    :type cl:float
    :initform 0.0)
   (emotion3
    :reader emotion3
    :initarg :emotion3
    :type cl:float
    :initform 0.0)
   (emotion4
    :reader emotion4
    :initarg :emotion4
    :type cl:float
    :initform 0.0)
   (emotion5
    :reader emotion5
    :initarg :emotion5
    :type cl:float
    :initform 0.0)
   (emotion6
    :reader emotion6
    :initarg :emotion6
    :type cl:float
    :initform 0.0)
   (emotion7
    :reader emotion7
    :initarg :emotion7
    :type cl:float
    :initform 0.0)
   (emotion8
    :reader emotion8
    :initarg :emotion8
    :type cl:float
    :initform 0.0))
)

(cl:defclass robot_emotion (<robot_emotion>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_emotion>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_emotion)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interface_sim-msg:<robot_emotion> is deprecated: use interface_sim-msg:robot_emotion instead.")))

(cl:ensure-generic-function 'emotion1-val :lambda-list '(m))
(cl:defmethod emotion1-val ((m <robot_emotion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:emotion1-val is deprecated.  Use interface_sim-msg:emotion1 instead.")
  (emotion1 m))

(cl:ensure-generic-function 'emotion2-val :lambda-list '(m))
(cl:defmethod emotion2-val ((m <robot_emotion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:emotion2-val is deprecated.  Use interface_sim-msg:emotion2 instead.")
  (emotion2 m))

(cl:ensure-generic-function 'emotion3-val :lambda-list '(m))
(cl:defmethod emotion3-val ((m <robot_emotion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:emotion3-val is deprecated.  Use interface_sim-msg:emotion3 instead.")
  (emotion3 m))

(cl:ensure-generic-function 'emotion4-val :lambda-list '(m))
(cl:defmethod emotion4-val ((m <robot_emotion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:emotion4-val is deprecated.  Use interface_sim-msg:emotion4 instead.")
  (emotion4 m))

(cl:ensure-generic-function 'emotion5-val :lambda-list '(m))
(cl:defmethod emotion5-val ((m <robot_emotion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:emotion5-val is deprecated.  Use interface_sim-msg:emotion5 instead.")
  (emotion5 m))

(cl:ensure-generic-function 'emotion6-val :lambda-list '(m))
(cl:defmethod emotion6-val ((m <robot_emotion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:emotion6-val is deprecated.  Use interface_sim-msg:emotion6 instead.")
  (emotion6 m))

(cl:ensure-generic-function 'emotion7-val :lambda-list '(m))
(cl:defmethod emotion7-val ((m <robot_emotion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:emotion7-val is deprecated.  Use interface_sim-msg:emotion7 instead.")
  (emotion7 m))

(cl:ensure-generic-function 'emotion8-val :lambda-list '(m))
(cl:defmethod emotion8-val ((m <robot_emotion>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:emotion8-val is deprecated.  Use interface_sim-msg:emotion8 instead.")
  (emotion8 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_emotion>) ostream)
  "Serializes a message object of type '<robot_emotion>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'emotion1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'emotion2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'emotion3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'emotion4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'emotion5))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'emotion6))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'emotion7))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'emotion8))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_emotion>) istream)
  "Deserializes a message object of type '<robot_emotion>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'emotion1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'emotion2) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'emotion3) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'emotion4) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'emotion5) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'emotion6) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'emotion7) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'emotion8) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_emotion>)))
  "Returns string type for a message object of type '<robot_emotion>"
  "interface_sim/robot_emotion")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_emotion)))
  "Returns string type for a message object of type 'robot_emotion"
  "interface_sim/robot_emotion")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_emotion>)))
  "Returns md5sum for a message object of type '<robot_emotion>"
  "3fa29132f7142bca92b48823212b5e10")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_emotion)))
  "Returns md5sum for a message object of type 'robot_emotion"
  "3fa29132f7142bca92b48823212b5e10")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_emotion>)))
  "Returns full string definition for message of type '<robot_emotion>"
  (cl:format cl:nil "float64 emotion1~%float64 emotion2~%float64 emotion3~%float64 emotion4~%float64 emotion5~%float64 emotion6~%float64 emotion7~%float64 emotion8~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_emotion)))
  "Returns full string definition for message of type 'robot_emotion"
  (cl:format cl:nil "float64 emotion1~%float64 emotion2~%float64 emotion3~%float64 emotion4~%float64 emotion5~%float64 emotion6~%float64 emotion7~%float64 emotion8~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_emotion>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_emotion>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_emotion
    (cl:cons ':emotion1 (emotion1 msg))
    (cl:cons ':emotion2 (emotion2 msg))
    (cl:cons ':emotion3 (emotion3 msg))
    (cl:cons ':emotion4 (emotion4 msg))
    (cl:cons ':emotion5 (emotion5 msg))
    (cl:cons ':emotion6 (emotion6 msg))
    (cl:cons ':emotion7 (emotion7 msg))
    (cl:cons ':emotion8 (emotion8 msg))
))
