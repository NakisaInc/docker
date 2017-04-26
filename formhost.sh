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
 
# make nakisa app/data/everything directory
sudo mkdir /nakisa
 
# make swap directory
sudo mkdir /swap

# ensure the following 5 lines are present in etc/fstab file by appending update-etc-fstab file
#LABEL=cloudimg-rootfs   /   ext4    defaults,discard    0   0
#/swapfile   none    swap    sw  0   0
#/dev/xvdb1  /tmp    ext4    defaults    0   0
#/dev/xvdb2  /swap   ext4    defaults    0   0
#/dev/xvdb3  /nakisa ext4    defaults    0   0
cat /etc/fstab /nakisaInstaller/update-etc-fstab > ~/fstab_updated
sudo mv ~/fstab_updated /etc/fstab

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
cat /etc/security/limits.conf > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Set ceiling for maximum nunmber of open files for root and all other users" >> /appendedFile
echo "# cat /proc/sys/fs/file-max returns the max possible ceiling for the system" >> /appendedFile
echo "*    soft nofile $(cat /proc/sys/fs/file-max)" >> /appendedFile
echo "*    hard nofile $(cat /proc/sys/fs/file-max)" >> /appendedFile
echo "root soft nofile $(cat /proc/sys/fs/file-max)" >> /appendedFile
echo "root hard nofile $(cat /proc/sys/fs/file-max)" >> /appendedFile
sudo mv ~/appendedFile /etc/security/limits.conf

cat /etc/pam.d/common-session  > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Ensure OS ceiling for number of open files is set for each session" >> /appendedFile
echo "session required pam_limits.so" >> /appendedFile
sudo mv ~/appendedFile /etc/pam.d/common-session

cat /etc/pam.d/common-session-noninteractive > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Ensure OS ceiling for number of open files is set for each session" >> /appendedFile
echo "session required pam_limits.so" >> /appendedFile
sudo mv ~/appendedFile /etc/pam.d/common-session-noninteractive

cat /etc/sysctl.conf > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Set ceiling for number of open files to maximum allowed by system" >> /appendedFile
echo "fs.file-max = $(cat /proc/sys/fs/file-max)" >> /appendedFile
sudo mv ~/appendedFile /etc/sysctl.conf


# Setting up Virtual Memory for Elastic Search
# https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html
# update /etc/sysctl.conf file
cat /etc/sysctl.conf /nakisaInstaller/update-etc-sysctl.conf > ~/sysctl.conf_updated
sudo mv ~/sysctl.conf_updated /etc/sysctl.conf

cat /etc/sysctl.conf > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Set Elastic Search virtual memory to preserve setting over reboot" >> /appendedFile
echo "fvm.max_map_count = 262144" >> /appendedFile
sudo mv ~/appendedFile /etc/sysctl.conf





