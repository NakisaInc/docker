#!/bin/bash

# label application disk
sudo parted -s /dev/xvdb mklabel gpt
 
# --align optimal: http://unix.stackexchange.com/a/49274/16704
# make xvdb1, xvdb2  16GB each
sudo parted -s --align optimal /dev/xvdb mkpart primary ext4 0% 16GB
sudo parted -s --align optimal /dev/xvdb mkpart primary ext4 16GB 32GB
 
# make xvdb3 the rest of available application disk space
sudo parted -s --align optimal /dev/xvdb mkpart primary ext4 32GB 100%
 
# ext4 them all
sudo mkfs.ext4 /dev/xvdb1
sudo mkfs.ext4 /dev/xvdb2
sudo mkfs.ext4 /dev/xvdb3
 
# make /swap and /nakisa directories
sudo mkdir /swap
sudo mkdir /nakisa

# ensure the following lines is present in etc/fstab file and append next four
#LABEL=cloudimg-rootfs   /   ext4    defaults,discard    0   0
cat /etc/fstab > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Set ceiling for maximum nunmber of open files for root and all other users" >> /appendedFile
echo "/swapfile   none    swap    sw  0   0" >> ~/appendedFile
echo "/dev/xvdb1  /tmp    ext4    defaults    0   0" >> ~/appendedFile
echo "/dev/xvdb2  /swap   ext4    defaults    0   0" >> ~/appendedFile
echo "/dev/xvdb3  /nakisa ext4    defaults    0   0" >> ~/appendedFile
sudo mv ~/appendedFile /etc/fstab

# mount all volumes and swap
sudo mount -a
 
# Create swap file
# sudo fallocate -l 16G /swap/swapfile (exact byte number was obtained from system when trying to allocate too much)
sudo fallocate -l 15558914048 /swap/swapfile
 
# ensure swapfile is accessible to root only
sudo chmod 600 /swap/swapfile
 
# make swap
sudo mkswap /swap/swapfile
 
# enable swap
sudo swapon /swap/swapfile
 
# set permissions for /tmp access
sudo chmod 777 /tmp






