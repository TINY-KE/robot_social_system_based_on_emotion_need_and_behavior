//dealing_node.cpp
#include "ros/ros.h"
#include "std_msgs/String.h"
#include <ros/package.h>
#include <sstream>
#include <iostream>
#include <tinyxml2.h>
#include "social_msg/Arms.h"
#include "social_msg/Emotion.h"
#include "social_msg/Gaze.h"
#include "social_msg/Legs.h"
#include "social_msg/Speech.h"
#include "social_msg/bhvGet.h"
#include "social_msg/bhvPara.h"
#include "social_msg/bhvIssue.h"
#include "social_msg/bhvReply.h"
#include "social_msg/need_msg.h"
#include "social_msg/robot_emotion.h"
#include "social_msg/robot_status.h"
#include "social_msg/bhvQueue.h"
#define EnhanceFactor 1.3
using namespace tinyxml2;
using namespace std;

typedef struct queue_para{
    int count;
    int front;
    int rear;
    social_msg::bhvPara data[20];
}Queue_para;

typedef struct locallist{
    int n;
    social_msg::bhvPara bhv[100];
}LocalList;

bool chatterCallbackFlag;
bool InsertAndConcurFlag;
int emotionFlag;//1-积极信号 2-消极信号
social_msg::need_msg ListBuf;
Queue_para* Q = (Queue_para*)malloc(sizeof(Queue_para));
//全局变量：当前执行任务进度
typedef struct taskmonitor{
    bool flag;
    social_msg::bhvReply states;
}TaskMonitor;

TaskMonitor tasks;

//全局变量：当前任务名称
string CurrentTaskName;
int test_i=0,test_j=0;



void Queue_init(Queue_para* ptr) { //初始化队列
    ptr->count = 0;
    ptr->front = 0;
    ptr->rear = -1;
}
 
bool QueueFull(Queue_para* ptr) {  //判断队列是否满 
    return ptr->count >= 20;
}
 
bool QueueEmpty(Queue_para* ptr) {   //判断队列是否为空
    return ptr->count <= 0;
}
 
void Append(Queue_para* ptr, social_msg::bhvPara item) {    //入队
    if (QueueFull(ptr)) {
        ROS_INFO("Queue Full!!");
        return;
    }else {
        ptr->count ++;
        ptr->rear = (ptr->rear + 1) % 20;
        ptr->data[ptr->rear] = item;
    }
}
 
void Pop(Queue_para* ptr) {  //出队
    if (QueueEmpty(ptr)) {
        ROS_INFO("Queue Empty!!");
        return;
    }else {
        ptr->count --;
        ptr->front = (ptr->front + 1) % 20;
    }
}

int QueueSize(Queue_para* ptr) {    //返回队列长度
    return ptr->count;
}

void Insert(Queue_para* ptr, int n, social_msg::bhvPara content)
{
     int temp = ptr->front;
    // int movenum = QueueSize(ptr)-n+1;
    // while(movenum!=0)
    // {
    //     ptr->data[(temp+1)%20] = ptr->data[temp];
    //     temp = (temp + 19) % 20;
    //     movenum--;
    // }
    // ptr->data[temp] = content;
    // ptr->count++;
    // ptr->rear = (ptr->rear + 1) % 20;
    ptr->front = (ptr->front + 19)%20;
    ptr->data[ptr->front] = content;
    ptr->count++;
}
void LoclistInit(LocalList &list){
    list.n = 12;
    // 需求类型：Greet  、MeasureTempareture、Answer、ParentIdentity、KeepOrder、StopStranger、Wander、Doubt、Chat、Charge、Remind、
    //情感类型：高兴、信任、期待、悲伤、愤怒、害怕、厌恶、无聊
    list.bhv[0].Needs = "Greet";
    list.bhv[0].TotalTime = 20;//100;
    list.bhv[1].Needs = "Doubt";
    list.bhv[1].TotalTime = 15;
    list.bhv[2].Needs = "MeasureTempareture";
    list.bhv[2].TotalTime = 60; //100;
    list.bhv[3].Needs = "Wander";
    list.bhv[3].TotalTime = 255;
    list.bhv[4].Needs = "StopStranger";
    list.bhv[4].TotalTime = 30; //100;
    list.bhv[5].Needs = "Chat";
    list.bhv[5].TotalTime = 20;
    list.bhv[6].Needs = "Answer";
    list.bhv[6].TotalTime = 20;
    list.bhv[7].Needs = "ParentIdentity";
    list.bhv[7].TotalTime = 30;
    list.bhv[8].Needs = "KeepOrder";
    list.bhv[8].TotalTime = 20;
    list.bhv[9].Needs = "Remind";
    list.bhv[9].TotalTime = 20;
    list.bhv[10].Needs = "Charge";
    list.bhv[10].TotalTime = 120;
    list.bhv[11].Needs = "Pass";
    list.bhv[11].TotalTime = 12;

    for(int i=0;i<12;i++)
    {
        // list.bhv[i].HeadBehavior = "";
        // list.bhv[i].HeadBehavior_person = "";
        list.bhv[i].gaze.IsYellow = 0;
        list.bhv[i].emotion.IsYellow = 0;
        list.bhv[i].speech.IsYellow = 0;
        list.bhv[i].arms.IsYellow = 0;
        list.bhv[i].legs.IsYellow = 0;
    }
    
    list.bhv[0].CurOrder = 1;
    list.bhv[1].CurOrder = 1;
    list.bhv[0].TotalOrder = 1;
    list.bhv[1].TotalOrder = 1;
    list.bhv[2].CurOrder = 1;
    list.bhv[3].CurOrder = 1;
    list.bhv[2].TotalOrder = 1;
    list.bhv[3].TotalOrder = 1;
    list.bhv[4].CurOrder = 1;
    list.bhv[4].TotalOrder = 1;
    list.bhv[5].CurOrder = 1;
    list.bhv[5].TotalOrder = 1;
    list.bhv[6].CurOrder = 1;
    list.bhv[6].TotalOrder = 1;
    list.bhv[7].CurOrder = 1;
    list.bhv[7].TotalOrder = 1;
    list.bhv[8].CurOrder = 1;
    list.bhv[8].TotalOrder = 1;
    list.bhv[9].CurOrder = 1;
    list.bhv[9].TotalOrder = 1;
    list.bhv[10].CurOrder = 1;
    list.bhv[10].TotalOrder = 1;
    list.bhv[11].CurOrder = 1;
    list.bhv[11].TotalOrder = 1;

    list.bhv[0].gaze.weight = 1;
    list.bhv[0].gaze.call = 1;
    list.bhv[0].gaze.target = "object";
    list.bhv[0].gaze.startTime = 0;
    list.bhv[0].gaze.endTime = 100;

    list.bhv[0].emotion.weight = 2;
    list.bhv[0].emotion.call = 1;
    list.bhv[0].emotion.type = "slfmood";
    list.bhv[0].emotion.startTime = 50;
    list.bhv[0].emotion.endTime = 100;

    list.bhv[0].speech.weight = 1;
    list.bhv[0].speech.call = 1;
    list.bhv[0].speech.content = "你好呀!";
    list.bhv[0].speech.tone = 3;
    list.bhv[0].speech.rate = 2;
    list.bhv[0].speech.startTime = 50;
    list.bhv[0].speech.endTime = 100;

    list.bhv[0].arms.weight = 3;
    list.bhv[0].arms.call = 1;
    list.bhv[0].arms.action = "wave";
    list.bhv[0].arms.rate = 3;
    list.bhv[0].arms.startTime = 50;
    list.bhv[0].arms.endTime = 100;

    list.bhv[0].legs.weight = 1;
    list.bhv[0].legs.call = 1;
    list.bhv[0].legs.target = "object";
    list.bhv[0].legs.action = "face";
    list.bhv[0].legs.rate = 2;
    list.bhv[0].legs.distance = 3;
    list.bhv[0].legs.startTime = 0;
    list.bhv[0].legs.endTime = 50;

    list.bhv[1].gaze.weight = 1;
    list.bhv[1].gaze.call = 1;
    list.bhv[1].gaze.target = "object";
    list.bhv[1].gaze.startTime = 0;
    list.bhv[1].gaze.endTime = 100;

    list.bhv[1].emotion.weight = 1;
    list.bhv[1].emotion.call = 1;
    list.bhv[1].emotion.type = "doubt";
    list.bhv[1].emotion.startTime = 40;
    list.bhv[1].emotion.endTime = 100;

    list.bhv[1].speech.weight = 1;
    list.bhv[1].speech.call = 1;
    list.bhv[1].speech.content = "doubt";
    list.bhv[1].speech.tone = 2;
    list.bhv[1].speech.rate = 2;
    list.bhv[1].speech.startTime = 40;
    list.bhv[1].speech.endTime = 100;

    list.bhv[1].arms.weight = 0;
    list.bhv[1].arms.call = 0;
    list.bhv[1].arms.action = "wave";
    list.bhv[1].arms.rate = 1;
    list.bhv[1].arms.startTime = 30;
    list.bhv[1].arms.endTime = 90;

    list.bhv[1].legs.weight = 1;
    list.bhv[1].legs.call = 1;
    list.bhv[1].legs.target = "object";
    list.bhv[1].legs.action = "face";
    list.bhv[1].legs.rate = 2;
    list.bhv[1].legs.distance = 2;
    list.bhv[1].legs.startTime = 0;
    list.bhv[1].legs.endTime = 40;

    list.bhv[2].gaze.weight = 1;
    list.bhv[2].gaze.call = 1;
    list.bhv[2].gaze.target = "object";
    list.bhv[2].gaze.startTime = 0;
    list.bhv[2].gaze.endTime = 100;

    list.bhv[2].emotion.weight = 3;
    list.bhv[2].emotion.call = 1;
    list.bhv[2].emotion.type = "slfmood";
    list.bhv[2].emotion.startTime = 0;
    list.bhv[2].emotion.endTime = 20;

    list.bhv[2].speech.weight = 2;
    list.bhv[2].speech.call = 1;
    list.bhv[2].speech.content = "测温中，请耐心等待";
    list.bhv[2].speech.tone = 2;
    list.bhv[2].speech.rate = 2;
    list.bhv[2].speech.startTime = 20;
    list.bhv[2].speech.endTime = 50;

    list.bhv[2].arms.weight = 0;
    list.bhv[2].arms.call = 0;
    list.bhv[2].arms.action = "0";
    list.bhv[2].arms.rate = 0;
    list.bhv[2].arms.startTime = 0;
    list.bhv[2].arms.endTime = 0;

    list.bhv[2].legs.weight = 2;
    list.bhv[2].legs.call = 1;
    list.bhv[2].legs.target = "object";
    list.bhv[2].legs.action = "face";
    list.bhv[2].legs.rate = 2;
    list.bhv[2].legs.distance = 1;
    list.bhv[2].legs.startTime = 0;
    list.bhv[2].legs.endTime = 50;

    list.bhv[3].gaze.weight = 1;
    list.bhv[3].gaze.call = 1;
    list.bhv[3].gaze.target = "look around";
    list.bhv[3].gaze.startTime = 0;
    list.bhv[3].gaze.endTime = 100;

    list.bhv[3].emotion.weight = 0;
    list.bhv[3].emotion.call = 0;
    list.bhv[3].emotion.type = "slfmood";
    list.bhv[3].emotion.startTime = 0;
    list.bhv[3].emotion.endTime = 0;

    list.bhv[3].speech.weight = 3;
    list.bhv[3].speech.call = 1;
    list.bhv[3].speech.content = "怎么还没有人来?";
    list.bhv[3].speech.tone = 2;
    list.bhv[3].speech.rate = 2;
    list.bhv[3].speech.startTime = 40;
    list.bhv[3].speech.endTime = 60;

    list.bhv[3].arms.weight = 0;
    list.bhv[3].arms.call = 0;
    list.bhv[3].arms.action = "0";
    list.bhv[3].arms.rate = 0;
    list.bhv[3].arms.startTime = 0;
    list.bhv[3].arms.endTime = 0;

    list.bhv[3].legs.weight = 1;
    list.bhv[3].legs.call = 1;
    list.bhv[3].legs.target = "none";
    list.bhv[3].legs.action = "wander";
    list.bhv[3].legs.rate = 2;
    list.bhv[3].legs.distance = 0;
    list.bhv[3].legs.startTime = 0;
    list.bhv[3].legs.endTime = 100;    


    list.bhv[4].gaze.weight = 1;
    list.bhv[4].gaze.call = 1;
    list.bhv[4].gaze.target = "object";
    list.bhv[4].gaze.startTime = 0;
    list.bhv[4].gaze.endTime = 100;

    list.bhv[4].emotion.weight = 2;
    list.bhv[4].emotion.call = 1;
    list.bhv[4].emotion.type = "serious";
    list.bhv[4].emotion.startTime = 20;
    list.bhv[4].emotion.endTime = 60;

    list.bhv[4].speech.weight = 1;
    list.bhv[4].speech.call = 1;
    list.bhv[4].speech.content = "没有通行码不能入校哦";
    list.bhv[4].speech.tone = 0;
    list.bhv[4].speech.rate = 0;
    list.bhv[4].speech.startTime = 20;
    list.bhv[4].speech.endTime = 100;

    list.bhv[4].arms.weight = 1;
    list.bhv[4].arms.call = 1;
    list.bhv[4].arms.action = "stop";
    list.bhv[4].arms.rate = 3;
    list.bhv[4].arms.startTime = 20;
    list.bhv[4].arms.endTime = 60;

    list.bhv[4].legs.weight = 1;
    list.bhv[4].legs.call = 1;
    list.bhv[4].legs.target = "object";
    list.bhv[4].legs.action = "face";
    list.bhv[4].legs.rate = 3;
    list.bhv[4].legs.distance = 1;
    list.bhv[4].legs.startTime = 0;
    list.bhv[4].legs.endTime = 20;  

    list.bhv[5].gaze.weight = 0;
    list.bhv[5].gaze.call = 0;
    list.bhv[5].gaze.target = "object";
    list.bhv[5].gaze.startTime = 0;
    list.bhv[5].gaze.endTime = 100;

    list.bhv[5].emotion.weight = 0;
    list.bhv[5].emotion.call = 0;
    list.bhv[5].emotion.type = "doubt";
    list.bhv[5].emotion.startTime = 40;
    list.bhv[5].emotion.endTime = 100;

    list.bhv[5].speech.weight = 1;
    list.bhv[5].speech.call = 1;
    list.bhv[5].speech.content = "chat";
    list.bhv[5].speech.tone = 2;
    list.bhv[5].speech.rate = 2;
    list.bhv[5].speech.startTime = 40;
    list.bhv[5].speech.endTime = 100;

    list.bhv[5].arms.weight = 0;
    list.bhv[5].arms.call = 0;
    list.bhv[5].arms.action = "wave";
    list.bhv[5].arms.rate = 1;
    list.bhv[5].arms.startTime = 30;
    list.bhv[5].arms.endTime = 90;

    list.bhv[5].legs.weight = 0;
    list.bhv[5].legs.call = 0;
    list.bhv[5].legs.target = "object";
    list.bhv[5].legs.action = "face";
    list.bhv[5].legs.rate = 2;
    list.bhv[5].legs.distance = 2;
    list.bhv[5].legs.startTime = 0;
    list.bhv[5].legs.endTime = 40;

    list.bhv[6].gaze.weight = 1;
    list.bhv[6].gaze.call = 1;
    list.bhv[6].gaze.target = "object";
    list.bhv[6].gaze.startTime = 0;
    list.bhv[6].gaze.endTime = 100;

    list.bhv[6].emotion.weight = 0;
    list.bhv[6].emotion.call = 0;
    list.bhv[6].emotion.type = "doubt";
    list.bhv[6].emotion.startTime = 40;
    list.bhv[6].emotion.endTime = 100;

    list.bhv[6].speech.weight = 1;
    list.bhv[6].speech.call = 1;
    list.bhv[6].speech.content = "answer";
    list.bhv[6].speech.tone = 2;
    list.bhv[6].speech.rate = 2;
    list.bhv[6].speech.startTime = 0;
    list.bhv[6].speech.endTime = 100;

    list.bhv[6].arms.weight = 0;
    list.bhv[6].arms.call = 0;
    list.bhv[6].arms.action = "wave";
    list.bhv[6].arms.rate = 1;
    list.bhv[6].arms.startTime = 30;
    list.bhv[6].arms.endTime = 90;

    list.bhv[6].legs.weight = 1;
    list.bhv[6].legs.call = 1;
    list.bhv[6].legs.target = "object";
    list.bhv[6].legs.action = "face";
    list.bhv[6].legs.rate = 2;
    list.bhv[6].legs.distance = 2;
    list.bhv[6].legs.startTime = 0;
    list.bhv[6].legs.endTime = 40;

    list.bhv[7].gaze.weight = 1;
    list.bhv[7].gaze.call = 1;
    list.bhv[7].gaze.target = "object";
    list.bhv[7].gaze.startTime = 0;
    list.bhv[7].gaze.endTime = 100;

    list.bhv[7].emotion.weight = 2;
    list.bhv[7].emotion.call = 1;
    list.bhv[7].emotion.type = "serious";
    list.bhv[7].emotion.startTime = 20;
    list.bhv[7].emotion.endTime = 100;

    list.bhv[7].speech.weight = 1;
    list.bhv[7].speech.call = 1;
    list.bhv[7].speech.content = "请出示您的通行码";
    list.bhv[7].speech.tone = 2;
    list.bhv[7].speech.rate = 2;
    list.bhv[7].speech.startTime = 20;
    list.bhv[7].speech.endTime = 100;

    list.bhv[7].arms.weight = 0;
    list.bhv[7].arms.call = 0;
    list.bhv[7].arms.action = "wave";
    list.bhv[7].arms.rate = 1;
    list.bhv[7].arms.startTime = 30;
    list.bhv[7].arms.endTime = 90;

    list.bhv[7].legs.weight = 1;
    list.bhv[7].legs.call = 1;
    list.bhv[7].legs.target = "object";
    list.bhv[7].legs.action = "face";
    list.bhv[7].legs.rate = 3;
    list.bhv[7].legs.distance = 2;
    list.bhv[7].legs.startTime = 0;
    list.bhv[7].legs.endTime = 20;

    list.bhv[8].gaze.weight = 0;
    list.bhv[8].gaze.call = 0;
    list.bhv[8].gaze.target = "object";
    list.bhv[8].gaze.startTime = 0;
    list.bhv[8].gaze.endTime = 100;

    list.bhv[8].emotion.weight = 0;
    list.bhv[8].emotion.call = 0;
    list.bhv[8].emotion.type = "doubt";
    list.bhv[8].emotion.startTime = 40;
    list.bhv[8].emotion.endTime = 100;

    list.bhv[8].speech.weight = 1;
    list.bhv[8].speech.call = 1;
    list.bhv[8].speech.content = "请大家保持秩序";
    list.bhv[8].speech.tone = 2;
    list.bhv[8].speech.rate = 2;
    list.bhv[8].speech.startTime = 0;
    list.bhv[8].speech.endTime = 100;

    list.bhv[8].arms.weight = 2;
    list.bhv[8].arms.call = 1;
    list.bhv[8].arms.action = "wave";
    list.bhv[8].arms.rate = 2;
    list.bhv[8].arms.startTime = 0;
    list.bhv[8].arms.endTime = 100;

    list.bhv[8].legs.weight = 0;
    list.bhv[8].legs.call = 0;
    list.bhv[8].legs.target = "object";
    list.bhv[8].legs.action = "face";
    list.bhv[8].legs.rate = 2;
    list.bhv[8].legs.distance = 2;
    list.bhv[8].legs.startTime = 0;
    list.bhv[8].legs.endTime = 40;

    list.bhv[9].gaze.weight = 1;
    list.bhv[9].gaze.call = 1;
    list.bhv[9].gaze.target = "object";
    list.bhv[9].gaze.startTime = 0;
    list.bhv[9].gaze.endTime = 100;

    list.bhv[9].emotion.weight = 0;
    list.bhv[9].emotion.call = 0;
    list.bhv[9].emotion.type = "doubt";
    list.bhv[9].emotion.startTime = 40;
    list.bhv[9].emotion.endTime = 100;

    list.bhv[9].speech.weight = 1;
    list.bhv[9].speech.call = 1;
    list.bhv[9].speech.content = "remind";
    list.bhv[9].speech.tone = 3;
    list.bhv[9].speech.rate = 2;
    list.bhv[9].speech.startTime = 40;
    list.bhv[9].speech.endTime = 100;

    list.bhv[9].arms.weight = 3;
    list.bhv[9].arms.call = 1;
    list.bhv[9].arms.action = "wave";
    list.bhv[9].arms.rate = 1;
    list.bhv[9].arms.startTime = 40;
    list.bhv[9].arms.endTime = 100;

    list.bhv[9].legs.weight = 1;
    list.bhv[9].legs.call = 1;
    list.bhv[9].legs.target = "object";
    list.bhv[9].legs.action = "face";
    list.bhv[9].legs.rate = 2;
    list.bhv[9].legs.distance = 2;
    list.bhv[9].legs.startTime = 0;
    list.bhv[9].legs.endTime = 100;

    list.bhv[10].gaze.weight = 0;
    list.bhv[10].gaze.call = 0;
    list.bhv[10].gaze.target = "object";
    list.bhv[10].gaze.startTime = 0;
    list.bhv[10].gaze.endTime = 100;

    list.bhv[10].emotion.weight = 0;
    list.bhv[10].emotion.call = 0;
    list.bhv[10].emotion.type = "doubt";
    list.bhv[10].emotion.startTime = 40;
    list.bhv[10].emotion.endTime = 100;

    list.bhv[10].speech.weight = 0;
    list.bhv[10].speech.call = 0;
    list.bhv[10].speech.content = "doubt";
    list.bhv[10].speech.tone = 2;
    list.bhv[10].speech.rate = 2;
    list.bhv[10].speech.startTime = 40;
    list.bhv[10].speech.endTime = 100;

    list.bhv[10].arms.weight = 0;
    list.bhv[10].arms.call = 0;
    list.bhv[10].arms.action = "wave";
    list.bhv[10].arms.rate = 1;
    list.bhv[10].arms.startTime = 30;
    list.bhv[10].arms.endTime = 90;

    list.bhv[10].legs.weight = 1;
    list.bhv[10].legs.call = 1;
    list.bhv[10].legs.target = "charger";
    list.bhv[10].legs.action = "face";
    list.bhv[10].legs.rate = 2;
    list.bhv[10].legs.distance = 1;
    list.bhv[10].legs.startTime = 0;
    list.bhv[10].legs.endTime = 100;

    list.bhv[11].gaze.weight = 2;
    list.bhv[11].gaze.call = 1;
    list.bhv[11].gaze.target = "object";
    list.bhv[11].gaze.startTime = 0;
    list.bhv[11].gaze.endTime = 100;

    list.bhv[11].emotion.weight = 0;
    list.bhv[11].emotion.call = 0;
    list.bhv[11].emotion.type = "doubt";
    list.bhv[11].emotion.startTime = 40;
    list.bhv[11].emotion.endTime = 100;

    list.bhv[11].speech.weight = 1;
    list.bhv[11].speech.call = 1;
    list.bhv[11].speech.content = "您的体温正常，可以进学校";
    list.bhv[11].speech.tone = 2;
    list.bhv[11].speech.rate = 2;
    list.bhv[11].speech.startTime = 40;
    list.bhv[11].speech.endTime = 100;

    list.bhv[11].arms.weight = 2;
    list.bhv[11].arms.call = 1;
    list.bhv[11].arms.action = "Pass";
    list.bhv[11].arms.rate = 1;
    list.bhv[11].arms.startTime = 30;
    list.bhv[11].arms.endTime = 90;

    list.bhv[11].legs.weight = 1;
    list.bhv[11].legs.call = 1;
    list.bhv[11].legs.target = "target";
    list.bhv[11].legs.action = "face";
    list.bhv[11].legs.rate = 2;
    list.bhv[11].legs.distance = 1;
    list.bhv[11].legs.startTime = 0;
    list.bhv[11].legs.endTime = 100;
}
//任务执行状态监控 返回分解点

int CanInterrupt(Queue_para* ptr, social_msg::bhvReply item)
{
    //if(((item.reply < ptr->data[ptr->front].speech.endTime) && (item.reply > ptr->data[ptr->front].speech.startTime)) || item.reply > 70)
    if(item.reply > 70)
        return 0;
    return item.reply + 10;
}

int CanConcurrence(Queue_para* ptr, social_msg::bhvPara Concurptr, social_msg::bhvReply item)
{
    int flag = 0;
    social_msg::bhvPara temp = ptr->data[ptr->front];
    if(temp.arms.call + Concurptr.arms.call >1) flag = 1; 
    if(temp.emotion.call + Concurptr.emotion.call >1) flag = 1; 
    if(temp.gaze.call + Concurptr.gaze.call > 1) flag = 1; 
    if(temp.legs.call + Concurptr.legs.call >1) flag = 1; 
    if(temp.speech.call + Concurptr.speech.call >1) flag = 1;  

    // if(Concurptr.arms.call) sum2+=10000;
    // if(Concurptr.emotion.call) sum2+=1000;
    // if(Concurptr.gaze.call) sum2+=100;
    // if(Concurptr.legs.call) sum2+=10;
    // if(Concurptr.speech.call) sum2+=1;

    //判断是否满足插入条件
    if((item.reply > 70) || flag)
        return 0;
    else
        return item.reply + 10;

}
//过渡行为生成
void TransTask_Create(social_msg::bhvPara &item)
{

}

//任务并发
void TaskConcurrence(Queue_para* ptr, social_msg::bhvPara item)
{
    social_msg::bhvPara OriTask,ConcurTask;
    int temp;
    OriTask = ptr->data[ptr->front];
    temp = CanConcurrence(ptr, item, tasks.states);
    if(temp)
    {
        //任务并发
        //oriTask
        OriTask.num += 200 + temp;
        //OriTask.Needs += " " + item.Needs;
        OriTask.TotalOrder = 2;
        OriTask.weight = item.weight;

        //并发
        ConcurTask = OriTask;
        ConcurTask.num = ConcurTask.num - temp;
        ConcurTask.CurOrder = 2;
        ConcurTask.Needs = item.Needs;
        ConcurTask.arms = OriTask.arms.call ? OriTask.arms : item.arms;
        ConcurTask.emotion = OriTask.emotion.call ? OriTask.emotion : item.emotion;
        ConcurTask.gaze = OriTask.gaze.call ? OriTask.gaze : item.gaze;
        ConcurTask.legs = OriTask.legs.call ? OriTask.legs : item.legs;
        ConcurTask.speech = OriTask.speech.call ? OriTask.speech : item.speech;

        //UI并发进度条颜色设置
        ConcurTask.arms.IsYellow = OriTask.arms.call ? 0 : 1;
        ConcurTask.emotion.IsYellow = OriTask.emotion.call ? 0 : 1;
        ConcurTask.gaze.IsYellow = OriTask.gaze.call ? 0 : 1;
        ConcurTask.legs.IsYellow = OriTask.legs.call ? 0 : 1;
        ConcurTask.speech.IsYellow = OriTask.speech.call ? 0 : 1;
        //UI并发显示
        // ConcurTask.HeadBehavior = item.Needs;
        // ConcurTask.HeadBehavior_person = item.gaze.target;
        //入队
        Pop(ptr);
        Insert(ptr, 1, ConcurTask);
        Insert(ptr, 1, OriTask);

        InsertAndConcurFlag = 1;
    }

}

//任务插入函数
void TaskInsert(Queue_para* ptr, social_msg::bhvPara item)
{
    social_msg::bhvPara OriTask,TransTask,InsertTask,TaskContinue;
    OriTask = ptr->data[ptr->front];
    if(CanInterrupt(ptr,tasks.states))
    {
        //任务分解
        //oriTask
        OriTask.num += 100 + CanInterrupt(ptr,tasks.states);
        //OriTask.Needs += " "+ item.Needs;
        OriTask.TotalOrder = 4;
        OriTask.weight = item.weight;

        //过渡行为：TransTask
        TransTask_Create(TransTask);
        TransTask = OriTask;
        TransTask.num = 100;
        TransTask.Needs = OriTask.Needs;
        TransTask.CurOrder = 2;
        TransTask.TotalOrder = 4;

        //插入行为
        InsertTask = item;
        // InsertTask.HeadBehavior = item.Needs;
        // InsertTask.HeadBehavior_person = item.gaze.target;
        InsertTask.num = 100;
        InsertTask.Needs = item.Needs;
        InsertTask.CurOrder = 3;
        InsertTask.TotalOrder = 4;
        InsertTask.gaze.IsYellow = 1;
        InsertTask.emotion.IsYellow = 1;
        InsertTask.speech.IsYellow = 1;
        InsertTask.arms.IsYellow = 1;
        InsertTask.legs.IsYellow = 1;

        //恢复原执行行为
        TaskContinue = OriTask;
        TaskContinue.num = 100;
        TaskContinue.Needs = TransTask.Needs;
        TaskContinue.CurOrder = 4;
        TaskContinue.TotalOrder = 4;
        //恢复处理，主要是语音

        //4个任务入队
        //原任务弹出
        Pop(ptr);

        Insert(ptr, 1, TaskContinue);
        Insert(ptr, 1, InsertTask);
        //Insert(ptr, 1, TransTask);
        Insert(ptr, 1, OriTask);
        InsertAndConcurFlag = 1;
    }
}

void shiftneedlist(social_msg::need_msg &list)
{
    if(list.need_name== "Greet") list.need = 0;
    else if (list.need_name == "Doubt") list.need = 1;
    else if (list.need_name == "MeasureTempareture") list.need = 2;
    else if (list.need_name == "Wander") list.need = 3;
    else if (list.need_name == "StopStranger") list.need = 4;
    else if (list.need_name == "Chat") list.need = 5;
    else if (list.need_name == "Answer") list.need = 6;
    else if (list.need_name == "ParentIdentity") list.need = 7;
    else if (list.need_name == "KeepOrder") list.need = 8;
    else if (list.need_name == "Remind") list.need = 9;
    else if (list.need_name == "Charge") list.need = 10;
    else if (list.need_name == "Pass") list.need = 11;
}
//插入判断，满足条件就插队，不满足就入队
void ParaInsert(Queue_para* ptr, social_msg::bhvPara item)
{
    int n = ptr->count;
    //social_msg::bhvPara temp;
    if(n == 0) 
        Append(ptr, item);
    else{
            //chat\wander判断
            if(CurrentTaskName == "Wander"){

                Append(ptr,item);
                tasks.flag = 1;
                Pop(Q);

            }
            //并发判断
            // else if(CanConcurrence(ptr, item, tasks.states))
            //     TaskConcurrence(ptr, item);
            //插入判断
            else if(item.weight > EnhanceFactor * ptr->data[ptr->front].weight)
            {
                TaskInsert(ptr, item);
            }
            // else{
            //     int i;
            //     for(i=0; i<n; i++){
            //         if(item.weight > ptr->data[(ptr->front+i)%20].weight){
            //             Insert(ptr,i,item);
            //             break;
            //         }
            //     }
            //     if((i == n)&&(item.weight < ptr->data[(ptr->front+i-1)%20].weight))
            //         Append(ptr,item);
            // }
            else
                Append(ptr, item);
        }
}
//根据行为参数将需求清单生成对应的行为
void Behavior_Create(social_msg::need_msg &Buf, Queue_para* Q_para, LocalList list){
    social_msg::bhvPara temp_Qpara;
    social_msg::need_msg temp_list;
    if(chatterCallbackFlag == 1)
    {
        test_j++;
        ROS_INFO("call:%d",test_j);
        temp_list = Buf;
        shiftneedlist(temp_list);
        temp_Qpara = list.bhv[temp_list.need];
        temp_Qpara.gaze.target = temp_list.person_name;
        temp_Qpara.legs.target = temp_list.person_name;     //(1) temp_Qpara.legs.target存储的是
        temp_Qpara.emotion.type = temp_list.rob_emotion;    // (2)这怎么办？
        temp_Qpara.speech.content = temp_list.speech;
        temp_Qpara.weight = temp_list.weight;
        //根据机器人心情调节动作
        if(emotionFlag == 1)//积极影响
        {
            temp_Qpara.legs.rate = (temp_Qpara.legs.rate==3) ? temp_Qpara.legs.rate : (temp_Qpara.legs.rate +1);
            temp_Qpara.arms.rate = (temp_Qpara.arms.rate==3) ? temp_Qpara.arms.rate : (temp_Qpara.arms.rate +1);
            temp_Qpara.speech.rate = (temp_Qpara.speech.rate==3) ? temp_Qpara.speech.rate : (temp_Qpara.speech.rate +1);
            temp_Qpara.speech.tone = (temp_Qpara.speech.tone==3) ? temp_Qpara.speech.tone : (temp_Qpara.speech.tone +1);
        }
        else if(emotionFlag == 2)//消极影响
        {
            temp_Qpara.legs.rate = (temp_Qpara.legs.rate==1) ? temp_Qpara.legs.rate : (temp_Qpara.legs.rate - 1);
            temp_Qpara.arms.rate = (temp_Qpara.arms.rate==1) ? temp_Qpara.arms.rate : (temp_Qpara.arms.rate -1);
            temp_Qpara.speech.rate = (temp_Qpara.speech.rate==1) ? temp_Qpara.speech.rate : (temp_Qpara.speech.rate -1);
            temp_Qpara.speech.tone = (temp_Qpara.speech.tone==1) ? temp_Qpara.speech.tone : (temp_Qpara.speech.tone -1);
        }
        ParaInsert(Q_para,temp_Qpara);
        ROS_INFO("Qs nums:%d", Q_para->count);   /* ?? */
        chatterCallbackFlag = 0;    
    }
}


//可插入时刻标定（断句处理）
void Punctuate(Queue_para* ptr)
{

}



void needCallback(const social_msg::need_msg::ConstPtr& msg)
{
    //social_msg::bhvQueue temp;
    test_i++;
    ROS_INFO("task name:[%s][%d]",msg->need_name.c_str(), test_i);
    ListBuf = *msg;
    chatterCallbackFlag = 1; //需要处理
}

void replyCallback(const social_msg::bhvReply::ConstPtr& msg)
{
    social_msg::bhvReply temp_list = *msg;
    social_msg::bhvPara temp_para;
    ROS_INFO("process:[%d]",msg->reply);
    tasks.states.num = msg->num;
    tasks.states.reply = msg->reply;
    if(msg->reply == 100) 
    {
        tasks.flag = 1;
        CurrentTaskName = "None";
        Pop(Q);
    }
}

int EmotionDealing(social_msg::robot_emotion temp)
{
    float avr_pos, avr_neg, avr_neu;
    avr_pos = (temp.emotion1 + temp.emotion2 + temp.emotion3 + temp.emotion5)/4;
    avr_neg = (temp.emotion4 + temp.emotion6)/2;
    avr_neu = (temp.emotion7 + temp.emotion8)/2;
    if(((avr_pos - avr_neg) > 0.2) && (avr_neu < 0.4))
        return 1;
    else if(((avr_neg - avr_pos) > 0.2) && (avr_neu < 0.4))
        return 2;
    else 
        return 0;
}

void emotionCallback(const social_msg::robot_emotion::ConstPtr& msg)
{
    social_msg::robot_emotion temp = *msg;
    ROS_INFO("emotion update!");
    emotionFlag = EmotionDealing(temp);
}

void bodyCallback(const social_msg::robot_status::ConstPtr& msg)
{

}

int main(int argc,char **argv)
{
    int count=0,taskNum=0;
    //名称talker必须唯1
    LocalList List;
    
    setlocale(LC_CTYPE, "zh_CN.utf8");
    // social_msg::bhvGet bGet;
    
    Queue_init(Q);
    tasks.flag = 1;
    //名称初始化时要求唯一
    ros::init(argc,argv,"dealing_node");
    ros::NodeHandle n;

    LoclistInit(List);

    ros::Publisher chatter_pub=n.advertise<social_msg::bhvPara>("behavior_pub",10);
    ros::Publisher chatterQ_pub=n.advertise<social_msg::bhvQueue>("behaviorQ_pub",1000);
    ros::Rate loop_rate(10); //loop_rate 发送数据频率10Hz
    ros::Subscriber list_sub=n.subscribe<social_msg::need_msg>("need_lists",10,   needCallback);
    ros::Subscriber reply_sub=n.subscribe<social_msg::bhvReply>("behavior_Reply",10,  replyCallback);
    ros::Subscriber emotion_sub=n.subscribe<social_msg::robot_emotion>("robot_emotion_msg",10, emotionCallback);
    ros::Subscriber body_sub=n.subscribe<social_msg::robot_status>("robot_status_msg",10, bodyCallback);
    ros::spinOnce();

    while(ros::ok())
    {
        Behavior_Create(ListBuf,Q,List);
        social_msg::bhvPara temp;
        social_msg::bhvQueue temp2;
        temp2.n = Q->count;
            int m = Q->front;
        for(int i=0; i< temp2.n; i++)
        {
            // string Qdata_need = (string)Q->data[m].Needs;
            temp2.need[i] =  Q->data[m].Needs;  //Qdata_need;( std_msgs::String ) 
            // string Qdata_target = Q->data[m].gaze.target;
            temp2.obj[i] = Q->data[m].gaze.target ; //Qdata_target;
            m = (m+1)%20;
        }
         chatterQ_pub.publish(temp2);

        if(((!QueueEmpty(Q)) && (tasks.flag == 1)) || (InsertAndConcurFlag))
        {
            temp = Q->data[Q->front];
            //录入当前正在执行任务名称
            CurrentTaskName = temp.Needs;
            taskNum ++;
            temp.num = taskNum*1000+temp.num;
            //调试
            // temp.num = taskNum*1000+temp.num+100;s
            temp.time = int64_t((ros::Time::now().toSec())*1000.0);
            
            chatter_pub.publish(temp);
            tasks.flag = 0;
            InsertAndConcurFlag = 0;
            //Pop(Q);
            
        }
        ros::spinOnce();

        loop_rate.sleep();
        ++count;
    }
    return 0;
}
