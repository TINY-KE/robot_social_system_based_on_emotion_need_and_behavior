// Auto-generated. Do not edit!

// (in-package interface_sim.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class robot_status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.body1 = null;
      this.body2 = null;
      this.body3 = null;
      this.body4 = null;
      this.body5 = null;
      this.body6 = null;
      this.body7 = null;
      this.idleState = null;
    }
    else {
      if (initObj.hasOwnProperty('body1')) {
        this.body1 = initObj.body1
      }
      else {
        this.body1 = 0.0;
      }
      if (initObj.hasOwnProperty('body2')) {
        this.body2 = initObj.body2
      }
      else {
        this.body2 = 0.0;
      }
      if (initObj.hasOwnProperty('body3')) {
        this.body3 = initObj.body3
      }
      else {
        this.body3 = 0.0;
      }
      if (initObj.hasOwnProperty('body4')) {
        this.body4 = initObj.body4
      }
      else {
        this.body4 = 0.0;
      }
      if (initObj.hasOwnProperty('body5')) {
        this.body5 = initObj.body5
      }
      else {
        this.body5 = 0.0;
      }
      if (initObj.hasOwnProperty('body6')) {
        this.body6 = initObj.body6
      }
      else {
        this.body6 = 0.0;
      }
      if (initObj.hasOwnProperty('body7')) {
        this.body7 = initObj.body7
      }
      else {
        this.body7 = 0.0;
      }
      if (initObj.hasOwnProperty('idleState')) {
        this.idleState = initObj.idleState
      }
      else {
        this.idleState = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_status
    // Serialize message field [body1]
    bufferOffset = _serializer.float64(obj.body1, buffer, bufferOffset);
    // Serialize message field [body2]
    bufferOffset = _serializer.float64(obj.body2, buffer, bufferOffset);
    // Serialize message field [body3]
    bufferOffset = _serializer.float64(obj.body3, buffer, bufferOffset);
    // Serialize message field [body4]
    bufferOffset = _serializer.float64(obj.body4, buffer, bufferOffset);
    // Serialize message field [body5]
    bufferOffset = _serializer.float64(obj.body5, buffer, bufferOffset);
    // Serialize message field [body6]
    bufferOffset = _serializer.float64(obj.body6, buffer, bufferOffset);
    // Serialize message field [body7]
    bufferOffset = _serializer.float64(obj.body7, buffer, bufferOffset);
    // Serialize message field [idleState]
    bufferOffset = _serializer.bool(obj.idleState, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_status
    let len;
    let data = new robot_status(null);
    // Deserialize message field [body1]
    data.body1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [body2]
    data.body2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [body3]
    data.body3 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [body4]
    data.body4 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [body5]
    data.body5 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [body6]
    data.body6 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [body7]
    data.body7 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [idleState]
    data.idleState = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 57;
  }

  static datatype() {
    // Returns string type for a message object
    return 'interface_sim/robot_status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6f24a8e12bb39a74b5495d323c297d73';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 body1
    float64 body2
    float64 body3
    float64 body4
    float64 body5
    float64 body6
    float64 body7
    bool idleState
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_status(null);
    if (msg.body1 !== undefined) {
      resolved.body1 = msg.body1;
    }
    else {
      resolved.body1 = 0.0
    }

    if (msg.body2 !== undefined) {
      resolved.body2 = msg.body2;
    }
    else {
      resolved.body2 = 0.0
    }

    if (msg.body3 !== undefined) {
      resolved.body3 = msg.body3;
    }
    else {
      resolved.body3 = 0.0
    }

    if (msg.body4 !== undefined) {
      resolved.body4 = msg.body4;
    }
    else {
      resolved.body4 = 0.0
    }

    if (msg.body5 !== undefined) {
      resolved.body5 = msg.body5;
    }
    else {
      resolved.body5 = 0.0
    }

    if (msg.body6 !== undefined) {
      resolved.body6 = msg.body6;
    }
    else {
      resolved.body6 = 0.0
    }

    if (msg.body7 !== undefined) {
      resolved.body7 = msg.body7;
    }
    else {
      resolved.body7 = 0.0
    }

    if (msg.idleState !== undefined) {
      resolved.idleState = msg.idleState;
    }
    else {
      resolved.idleState = false
    }

    return resolved;
    }
};

module.exports = robot_status;
