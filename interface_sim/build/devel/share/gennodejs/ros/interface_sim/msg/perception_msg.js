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

class perception_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.time = null;
      this.person_name = null;
      this.IDtype = null;
      this.intention = null;
      this.p = null;
      this.speech = null;
      this.person_emotion = null;
    }
    else {
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = 0.0;
      }
      if (initObj.hasOwnProperty('person_name')) {
        this.person_name = initObj.person_name
      }
      else {
        this.person_name = '';
      }
      if (initObj.hasOwnProperty('IDtype')) {
        this.IDtype = initObj.IDtype
      }
      else {
        this.IDtype = '';
      }
      if (initObj.hasOwnProperty('intention')) {
        this.intention = initObj.intention
      }
      else {
        this.intention = '';
      }
      if (initObj.hasOwnProperty('p')) {
        this.p = initObj.p
      }
      else {
        this.p = 0.0;
      }
      if (initObj.hasOwnProperty('speech')) {
        this.speech = initObj.speech
      }
      else {
        this.speech = '';
      }
      if (initObj.hasOwnProperty('person_emotion')) {
        this.person_emotion = initObj.person_emotion
      }
      else {
        this.person_emotion = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type perception_msg
    // Serialize message field [time]
    bufferOffset = _serializer.float64(obj.time, buffer, bufferOffset);
    // Serialize message field [person_name]
    bufferOffset = _serializer.string(obj.person_name, buffer, bufferOffset);
    // Serialize message field [IDtype]
    bufferOffset = _serializer.string(obj.IDtype, buffer, bufferOffset);
    // Serialize message field [intention]
    bufferOffset = _serializer.string(obj.intention, buffer, bufferOffset);
    // Serialize message field [p]
    bufferOffset = _serializer.float64(obj.p, buffer, bufferOffset);
    // Serialize message field [speech]
    bufferOffset = _serializer.string(obj.speech, buffer, bufferOffset);
    // Serialize message field [person_emotion]
    bufferOffset = _serializer.string(obj.person_emotion, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type perception_msg
    let len;
    let data = new perception_msg(null);
    // Deserialize message field [time]
    data.time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [person_name]
    data.person_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [IDtype]
    data.IDtype = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [intention]
    data.intention = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [p]
    data.p = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speech]
    data.speech = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [person_emotion]
    data.person_emotion = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.person_name.length;
    length += object.IDtype.length;
    length += object.intention.length;
    length += object.speech.length;
    length += object.person_emotion.length;
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'interface_sim/perception_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c6c78bdb9d238a06de9c10c3d3b3dce6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 time
    string person_name
    string IDtype
    string intention
    float64 p
    string speech
    string person_emotion
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new perception_msg(null);
    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = 0.0
    }

    if (msg.person_name !== undefined) {
      resolved.person_name = msg.person_name;
    }
    else {
      resolved.person_name = ''
    }

    if (msg.IDtype !== undefined) {
      resolved.IDtype = msg.IDtype;
    }
    else {
      resolved.IDtype = ''
    }

    if (msg.intention !== undefined) {
      resolved.intention = msg.intention;
    }
    else {
      resolved.intention = ''
    }

    if (msg.p !== undefined) {
      resolved.p = msg.p;
    }
    else {
      resolved.p = 0.0
    }

    if (msg.speech !== undefined) {
      resolved.speech = msg.speech;
    }
    else {
      resolved.speech = ''
    }

    if (msg.person_emotion !== undefined) {
      resolved.person_emotion = msg.person_emotion;
    }
    else {
      resolved.person_emotion = ''
    }

    return resolved;
    }
};

module.exports = perception_msg;
