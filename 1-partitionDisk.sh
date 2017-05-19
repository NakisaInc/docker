#!/bin/bash

# label application disk
sudo parted -s /dev/xvdb mklabel gpt
sudo parted -s /dev/xvdc mklabel gpt
 
# --align optimal: http://unix.stackexchange.com/a/49274/16704
# make xvdb 100% (of 16GB) for /swap, 
sudo parted -s --align optimal /dev/xvdb mkpart primary linux-swap 0% 100%
 
# make xvdc1 16GB for /tmp and xvdc2 the rest of available application disk space for /nakisa
sudo parted -s --align optimal /dev/xvdc mkpart primary ext4 0% 16GB
sudo parted -s --align optimal /dev/xvdc mkpart primary ext4 16GB 100%
 
# ext4 them all
sudo mkswap /dev/xvdb1
sudo swapon /dev/xvdb1
sudo mkfs.ext4 /dev/xvdc1
sudo mkfs.ext4 /dev/xvdc2
 
# make /nakisa directory
sudo mkdir /nakisa

# https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/3/html/System_Administration_Guide/s1-swap-adding.html
# ensure the following lines is present in etc/fstab file and append next four
#LABEL=cloudimg-rootfs   /   ext4    defaults,discard    0   0
cat /etc/fstab > ~/appendedFile
echo "/dev/xvdb1  swap    swap    defaults    0   0" >> ~/appendedFile
echo "/dev/xvdc1  /tmp    ext4    defaults    0   0" >> ~/appendedFile
echo "/dev/xvdc2  /nakisa ext4    defaults    0   0" >> ~/appendedFile
sudo mv ~/appendedFile /etc/fstab

# mount all volumes and swap
sudo mount -a
 
# set permissions for /tmp access
sudo chmod 777 /tmp
