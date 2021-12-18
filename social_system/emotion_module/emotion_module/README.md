# Readme

## 修订说明

（改的有点多，仅列举主要修订，具体pkg使用可参考下述诸说明）

* 在同一个节点内订阅三个msg话题，并且发送名为 robot_emotion_msg 的话题，节点名为：robot_emotion，并将该节点运行调至Data_processing.py中

* 增加emotion_param.csv，即将情感模型参数用.csv文件传入

* 增加Image_talker.py单独作为可视化（本地图片）的发布，.py文件放在Scripts文件夹内，发布图片的节点名为：Image_talker，话题名为：emotion_img

* 在pkg内增加Image文件夹存放可视化素材和最终生成的本地图片，本地图片为：emotion_img.png

* 目前print的信息：

  * Msg list：当前收到的话题消息
  * Whether_work：该消息是否构成刺激
  * List of emotion change：情绪增量向量
  * 机器人当前情感
  
  

## 配置说明

* 百度api：（已在Data_processing.py中配置）

> * 配置信息：
>
>   APP_ID = '25295465'
>
>   API_KEY = 'WxY0AiFTs0HgWZaSsWGB6lM4'
>
>   SECRET_KEY = '9oGOc6MmGGkFcYp6aGaRRy1fT87TYQ1t'
>
> * 接口调用：
>
>   client = AipNlp(APP_ID, API_KEY, SECRET_KEY)    
>
> * 安装包与依赖：
>
>   setuptools ，requests（pip install）
>
>   cd ThirdParty/aip-python-sdk-4.15.13  &&  sudo python setup.py install

* python版本2.7 
* pip install numpy==1.11.2 pandas==0.23.0   

* Pillow库-（版本任意，python2.x中import Image或import PIL.Image as Image，python3.x中from PIL import Image )



## 使用说明

* scripts文件夹中有四个.py文件：

  > * Data_processing.py ：订阅+发布话题，消息处理，启动计算与可视化
  > * main.py：**主要执行文件**（直接rosrun），内含启动Data_processing.py、可视化模块
  > * Emotion_engine：定义主要全局变量，情感计算模块

* scripts文件夹中有四个.csv文件：

  * need_satisfy.csv：自我评价移情规律表

    | ***\*satisfy_value\**** | ***\*need_name\**** |                              |                  |                            |                     |                        |                    |                   |                  |                    |                    |      |
    | ----------------------- | ------------------- | ---------------------------- | ---------------- | -------------------------- | ------------------- | ---------------------- | ------------------ | ----------------- | ---------------- | ------------------ | ------------------ | ---- |
    |                         | ***\*Chat\****      | ***\*MeasureTempareture\**** | ***\*Answer\**** | ***\*ParentIdentity、\**** | ***\*KeepOrder\**** | ***\*StopStranger\**** | ***\*Wander、\**** | ***\*Doubt、\**** | ***\*Chat、\**** | ***\*Charge、\**** | ***\*Remind、\**** |      |
    | -2                      | ⽆聊 + 0.5          | ⾼兴 - 0.7                   | 0                | 0                          | 愤怒 + 0.4 悲伤+0.2 | 愤怒 + 0.4             | 愤怒 + 0.1         | 伤心 + 0.5        | 伤心 + 0.5       | 伤心 + 0.5         | 伤心 + 0.5         |      |
    | -1                      | ⽆聊 + 0.2          | ⾼兴 - 0.3                   | 0                | 0                          | 愤怒 + 0.2          | 愤怒 + 0.2             | 0                  | 0                 | 伤心 + 0.3       | 伤心 + 0.3         | 伤心 + 0.3         |      |
    | 0                       | 0                   | 0                            | 0                | 0                          | 0                   | 0                      | 0                  | 0                 | 0                | 0                  | 0                  |      |
    | 1                       | ⾼兴 + 0.1          | ⾼兴 + 0.3                   | 高兴 + 0.1       | 高兴 + 0.1                 | 高兴 + 0.1          | 高兴 + 0.1             | 0                  | 高兴 + 0.1        | 高兴 + 0.2       | 高兴 + 0.2         | 高兴 + 0.2         |      |
    | 2                       | ⾼兴 + 0.3          | ⾼兴 + 0.7                   | 高兴 + 0.3       | 高兴 + 0.3                 | 高兴 + 0.3          | 高兴 + 0.3             | 0                  | 高兴 + 0.3        | 高兴 + 0.4       | 高兴 + 0.4         | 高兴 + 0.4         |      |

  * attitude.csv：对象情绪感知移情规律表

    | ***\*用户情绪person_emotion\**** | ***\*社交态度attitude\**** |                |                |                     |
    | -------------------------------- | -------------------------- | -------------- | -------------- | ------------------- |
    | ***\*热情\****                   | ***\*恭敬\****             | ***\*严肃\**** | ***\*厌恶\**** |                     |
    | Happy                            | ⾼兴 + 1                   | ⾼兴 + 0.5     | 高兴+0.1       | 愤怒 + 0.3 悲伤+0.1 |
    | Sad                              | 悲伤 + 0.8                 | 悲伤 + 0.3     | 0              | 高兴 + 0.3          |

  * perception.csv：他人评价移情规律表

    | ***\*对话情绪\**** | ***\*情绪刺激\****  |
    | ------------------ | ------------------- |
    | 正向               | ⾼兴 + 0.5          |
    | 负向               | 悲伤 + 0.5 愤怒+0.1 |
    | 中性               | 0                   |

  * emotion_param.csv：配置情感模型固定参数表，**调试时可主要修改此处**

* 对定义的实时量说明：

  > * 八种情绪种类及顺序 [0，...，7]：高兴 Joy、信任 Trust、期待 Surprise、悲伤 Sadness、愤怒 Anger、害怕 Fear、厌恶 Disgust、无聊 Boring
  > * 社交态度信息在移情规律表中定义的为：热情enthusiastic  恭敬respectful  严肃serious  厌恶disgust
  > * 需求名称在移情规律表中定义的为：Greet 、MeasureTempareture、Answer、ParentIdentity、KeepOrder、StopStranger、Wander、Doubt、Chat、Charge、Remind

* 推荐可调参数：

  > * stimulus_t【Emotion_engine.py】，刺激持续时间，调整后刺激可引发的变化越大
  > * h1~h4【emotion_param.csv】，各情绪的多个阈值（理论上是正相关，但可能引发该值对应的刺激模式变化，规律待测）
  > * kmi【emotion_param.csv】，心境对各情绪值变化的影响，减小后可尽可能剥离心境的影响因素，减少由心境引发的情绪值突跳（或者无关情绪值变化）
  > * increaseKP【emotion_param.csv】，情感更新时间延长系数，调整后仅对一种刺激模式产生作用
  > * 移情规律表中的刺激强度值
  > * msg_dt【Data_processing.py】，两次内容相同消息，但作为不同刺激输入的最小时间阈值（s），增大后情感变化在长时间内会比较正常

* 四种刺激模式：

  > * 机器人的心境不能让其忽略此次刺激事件：
  >   * 刺激值和心境值大于前一时刻的情绪值。此种情况下，机器人当前情绪值为前一时刻心境和当前刺激的综合作用，持续时间为该刺激的作用时间。
  >   * 刺激值和心境值不大于前一时刻的情绪值。该情况下，情绪体验的强度不变，但是延长了情绪体验时间。
  > * 虽然机器人的心境能让其忽略此次刺激事件，但当前刺激和 上一时刻的情绪值大于心境值。该情况下，情绪的强度更新为机器人能够体验的最大情绪强度。
  > * 由于心境的存在，该刺激不足以引起机器人的情感变化，仍保持自然衰减

* 五种引发移情计算的情况：

  > * case1：delta_e全零，但不在刺激持续时间中——自然衰减
  > * case2：delta_e全零，但仍在刺激持续时间内，且current_e也全零——直接加和
  > * case3：delta_e全零，但仍在刺激持续时间内，current_e非全零——忽略delta_e
  > * case4：delta_e非全零，而current_e全零——直接加和，产生情绪突跳，不影响心境
  > * case5：delta_e非全零，且current_e也非全零——直接开启新的移情计算





### Tips

* 每次在本地更新pkg后都要对文件附可执行权限，可直接在文件夹内运行以下命令：

  ```
  sudo chmod +x -R *
  ```

* 百度情感倾向判断API对英文的识别率不高，比如so bad会对应正向情感，bad才会对应负向情感（但是中文的一般都对）
* 消息发布、图片本地存储等会存在一定延时
* 有关英文名称的选取，主要考虑与原论文贴近（可视化上的文字可随时改），且当前输出的值仍不仅是4维情感，因为加入了心境作用会激发同向其他情绪变化
* 由于有msg_dt，两次相同的刺激

### 



