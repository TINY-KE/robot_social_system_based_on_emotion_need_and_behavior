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

class need_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.need_name = null;
      this.person_name = null;
      this.IDtype = null;
      this.rob_emotion = null;
      this.person_emotion = null;
      this.weight = null;
      this.speech = null;
    }
    else {
      if (initObj.hasOwnProperty('need_name')) {
        this.need_name = initObj.need_name
      }
      else {
        this.need_name = '';
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
      if (initObj.hasOwnProperty('rob_emotion')) {
        this.rob_emotion = initObj.rob_emotion
      }
      else {
        this.rob_emotion = '';
      }
      if (initObj.hasOwnProperty('person_emotion')) {
        this.person_emotion = initObj.person_emotion
      }
      else {
        this.person_emotion = '';
      }
      if (initObj.hasOwnProperty('weight')) {
        this.weight = initObj.weight
      }
      else {
        this.weight = 0.0;
      }
      if (initObj.hasOwnProperty('speech')) {
        this.speech = initObj.speech
      }
      else {
        this.speech = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type need_msg
    // Serialize message field [need_name]
    bufferOffset = _serializer.string(obj.need_name, buffer, bufferOffset);
    // Serialize message field [person_name]
    bufferOffset = _serializer.string(obj.person_name, buffer, bufferOffset);
    // Serialize message field [IDtype]
    bufferOffset = _serializer.string(obj.IDtype, buffer, bufferOffset);
    // Serialize message field [rob_emotion]
    bufferOffset = _serializer.string(obj.rob_emotion, buffer, bufferOffset);
    // Serialize message field [person_emotion]
    bufferOffset = _serializer.string(obj.person_emotion, buffer, bufferOffset);
    // Serialize message field [weight]
    bufferOffset = _serializer.float64(obj.weight, buffer, bufferOffset);
    // Serialize message field [speech]
    bufferOffset = _serializer.string(obj.speech, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type need_msg
    let len;
    let data = new need_msg(null);
    // Deserialize message field [need_name]
    data.need_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [person_name]
    data.person_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [IDtype]
    data.IDtype = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [rob_emotion]
    data.rob_emotion = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [person_emotion]
    data.person_emotion = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [weight]
    data.weight = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speech]
    data.speech = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.need_name.length;
    length += object.person_name.length;
    length += object.IDtype.length;
    length += object.rob_emotion.length;
    length += object.person_emotion.length;
    length += object.speech.length;
    return length + 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'interface_sim/need_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '89d9fdc137ce49edd6361ad65d7aec1f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string need_name
    string person_name
    string IDtype
    string rob_emotion
    string person_emotion
    float64 weight
    string speech
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new need_msg(null);
    if (msg.need_name !== undefined) {
      resolved.need_name = msg.need_name;
    }
    else {
      resolved.need_name = ''
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

    if (msg.rob_emotion !== undefined) {
      resolved.rob_emotion = msg.rob_emotion;
    }
    else {
      resolved.rob_emotion = ''
    }

    if (msg.person_emotion !== undefined) {
      resolved.person_emotion = msg.person_emotion;
    }
    else {
      resolved.person_emotion = ''
    }

    if (msg.weight !== undefined) {
      resolved.weight = msg.weight;
    }
    else {
      resolved.weight = 0.0
    }

    if (msg.speech !== undefined) {
      resolved.speech = msg.speech;
    }
    else {
      resolved.speech = ''
    }

    return resolved;
    }
};

module.exports = need_msg;
