. /opt/ros/melodic/setup.sh && \
    catkin config -DPYTHON_EXECUTABLE=$(which python) \
           -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m \
           -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.6m.so \
           --blacklist darknet_ros --extend /opt/ros/melodic/ && \
    { [ -f src/.rosinstall ] || wstool init src; } && \
    cd src && { rosinstall_generator cv_bridge | wstool merge - ; } && \
    wstool update && cd -

