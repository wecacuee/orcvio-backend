ARG BASE_IMG=wecacuee/orcvio-backend-deps:latest
FROM BASE_IMG

ENV CATKIN_WORKSPACE /home/root/catkin_ws
RUN mkdir -p $CATKIN_WORKSPACE
COPY src $CATKIN_WORKSPACE/src
RUN cd $CATKIN_WORKSPACE && \
    . /opt/ros/melodic/setup.sh && \
    catkin config -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m \
        -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.6m.so \
        --blacklist darknet_ros --extend /opt/ros/melodic/ && \
    catkin build --make-args run_tests && \
    catkin_test_results build
