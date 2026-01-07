#!/bin/bash
# Install Micro XRCE-DDS Agent for PX4-ROS communication
set -e

echo "Installing Micro XRCE-DDS Agent..."

cd /tmp
git clone https://github.com/eProsima/Micro-XRCE-DDS-Agent.git
cd Micro-XRCE-DDS-Agent
mkdir build && cd build
cmake ..
make -j$(nproc)
make install
ldconfig

cd / && rm -rf /tmp/Micro-XRCE-DDS-Agent

echo "Micro XRCE-DDS Agent installed successfully!"
