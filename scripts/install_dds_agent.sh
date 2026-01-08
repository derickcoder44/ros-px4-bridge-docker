#!/bin/bash
# Install Micro XRCE-DDS Agent for PX4-ROS communication
set -e

echo "Installing Micro XRCE-DDS Agent..."

# Use sudo if not running as root
SUDO=""
if [ "$(id -u)" != "0" ]; then
    SUDO="sudo"
fi

cd /tmp
git clone https://github.com/eProsima/Micro-XRCE-DDS-Agent.git
cd Micro-XRCE-DDS-Agent
mkdir build && cd build
cmake ..
make -j$(nproc)
$SUDO make install
$SUDO ldconfig

cd / && rm -rf /tmp/Micro-XRCE-DDS-Agent

echo "Micro XRCE-DDS Agent installed successfully!"
