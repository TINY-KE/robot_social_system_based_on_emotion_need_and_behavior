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

class need_lists_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.person = null;
      this.rob_emotion = null;
      this.person_emotion = null;
      this.name = null;
      this.weight = null;
      this.speech = null;
    }
    else {
      if (initObj.hasOwnProperty('person')) {
        this.person = initObj.person
      }
      else {
        this.person = '';
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
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
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
    // Serializes a message object of type need_lists_msg
    // Serialize message field [person]
    bufferOffset = _serializer.string(obj.person, buffer, bufferOffset);
    // Serialize message field [rob_emotion]
    bufferOffset = _serializer.string(obj.rob_emotion, buffer, bufferOffset);
    // Serialize message field [person_emotion]
    bufferOffset = _serializer.string(obj.person_emotion, buffer, bufferOffset);
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [weight]
    bufferOffset = _serializer.float64(obj.weight, buffer, bufferOffset);
    // Serialize message field [speech]
    bufferOffset = _serializer.string(obj.speech, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type need_lists_msg
    let len;
    let data = new need_lists_msg(null);
    // Deserialize message field [person]
    data.person = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [rob_emotion]
    data.rob_emotion = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [person_emotion]
    data.person_emotion = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [weight]
    data.weight = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speech]
    data.speech = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.person.length;
    length += object.rob_emotion.length;
    length += object.person_emotion.length;
    length += object.name.length;
    length += object.speech.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'interface_sim/need_lists_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b3fdae128c44bcea9ca7d8a10aee1458';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string person
    string rob_emotion
    string person_emotion
    string name
    float64 weight
    string speech
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new need_lists_msg(null);
    if (msg.person !== undefined) {
      resolved.person = msg.person;
    }
    else {
      resolved.person = ''
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

    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
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

module.exports = need_lists_msg;
