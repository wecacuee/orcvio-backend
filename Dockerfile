ARG BASE_IMG=wecacuee/orcvio-backend-deps:latest
FROM $BASE_IMG

ENV CATKIN_WORKSPACE /home/root/catkin_ws
RUN mkdir -p $CATKIN_WORKSPACE
COPY src $CATKIN_WORKSPACE/src
RUN cd $CATKIN_WORKSPACE && . install-deps/setup_catkin_config.bash && \
    catkin build --make-args run_tests && \
    catkin_test_results build
