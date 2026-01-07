#!/bin/bash
# Build ROS 2 workspace
set -e

WORKSPACE=${WORKSPACE:-$HOME/workspace}
ROS_WS=$WORKSPACE/ros2_ws

echo "Building ROS 2 workspace..."

source /opt/ros/humble/setup.bash
cd $ROS_WS
colcon build --symlink-install
source install/setup.bash

echo "ROS 2 workspace build completed!"
