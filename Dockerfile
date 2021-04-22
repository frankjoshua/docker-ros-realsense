FROM ros:noetic-ros-base

HEALTHCHECK CMD /ros_entrypoint.sh rostopic list || exit 1

RUN apt-get update && \
    apt-get install -y ros-$ROS_DISTRO-realsense2-camera && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY /app/ros.launch /app/ros.launch
CMD ["roslaunch", "--wait", "ros.launch"]