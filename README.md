<!--
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2021-12-18 20:20:34
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2023-05-09 11:38:53
-->
#  robot_social_system_based_on_emotion_need_and_behavior
### 一、下载此package包到ROS工作空间


### 二、安装第三方库：
1.  【弃用】百度api： 
    python版本2.7  
    pip install setuptools   
    cd ThirdParty/aip-python-sdk-4.15.13  &&  sudo python setup.py install   
    pip install requests 
    pip install numpy==1.11.2 pandas==0.23.0   
2.  yaml cpp  
    cd /ThirdParty/yaml-cpp   
    mkdir build   
    cd build   
    cmake -DBUILD_SHARED_LIBS=ON ..   
    make   
    sudo make install   


### 三、visualization中qt和qtcreator的安装使用方法
1. qt 5.12.4:  
	sudo apt-get install ros-kinetic-qt-*
2. qtcreator 4.4.1  和 qtcreator-ros-plugin: 
	https://qtcreator-ros.datasys.swri.edu/downloads/installers/xenial/archived/    建议下载qtcreator-ros-xenial-480-offline-installer.run 

3. qtcreator中导入ros workspace  
	https://blog.csdn.net/a347755140/article/details/117020994


### 四、编译：
+ 首先编译所需的msg文件
    catkin_make -DCATKIN_WHITELIST_PACKAGES="social_msg"
+ 编译其他package
    catkin_make -DCATKIN_WHITELIST_PACKAGES=""

### 五、运行：
+ 情感模块
rosrun emotion_module main.py

+ 需求模块
rosrun need_module need_model

+ 行为模块
 
 
+ 与安卓的蓝牙通信
rosrun robot_platform platform 1

+ qt可视化
roslaunch visualization  visualization.launch    

+ 手动点击的仿真输入接口
roslaunch interface_sim interface_sim_cfg.launch

+ 手动发布"机器人闲置状态"
    + 发送“无后续行为”的闲置状态，从而使机器人在闲置30秒后，生成“无聊”的情绪。
  rostopic pub /idleState social_msg/idleState "{idleState: true, hehavior_name: '', person_name: '', IDtype: '', target_angle: 0.0,   target_distance: 0.0, person_emotion: '', satisfy_value: 0}" 

    + 发送“测温”行为结束的闲置状态，从而生成Pass放行的入校的需求，同时机器人会因为完成了”测温行为“而生成“高兴”的情绪。
    rostopic pub /idleState social_msg/idleState "{idleState: false, hehavior_name: 'MeasureTempareture', person_name: 'xiaoming', IDtype: 'Student', target_angle: 0.0,
    target_distance: 0.0, person_emotion: 'happy', satisfy_value: 1}"
    
    



