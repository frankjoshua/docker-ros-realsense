FROM ros:noetic-ros-base

HEALTHCHECK CMD /ros_entrypoint.sh rostopic list || exit 1

# RUN apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE \
#  || apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE

# RUN apt-get update && \
#     apt-get install -y software-properties-common && \
#     rm -rf /var/lib/apt/lists/*

# RUN add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" -u

RUN apt-get update && \
    apt-get install -y ros-$ROS_DISTRO-realsense2-camera && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Download, build and install catkin repo from github
# ENV CATKIN_REPO https://github.com/IntelRealSense/realsense-ros.git
# RUN /bin/bash -c "apt-get update && \
#                   source /opt/ros/$ROS_DISTRO/setup.bash && \
#                   mkdir -p /catkin_ws/src && \
#                   cd /catkin_ws/src && \
#                   git clone $CATKIN_REPO && \
#                   catkin_init_workspace && \
#                   rosdep update && \
#                   source /opt/ros/$ROS_DISTRO/setup.bash && \
#                   cd /catkin_ws/ && \
#                   rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y &&\
#                   catkin_make && \
#                   echo 'source /catkin_ws/devel/setup.bash' >> /root/.bashrc && \
#                   rm -rf /var/lib/apt/lists/"

# RUN apt-get update && \
#     apt-get install -y ros-$ROS_DISTRO-rtabmap-ros && \
#     rm -rf /var/lib/apt/lists/*

# Need to have an entry point that sources the catkin workspace
ADD ros_entrypoint.sh /

CMD ["roslaunch", "--wait", "/ros.launch"]
# CMD ["roslaunch", "--wait", "realsense2_camera", "rs_multiple_devices.launch"]