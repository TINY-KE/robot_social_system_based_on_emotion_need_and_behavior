/*
 * @Descripttion: 
 * @version: 
 * @Author: sueRimn
 * @Date: 2021-09-21 21:16:50
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2022-03-30 17:40:10
 */
#include "perception.h"
#include "task_paremeter_rw.h"

class task_need{

    public:
        std::vector<need> read_need_lists;
        string intention_;
        string person_name_;
        string IDtype_;
        std::vector<double> rob_emotion_;
        std::string person_emotion_;
        std::vector<double> rob_status_;
        string yaml_name = "/home/zhjd/ws/src/social_system/personality_template/need/TaskNeed.yaml" ;
        string speech_; 
    public:
        task_need( ){
            /* 生成need */                
            read_need_parameter read;//(yaml_name);
            read_need_lists.clear();
            std::cout <<  "Read parameter for Task Need !! 类型如下： " << "\n"; 
            read_need_lists = read.return_task_need(yaml_name);
        }
        
        void update( perception per, double *emotion, double body[8]){
                
                /* 读取need的判断信息 */
                intention_ = per.intention_;
                person_name_ = per.person_name_; 
                IDtype_ = per.IDtype_;
                // for(int i = 0 ; i < 8 ; i ++ )  rob_emotion_[i] = rob_emotion[i];   /* 这怎么错了？？ */
                std::vector<double > temp(emotion, emotion+8); rob_emotion_.assign(temp.begin(), temp.end());
                person_emotion_ = per.person_emotion_;
                std::vector<double > temp2(body, body+8); rob_status_.assign(temp2.begin(), temp2.end());
                
                speech_ = per.speech_;
            }

        std::vector<need> need_output(){
            std::vector<need>  output_need_lists = read_need_lists;
            for(std::vector<need>::iterator iter = output_need_lists.begin(); iter != output_need_lists.end();  ){
                if(
                    intention_ ==  iter->intention  &&
                    IDtype_ == iter->IDtype  &&
                    // person_emotion_ == iter->person_emotion  &&
                    rob_emotion_ >= iter->rob_emotion  &&                    
                    rob_status_ >= iter->rob_status  
                ){
                    iter->person_name = person_name_;
                    iter->speech = speech_;
                    // if( iter->speech == "MeasureTempareture")
                    //     iter->speech = "请站在原地接受体温测量哦"; TODO:  交由行为管理模块完成.
                    iter->rob_emotion.assign(rob_emotion_.begin(), rob_emotion_.end());
                    iter->robot_emotion_str = robot_emotion_num2string( rob_emotion_ );
                    // iter->person_emotion.assign(person_emotion_.begin(), person_emotion_.end()); //TODO: ??
                    iter->person_emotion = person_emotion_;
                    iter->rob_status.assign(rob_status_.begin(), rob_status_.end()); 
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
        void weightUpdate(need_wu n){
            for(std::vector<need>::iterator iter = read_need_lists.begin(); iter != read_need_lists.end(); iter ++ )
                  if( n.need_name  ==  iter->need_name   &&     n.IDtype == iter->IDtype )
                    {
                        iter->weight +=  n.wu; 
                        printf("对[%s]的[%s]需求的权重更新[%f]",iter->IDtype, iter->need_name, n.wu);
                    }
            wirte();
        }
    private:
         string robot_emotion_num2string( std::vector<double> rob_emotion ){
            int temp  =  -1; 
            int i_temp;
            int i = 0;
            for(  ; i < rob_emotion.size() ; i++) {
                if( rob_emotion[i] > temp ){
                    temp = rob_emotion[i];
                    i_temp = i ;
                }
                // else if(rob_emotion[i] == temp){
                //     ROS_DEBUG("robot_emotion_num2string: 最大情绪值存在两个： [%d] 和 [%d] ",i_temp,i);
                // }
            }

            switch( i_temp )
                {
                case 0:
                    return "Joy"; 
                    break;
                case 1:
                    return "Trust"; 
                    break;
                case 2:
                    return "Suprise"; 
                    break;
                case 3:
                    return "Sadness"; 
                    break;
                case 4:
                    return "Anger"; 
                    break;
                case 5:
                    return "Fear"; 
                    break;
                case 6:
                    return "Disgust"; 
                    break;
                case 7:
                    return "Boring"; 
                    break;
                }
        }
        
};