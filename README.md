#  robot_social_system_based_on_emotion_need_and_behavior

### 一、安装第三方库：
1.  【弃用】百度api： 
    python版本2.7  
    pip install 了setuptools   
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



### 二、visualization中qt和qtcreator的安装使用方法
1. qt 5.12.4:  
	sudo apt-get install ros-kinetic-qt-*
2. qtcreator 4.4.1  和 qtcreator-ros-plugin: 
	https://qtcreator-ros.datasys.swri.edu/downloads/installers/xenial/archived/    建议下载qtcreator-ros-xenial-480-offline-installer.run 

3. qtcreator中导入ros workspace  
	https://blog.csdn.net/a347755140/article/details/117020994



### 三、运行：
+ 情感模块
rosrun emotion_module main.py

+ 需求模块
rosrun need_module need_model

+ 行为模块
 
 
+ 与安卓的蓝牙通信
rosrun robot_platform platform 1

+ qt可视化
roslaunch visualization  visualization.launch    

+ 手动的仿真输入接口
roslaunch interface_sim interface_sim_cfg.launch


