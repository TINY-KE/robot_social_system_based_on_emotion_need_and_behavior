#  robot_social_system_based_on_emotion_need_and_behavior

### 安装第三方库：
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


### visualization中qt和qtcreator的安装使用方法
1. qt 5.12.4:  
	sudo apt-get install ros-kinetic-qt-*
2. qtcreator 4.9.2  和 qtcreator-ros-plugin:  
	https://ros-qtc-plugin.readthedocs.io/en/latest/_source/How-to-Install-Users.html  找ubuntu16的offline版本  

3. qtcreator中导入ros workspace
	https://blog.csdn.net/a347755140/article/details/117020994

### 仿真接口：
roslaunch interface_sim interface_sim_cfg.launch

#### 

