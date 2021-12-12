/*
 * @Descripttion: 
 * @version: 
 * @Author: sueRimn
 * @Date: 2021-09-21 21:16:50
 * @LastEditors: sueRimn
 * @LastEditTime: 2021-12-08 09:57:17
 */
#include "common_include.h"
#include "monitor.h"
class Adaptive {
    public:
        need_wu need_win_ ; 
        need_wu need_lose_ ; 
        int relation_;
        bool wuReturn_flag = false;
        monitor *m_;
        double emotion_person_win;   
        double emotion_person_lose;  
        double emotion_robot[8];
        double emotion_robot_value;

    public:
        double weight0_TwoPerson;
        double weight1_TwoPerson;
        double weight2_TwoPerson;


    public:
        Adaptive(){   }
        Adaptive(  monitor *m ): m_(m)
            {  /* 从本地文件中读取weight */ }
        // Adaptive(){}
        void Update(need_wu need_win , need_wu need_lose , int relation )  {   //rfe
            need_win_ = need_win;
            need_lose_ = need_lose;
            relation_ =  relation;
            cout<< "     Update Need_Comparsion\n";
            wuReturn_flag =  true;
        }



        
        int RelationCheck(need_wu &need_win_wu, need_wu & need_lose_wu){
            if(  NeedTypeCheck(need_win_wu.need_name) == TaskNeed &&  NeedTypeCheck(need_lose_wu.need_name) == TaskNeed &&  need_lose_wu.IDtype != need_win_wu.IDtype)
                return TwoPerson;
            if(  NeedTypeCheck(need_win_wu.need_name) == TaskNeed &&  NeedTypeCheck(need_lose_wu.need_name) == TaskNeed &&  need_lose_wu.IDtype == need_win_wu.IDtype)
                return OnePerson;
            if(  NeedTypeCheck(need_win_wu.need_name) == TaskNeed &&  NeedTypeCheck(need_lose_wu.need_name) == InnerNeed )
                return TaskandInner;
            if(  NeedTypeCheck(need_win_wu.need_name) == InnerNeed &&  NeedTypeCheck(need_lose_wu.need_name) == TaskNeed )
                return TaskandInner;
            if(  NeedTypeCheck(need_win_wu.need_name) == InnerNeed &&  NeedTypeCheck(need_lose_wu.need_name) == InnerNeed )
                return TwoInner;
        }
        
        
        
        

        double emotionCollector(string name){
           string emotion = m_->returnEmotion( name) ;
           if ( emotion == "Happy")   return 1;
           else if (  emotion == "Sad")   return 0;
           else if (  emotion == "Calm")   return 0.5;
           else  printf("emotion Collector Error");
        }

        void RobotEmotionUpdate(double emotion[8] ){ 
            
            for(int i = 0 ; i < 8 ; i ++ ) emotion_robot[i] = emotion[i];
            cout<< "     Update Robot Emotion in Monitor \n";
        }
        void robotEmotionAve() {
            int n = sizeof (emotion_robot) / sizeof (emotion_robot[0]);
            double sum=0;
            for (int i=0;i < n; i++)
                sum += emotion_robot[i];  
            
            emotion_robot_value = sum/n;
        }

        void returnWuResult(need_wu &need_win_wu, need_wu & need_lose_wu){
            emotion_person_win =  emotionCollector( need_win_wu.need_name );   
            emotion_person_lose =  emotionCollector(  need_lose_wu.need_name);  
            sleep(10);
            /* emtion_robot; */
            robotEmotionAve();
            
            int relation = RelationCheck(need_win_wu, need_lose_wu );
            if(relation == TwoPerson){
                need_lose_wu.wu =  emotion_person_win*weight0_TwoPerson  +   emotion_person_lose*weight1_TwoPerson  +   emotion_robot_value*weight2_TwoPerson;
                need_win_wu.wu =  -1*need_lose_wu.wu;
            }
                        
            wuReturn_flag =  false;
        }


    private:
        enum relation {
            TwoPerson,
            OnePerson,
            TaskandInner,
            TwoInner
        };

};

