/*
 * @Descripttion: 
 * @version: 
 * @Author: sueRimn
 * @Date: 2021-09-21 21:16:50
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2021-12-25 15:12:40
 */

#ifndef CONFIG_H
#define CONFIG_H

// std 
#include <vector>
#include <list>
#include <memory>
#include <string>
#include <iostream>
#include <set>
#include <unordered_map>
#include <map>
#include "common_include.h"
using namespace std; 



class read_need_parameter
{
private:
    
    YAML::Node task_doc;
    vector<need> need_lists;
public:
    read_need_parameter () {} // private constructor makes a singleton
    read_need_parameter (const string DB_CONF ) {   //DB_CONF： yaml文件地址
        task_doc = YAML::LoadFile( DB_CONF );
        cout<<"从cfg文件中的need数量:"<<task_doc.size()<<endl;
    }

public:
    ~read_need_parameter(){};  // close the file when deconstructing 
    vector<need>  return_task_need(){
         
         for(unsigned i=0; i<task_doc.size(); i++) {
            need temp;
            task_doc[i]["need_name"]  >> temp.need_name ;                   
            task_doc[i]["intention"]  >> temp.intention ;
            task_doc[i]["IDtype"]  >> temp.IDtype ; 
            std::cout <<  "    第" << i+1 << "个：" << temp.need_name << " for " <<temp.IDtype<< "\n";
            task_doc[i]["person_emotion"]  >> temp.person_emotion ;
            task_doc[i]["rob_emotion"] >> temp.rob_emotion;
            task_doc[i]["rob_status"] >> temp.rob_status;
            task_doc[i]["weight"]  >> temp.weight ;
            task_doc[i]["satisfy_value"]  >> temp.satisfy_value;
            temp.speech = "" ;

            need_lists.push_back(temp);
        }
        return need_lists;
    }
};


#endif // CONFIG_H