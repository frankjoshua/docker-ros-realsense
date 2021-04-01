# ROS realsense in Docker [![](https://img.shields.io/docker/pulls/frankjoshua/ros-realsense)](https://hub.docker.com/r/frankjoshua/ros-realsense) [![CI](https://github.com/frankjoshua/docker-ros-realsense/workflows/CI/badge.svg)](https://github.com/frankjoshua/docker-ros-realsense/actions)

## Description

Runs ros realsense in a Docker container. Probably need --network="host" because ROS uses ephemeral ports. The container also needs access to the D435 and T265 cameras via usb. So a volume "/dev:/dev" must be shared. --privileged may also be needed based on the hardware setup.

## Example

```
docker run -it \
    --network="host" \
    --env="ROS_IP=$ROS_IP" \
    --env="ROS_MASTER_URI=$ROS_MASTER_URI" \
    -v "$PWD/realsense.launch:/ros.launch:ro" \
    --privileged \
    -v "/dev:/dev" \
    frankjoshua/ros-realsense
```

## Building

Use [build.sh](build.sh) to build the docker containers.

<br>Local builds are as follows:

```
./build.sh -t frankjoshua/ros-realsense -l
```

## Architectures

x86 and arm64
arm32 is not supported but should be possible with some work.

## Testing

Github Actions expects the DOCKERHUB_USERNAME and DOCKERHUB_TOKEN variables to be set in your environment.

## License

Apache 2.0

## Author Information

Joshua Frank [@frankjoshua77](https://www.twitter.com/@frankjoshua77)
<br>
[http://roboticsascode.com](http://roboticsascode.com)
