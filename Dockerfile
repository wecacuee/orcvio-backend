FROM wecacuee/ros-melodic-bionic-nvidia:latest

ENV CATKIN_WORKSPACE /home/root/catkin_ws
RUN mkdir -p /home/root/
COPY . $CATKIN_WORKSPACE
RUN cd $CATKIN_WORKSPACE && git submodule init && git submodule update
RUN cd $CATKIN_WORKSPACE && bash setup_once.bash
