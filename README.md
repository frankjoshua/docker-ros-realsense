### Rosify Intel Realsense cameras
Start D435 Camera
```
docker run -it \
    --network="host" \
    --env="ROS_IP=$ROS_IP" \
    --env="ROS_MASTER_URI=$ROS_MASTER_URI" \
    -v "$PWD/d435.launch:/ros.launch:ro" \
    --privileged \
    frankjoshua/ros-realsense
```
Start T265 Camera
```
docker run -it \
    --network="host" \
    --env="ROS_IP=$ROS_IP" \
    --env="ROS_MASTER_URI=$ROS_MASTER_URI" \
    -v "$PWD/t265.launch:/ros.launch:ro" \
    --privileged \
    frankjoshua/ros-realsense
```
Start RTAB Map
```
docker run -it \
    --network="host" \
    --env="ROS_IP=$ROS_IP" \
    --env="ROS_MASTER_URI=$ROS_MASTER_URI" \
    -v "$PWD/rtabmap.launch:/ros.launch:ro" \
    --privileged \
    frankjoshua/ros-realsense
```
