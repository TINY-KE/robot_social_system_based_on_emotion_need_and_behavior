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

class robot_emotion {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.emotion1 = null;
      this.emotion2 = null;
      this.emotion3 = null;
      this.emotion4 = null;
      this.emotion5 = null;
      this.emotion6 = null;
      this.emotion7 = null;
      this.emotion8 = null;
    }
    else {
      if (initObj.hasOwnProperty('emotion1')) {
        this.emotion1 = initObj.emotion1
      }
      else {
        this.emotion1 = 0.0;
      }
      if (initObj.hasOwnProperty('emotion2')) {
        this.emotion2 = initObj.emotion2
      }
      else {
        this.emotion2 = 0.0;
      }
      if (initObj.hasOwnProperty('emotion3')) {
        this.emotion3 = initObj.emotion3
      }
      else {
        this.emotion3 = 0.0;
      }
      if (initObj.hasOwnProperty('emotion4')) {
        this.emotion4 = initObj.emotion4
      }
      else {
        this.emotion4 = 0.0;
      }
      if (initObj.hasOwnProperty('emotion5')) {
        this.emotion5 = initObj.emotion5
      }
      else {
        this.emotion5 = 0.0;
      }
      if (initObj.hasOwnProperty('emotion6')) {
        this.emotion6 = initObj.emotion6
      }
      else {
        this.emotion6 = 0.0;
      }
      if (initObj.hasOwnProperty('emotion7')) {
        this.emotion7 = initObj.emotion7
      }
      else {
        this.emotion7 = 0.0;
      }
      if (initObj.hasOwnProperty('emotion8')) {
        this.emotion8 = initObj.emotion8
      }
      else {
        this.emotion8 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_emotion
    // Serialize message field [emotion1]
    bufferOffset = _serializer.float64(obj.emotion1, buffer, bufferOffset);
    // Serialize message field [emotion2]
    bufferOffset = _serializer.float64(obj.emotion2, buffer, bufferOffset);
    // Serialize message field [emotion3]
    bufferOffset = _serializer.float64(obj.emotion3, buffer, bufferOffset);
    // Serialize message field [emotion4]
    bufferOffset = _serializer.float64(obj.emotion4, buffer, bufferOffset);
    // Serialize message field [emotion5]
    bufferOffset = _serializer.float64(obj.emotion5, buffer, bufferOffset);
    // Serialize message field [emotion6]
    bufferOffset = _serializer.float64(obj.emotion6, buffer, bufferOffset);
    // Serialize message field [emotion7]
    bufferOffset = _serializer.float64(obj.emotion7, buffer, bufferOffset);
    // Serialize message field [emotion8]
    bufferOffset = _serializer.float64(obj.emotion8, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_emotion
    let len;
    let data = new robot_emotion(null);
    // Deserialize message field [emotion1]
    data.emotion1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [emotion2]
    data.emotion2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [emotion3]
    data.emotion3 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [emotion4]
    data.emotion4 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [emotion5]
    data.emotion5 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [emotion6]
    data.emotion6 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [emotion7]
    data.emotion7 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [emotion8]
    data.emotion8 = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'interface_sim/robot_emotion';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3fa29132f7142bca92b48823212b5e10';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 emotion1
    float64 emotion2
    float64 emotion3
    float64 emotion4
    float64 emotion5
    float64 emotion6
    float64 emotion7
    float64 emotion8
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_emotion(null);
    if (msg.emotion1 !== undefined) {
      resolved.emotion1 = msg.emotion1;
    }
    else {
      resolved.emotion1 = 0.0
    }

    if (msg.emotion2 !== undefined) {
      resolved.emotion2 = msg.emotion2;
    }
    else {
      resolved.emotion2 = 0.0
    }

    if (msg.emotion3 !== undefined) {
      resolved.emotion3 = msg.emotion3;
    }
    else {
      resolved.emotion3 = 0.0
    }

    if (msg.emotion4 !== undefined) {
      resolved.emotion4 = msg.emotion4;
    }
    else {
      resolved.emotion4 = 0.0
    }

    if (msg.emotion5 !== undefined) {
      resolved.emotion5 = msg.emotion5;
    }
    else {
      resolved.emotion5 = 0.0
    }

    if (msg.emotion6 !== undefined) {
      resolved.emotion6 = msg.emotion6;
    }
    else {
      resolved.emotion6 = 0.0
    }

    if (msg.emotion7 !== undefined) {
      resolved.emotion7 = msg.emotion7;
    }
    else {
      resolved.emotion7 = 0.0
    }

    if (msg.emotion8 !== undefined) {
      resolved.emotion8 = msg.emotion8;
    }
    else {
      resolved.emotion8 = 0.0
    }

    return resolved;
    }
};

module.exports = robot_emotion;
