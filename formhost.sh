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
 
# make swap directory
sudo mkdir /swap

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
 
# Set ceiling for number of open files to maximum allowed by system
# https://underyx.me/2015/05/18/raising-the-maximum-number-of-file-descriptors
cat /etc/security/limits.conf > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Set ceiling for maximum nunmber of open files for root and all other users" >> ~/appendedFile
echo "# cat /proc/sys/fs/file-max returns the max possible ceiling for the system" >> ~/appendedFile
echo "*    soft nofile $(cat /proc/sys/fs/file-max)" >> ~/appendedFile
echo "*    hard nofile $(cat /proc/sys/fs/file-max)" >> ~/appendedFile
echo "root soft nofile $(cat /proc/sys/fs/file-max)" >> ~/appendedFile
echo "root hard nofile $(cat /proc/sys/fs/file-max)" >> ~/appendedFile
sudo mv ~/appendedFile /etc/security/limits.conf

cat /etc/pam.d/common-session  > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Ensure OS ceiling for number of open files is set for each session" >> ~/appendedFile
echo "session required pam_limits.so" >> ~/appendedFile
sudo mv ~/appendedFile /etc/pam.d/common-session

cat /etc/pam.d/common-session-noninteractive > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Ensure OS ceiling for number of open files is set for each session" >> ~/appendedFile
echo "session required pam_limits.so" >> ~/appendedFile
sudo mv ~/appendedFile /etc/pam.d/common-session-noninteractive

cat /etc/sysctl.conf > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Set ceiling for number of open files to maximum allowed by system" >> ~/appendedFile
echo "fs.file-max = $(cat /proc/sys/fs/file-max)" >> ~/appendedFile
sudo mv ~/appendedFile /etc/sysctl.conf

# Increase Elastic Search virtual memory
# https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html
cat /etc/sysctl.conf > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Set Elastic Search virtual memory and preserve setting over reboot" >> ~/appendedFile
echo "vm.max_map_count = 262144" >> ~/appendedFile
sudo mv ~/appendedFile /etc/sysctl.conf

# make nakisa app/data/everything directory
sudo mkdir /nakisa

# Reboot system
sudo reboot





