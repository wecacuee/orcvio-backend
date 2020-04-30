sudo sh install-deps/install-apt-get-packages.sh

{
    export CATKIN_WORKSPACE=$(pwd)
    export INSTALL_PREFIX=${CATKIN_WORKSPACE}/devel
    mkdir -p $INSTALL_PREFIX
    export SUDO=sudo
    [ -d $INSTALL_PREFIX/share/OpenCV/ ] || \
        make -f install-deps/install-opencv.mk
    [ -f $INSTALL_PREFIX/include/sophus/se3.hpp ] || \
        make -f install-deps/install-sophus.mk
    [ -f $INSTALL_PREFIX/share/catkin_simple/cmake/catkin_simpleConfig.cmake ] || \
        make -f install-deps/install-catkin-simple.mk
}

virtualenv --python=python3.6 .tox/py36
source .tox/py36/bin/activate
pip3 install --no-cache -r install-deps/pip-requirements.txt
catkin config -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m \
    -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.6m.so 
    --blacklist darknet_ros --extend /opt/ros/melodic/
catkin build
source setup.bash

