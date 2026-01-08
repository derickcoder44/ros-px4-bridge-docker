#!/bin/bash
# Install system dependencies for PX4 and ROS 2
set -e

echo "Installing system dependencies..."

# Use sudo if not running as root
SUDO=""
if [ "$(id -u)" != "0" ]; then
    SUDO="sudo"
fi

$SUDO apt-get update
$SUDO apt-get install -y \
  git \
  python3-pip \
  python-is-python3 \
  build-essential \
  cmake \
  ninja-build \
  protobuf-compiler \
  libeigen3-dev \
  libopencv-dev \
  wget \
  lsb-release \
  gnupg \
  sudo \
  curl \
  vim \
  gdb \
  valgrind \
  astyle \
  lcov \
  libgstreamer-plugins-base1.0-dev \
  gstreamer1.0-plugins-bad \
  gstreamer1.0-plugins-base \
  gstreamer1.0-plugins-good \
  gstreamer1.0-plugins-ugly \
  gstreamer1.0-libav \
  rsync

echo "Installing Python packages..."
pip3 install --no-cache-dir --upgrade pip
pip3 install --no-cache-dir \
  kconfiglib \
  empy==3.3.4 \
  pyros-genmsg \
  jinja2 \
  packaging \
  jsonschema \
  future \
  pyyaml \
  pyserial \
  toml \
  numpy \
  pandas

echo "Dependencies installed successfully!"
