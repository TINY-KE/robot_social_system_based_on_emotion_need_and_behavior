/*
 * @Descripttion: 
 * @version: 
 * @Author: zhjd
 * @Date: 2021-09-28 14:20:06
 * @LastEditors: sueRimn
 * @LastEditTime: 2021-09-28 19:53:35
 */

#include "common_include.h"
#include "perception.h"
// struct person_emotion{
//     std::string person;
//     std::string emotion;
// };

class person_emotion{
    public:
        person_emotion(){}
        person_emotion(perception p ){
            person_ =   p.IDtype_ ;
            // emotion_ = p.person_emotion_;
        }
    public:
        std::string person_;
        std::string emotion_;
        std::vector<perception> emotion_list;

        void insert(perception p) {
            // if((p.time_ -  emotion_list.front().time_)  <  120 )  /* 统计两分钟内的用户情绪 */
            //     emotion_list.push_back (p);
            // else{
            //     emotion_list.erase(     emotion_list.begin()    );
            //     emotion_list.push_back (p);
            // }
            std::vector<perception>::iterator iter = emotion_list.begin();
            for( ; iter != emotion_list.end();  iter++){
                if(  (p.time_ -  iter->time_)  < 120 )  break;
            } 

            if( iter == emotion_list.begin() ){
                emotion_list.push_back (p);
            }
            else {
                emotion_list.erase(     emotion_list.begin(),   iter -1 );
                emotion_list.push_back (p);
            }

            emotion_assess();  //重新计算用户的情绪
        }


        void emotion_assess(){
            int num = emotion_list.size();
            double value = 0;
            for( int i = 0; i < num; i++){
                value += emotion2value(emotion_list[i].person_emotion_) ;
            }
            emotion_ = value2emotion(  value / num  ) ;            
        }

        double emotion2value(string e){
            if( e == "Happy")  return 1;
            else if (  e == "Sad" )     return 0;
            else if (  e == "Calm" )     return 0.5;
            else printf("emotion to value Error");
        }

        string value2emotion(double e){
            if( e > 0.5)  return "Happy";
            else if (  e < 0.5 )    return "Sad";
            else if (  e = 0.5 )    return "Calm";
            else printf("value to emotion Error");
        }
};


class monitor {
    public:
        monitor(){}
        ~monitor(){}
    
    public:
        std::vector< person_emotion> Monitor_List;
    public:
        
        void emotionUpdate( const perception per){
            vector<person_emotion>::iterator iter = Monitor_List.begin();
            for( ;  iter != Monitor_List.end();  iter++){
                if( iter-> person_ == per.IDtype_   )   
                    iter-> insert(per);                
            }

            if(iter == Monitor_List.end())  {
                Monitor_List.push_back(    person_emotion(per)    );
            }
        }

        string returnEmotion( const string name ){
            int num = Monitor_List.size();
            
            for( int i = 0; i < num; i++){
                if( name == Monitor_List[i].person_)
                    return Monitor_List[i].emotion_;
            }
        }

};