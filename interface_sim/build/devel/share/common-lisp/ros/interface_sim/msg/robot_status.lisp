; Auto-generated. Do not edit!


(cl:in-package interface_sim-msg)


;//! \htmlinclude robot_status.msg.html

(cl:defclass <robot_status> (roslisp-msg-protocol:ros-message)
  ((body1
    :reader body1
    :initarg :body1
    :type cl:float
    :initform 0.0)
   (body2
    :reader body2
    :initarg :body2
    :type cl:float
    :initform 0.0)
   (body3
    :reader body3
    :initarg :body3
    :type cl:float
    :initform 0.0)
   (body4
    :reader body4
    :initarg :body4
    :type cl:float
    :initform 0.0)
   (body5
    :reader body5
    :initarg :body5
    :type cl:float
    :initform 0.0)
   (body6
    :reader body6
    :initarg :body6
    :type cl:float
    :initform 0.0)
   (body7
    :reader body7
    :initarg :body7
    :type cl:float
    :initform 0.0)
   (idleState
    :reader idleState
    :initarg :idleState
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass robot_status (<robot_status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interface_sim-msg:<robot_status> is deprecated: use interface_sim-msg:robot_status instead.")))

(cl:ensure-generic-function 'body1-val :lambda-list '(m))
(cl:defmethod body1-val ((m <robot_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:body1-val is deprecated.  Use interface_sim-msg:body1 instead.")
  (body1 m))

(cl:ensure-generic-function 'body2-val :lambda-list '(m))
(cl:defmethod body2-val ((m <robot_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:body2-val is deprecated.  Use interface_sim-msg:body2 instead.")
  (body2 m))

(cl:ensure-generic-function 'body3-val :lambda-list '(m))
(cl:defmethod body3-val ((m <robot_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:body3-val is deprecated.  Use interface_sim-msg:body3 instead.")
  (body3 m))

(cl:ensure-generic-function 'body4-val :lambda-list '(m))
(cl:defmethod body4-val ((m <robot_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:body4-val is deprecated.  Use interface_sim-msg:body4 instead.")
  (body4 m))

(cl:ensure-generic-function 'body5-val :lambda-list '(m))
(cl:defmethod body5-val ((m <robot_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:body5-val is deprecated.  Use interface_sim-msg:body5 instead.")
  (body5 m))

(cl:ensure-generic-function 'body6-val :lambda-list '(m))
(cl:defmethod body6-val ((m <robot_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:body6-val is deprecated.  Use interface_sim-msg:body6 instead.")
  (body6 m))

(cl:ensure-generic-function 'body7-val :lambda-list '(m))
(cl:defmethod body7-val ((m <robot_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:body7-val is deprecated.  Use interface_sim-msg:body7 instead.")
  (body7 m))

(cl:ensure-generic-function 'idleState-val :lambda-list '(m))
(cl:defmethod idleState-val ((m <robot_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interface_sim-msg:idleState-val is deprecated.  Use interface_sim-msg:idleState instead.")
  (idleState m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_status>) ostream)
  "Serializes a message object of type '<robot_status>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'body1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'body2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'body3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'body4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'body5))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'body6))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'body7))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'idleState) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_status>) istream)
  "Deserializes a message object of type '<robot_status>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'body1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'body2) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'body3) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'body4) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'body5) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'body6) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'body7) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'idleState) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_status>)))
  "Returns string type for a message object of type '<robot_status>"
  "interface_sim/robot_status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_status)))
  "Returns string type for a message object of type 'robot_status"
  "interface_sim/robot_status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_status>)))
  "Returns md5sum for a message object of type '<robot_status>"
  "6f24a8e12bb39a74b5495d323c297d73")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_status)))
  "Returns md5sum for a message object of type 'robot_status"
  "6f24a8e12bb39a74b5495d323c297d73")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_status>)))
  "Returns full string definition for message of type '<robot_status>"
  (cl:format cl:nil "float64 body1~%float64 body2~%float64 body3~%float64 body4~%float64 body5~%float64 body6~%float64 body7~%bool idleState~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_status)))
  "Returns full string definition for message of type 'robot_status"
  (cl:format cl:nil "float64 body1~%float64 body2~%float64 body3~%float64 body4~%float64 body5~%float64 body6~%float64 body7~%bool idleState~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_status>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_status>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_status
    (cl:cons ':body1 (body1 msg))
    (cl:cons ':body2 (body2 msg))
    (cl:cons ':body3 (body3 msg))
    (cl:cons ':body4 (body4 msg))
    (cl:cons ':body5 (body5 msg))
    (cl:cons ':body6 (body6 msg))
    (cl:cons ':body7 (body7 msg))
    (cl:cons ':idleState (idleState msg))
))
