#!/bin/bash

apt-mark hold libgl1 libglx0 libgles2 libegl1 libglvnd0
mkdir /etc/OpenCL && mkdir /etc/OpenCL/vendors
echo "/usr/lib/aarch64-linux-gnu/libOpenCL.so" | tee /etc/OpenCL/vendors/armocl.icd
apt update && apt install -y htop nano git subversion
fallocate -l 4G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile && echo "/swapfile swap swap defaults 0 0" | tee /etc/fstab

#realsense stuff
git clone https://github.com/IntelRealSense/librealsense.git
cd librealsense && git checkout tags/v2.18.1
#cp config/99-realsense-libusb.rules /etc/udev/rules.d/
#udevadm control --reload-rules && udevadm trigger