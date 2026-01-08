#!/bin/bash
# Install Gazebo Garden simulator
set -e

echo "Installing Gazebo Garden..."

# Use sudo if not running as root
SUDO=""
if [ "$(id -u)" != "0" ]; then
    SUDO="sudo"
fi

$SUDO wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] \
  http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" \
  | $SUDO tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null

$SUDO apt-get update
$SUDO apt-get install -y gz-garden

echo "Gazebo Garden installed successfully!"
