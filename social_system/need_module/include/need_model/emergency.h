/*
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2022-03-08 17:05:40
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2022-03-29 09:44:37
 */

#include "common_include.h"

class Emergency {
    private:
        std::vector<need> read_need_lists;
        string intention_;
        string person_name_;
        string IDtype_;
        std::vector<double> rob_emotion_;
        std::string person_emotion_;
        std::vector<double> rob_status_;
        string yaml_name = "/home/zhjd/ws/src/social_system/personality_template/need/Emergency.yaml" ;
        string speech_; 

    public:
        Emergency(){
            /* 生成need */                
            read_need_parameter read;//(yaml_name);
            read_need_lists.clear();
            std::cout <<  "Read parameter for Emergency Need !! 类型如下： " << "\n"; 
            read_need_lists = read.return_emergency_need( yaml_name );
        }

        void update( perception per ){
                
                /* 读取need的判断信息 */
                intention_ = per.intention_;
                person_name_ = per.person_name_; 
                IDtype_ = per.IDtype_;
                person_emotion_ = per.person_emotion_;
                
                speech_ = per.speech_;
            }


        std::vector<need> need_output(){
            std::vector<need>  output_need_lists = read_need_lists;
            for(std::vector<need>::iterator iter = output_need_lists.begin(); iter != output_need_lists.end();  ){
                if(
                    intention_ ==  iter->intention  
                /* &&  IDtype_ == iter->IDtype   */
                ){
                    iter->person_name = person_name_;
                    iter->speech = speech_;
                    iter->person_emotion = person_emotion_;
                    iter ++;
                }
                else{
                    iter = output_need_lists.erase( iter ); 
                }
            }

            return output_need_lists;
        }

        void wirte(){
            // std::ofstream fout(yaml_name);
            // doc[0]["name"] = i;
            // fout << doc;
            // fout << std::endl;fout << std::endl;
            // fout.close();
        }



};