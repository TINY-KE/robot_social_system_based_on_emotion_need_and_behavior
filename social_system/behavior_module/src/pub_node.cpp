#include "ros/ros.h"
#include "ros/time.h"
#include "ros/duration.h"
#include "std_msgs/String.h"
#include <sstream>
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

typedef struct queue_para{
    int count;
    int front;
    int rear;
    social_msg::bhvPara data[20];
}Queue_para;

Queue_para* Q = (Queue_para*)malloc(sizeof(Queue_para));

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

void Pub_process(Queue_para* ptr)//
{

}

void reply_process(void)
{

}

void chatterCallback(const social_msg::bhvPara::ConstPtr& msg)
{
    social_msg::bhvPara temp_para = *msg;
    ROS_INFO("current task:%s", msg->Needs.c_str());
    ROS_INFO("current order:%d", msg->CurOrder);
    if(msg->num%100!=0)
        Pop(Q);
    Append(Q,temp_para);
}
int main(int argc,char **argv)
{
    //名称talker必须唯1
    Queue_init(Q);
    ros::init(argc,argv,"pub_node");
    ros::NodeHandle n;
    ros::Duration(1).sleep();
    ros::Publisher chatter_pub=n.advertise<social_msg::bhvReply>("behavior_Reply",1000);
    ros::Rate loop_rate(1); //loop_rate 发送数据频率10Hz


    ros::Subscriber task_sub=n.subscribe<social_msg::bhvPara>("behavior_pub",1000,chatterCallback);
    ros::spinOnce();
    int count=0;
    int i=0;
    social_msg::bhvReply reply;
    social_msg::bhvPara temp_para;
    int endtime=0;
    setlocale(LC_CTYPE, "zh_CN.utf8");
    
    
    while(ros::ok())
    {
        if(!QueueEmpty(Q))
        {
            temp_para = Q->data[Q->front];
            if(temp_para.Needs == "Wander"){
                Pop(Q);
            }
            else {
                endtime = temp_para.num%100;
                i+=10;
                if((endtime!=0)&&(temp_para.num%1000/100!=0))//收到num末尾140即开始任务插入
                {
                    //Pop(Q);
                    i = 100;
                }
                
                reply.num = temp_para.num;
                reply.time = 0;
                reply.reply = i;
                chatter_pub.publish(reply);
                ROS_INFO("Published!");
                if(i >= 100)
                {
                    Pop(Q);
                    i = 0;
                    
                }
            }
        }
        ros::spinOnce();
        loop_rate.sleep();
        ++count;
    }
    return 0;
}