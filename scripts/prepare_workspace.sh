#!/bin/bash
# Prepare PX4 and ROS 2 workspace
set -e

WORKSPACE=${WORKSPACE:-$HOME/workspace}
PX4_DIR=$WORKSPACE/PX4-Autopilot
ROS_WS=$WORKSPACE/ros2_ws

echo "Preparing workspace at $WORKSPACE..."

mkdir -p $WORKSPACE
cd $WORKSPACE

# Clone PX4 Autopilot
if [ ! -d "$PX4_DIR" ]; then
  echo "Cloning PX4 Autopilot..."
  git clone -b release/1.14 https://github.com/PX4/PX4-Autopilot.git --recursive
else
  echo "PX4 Autopilot already exists"
fi

# Set up ROS 2 workspace
mkdir -p $ROS_WS/src
cd $ROS_WS/src

# Clone PX4 ROS 2 packages
if [ ! -d "px4_msgs" ]; then
  echo "Cloning px4_msgs..."
  git clone -b release/1.14 https://github.com/PX4/px4_msgs.git
else
  echo "px4_msgs already exists"
fi

if [ ! -d "px4_ros_com" ]; then
  echo "Cloning px4_ros_com..."
  git clone -b release/v1.14 https://github.com/PX4/px4_ros_com.git
else
  echo "px4_ros_com already exists"
fi

echo "Workspace prepared successfully!"
echo "PX4 location: $PX4_DIR"
echo "ROS workspace: $ROS_WS"
