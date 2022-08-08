<!--
 * @Descripttion: 
 * @version: 
 * @Author: Zhang Jiadong
 * @Date: 2022-05-05 14:03:27
 * @LastEditors: Zhang Jiadong
 * @LastEditTime: 2022-08-08 19:44:13
-->
#  robot_social_system_based_on_emotion_need_and_behavior
### 第三方测试专用程序 与 其他程序 的不同之处：
1.  需求模块中增加了，根据先验和方差的四个判断条件
2.  需求模块中“感知过滤”被删除
3. 。。。。


### 一、安装第三方库：
1.  百度api： 
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



### 三、仿真接口：    
roslaunch interface_sim interface_sim_cfg.launch



#### 


