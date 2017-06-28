#!/bin/bash
NAK_PARTITION_DEVICE_PREFIX=$1

# update & upgrade OS (non-interactive)
# https://github.com/shalecraig/vagrant-pebble/blob/master/sources/pebble_vm_provision_as_root.sh
sudo apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes --option Dpkg::Options::="--force-confdef" --option Dpkg::Options::="--force-confold" upgrade
sudo DEBIAN_FRONTEND=noninteractive apt-get --assume-yes --option Dpkg::Options::="--force-confdef" --option Dpkg::Options::="--force-confold" dist-upgrade

# label application disk
sudo parted -s /dev/${NAK_PARTITION_DEVICE_PREFIX}b mklabel gpt
sudo parted -s /dev/${NAK_PARTITION_DEVICE_PREFIX}c mklabel gpt

# --align optimal: http://unix.stackexchange.com/a/49274/16704
# make device b 100% (of 16GB) for /swap,
sudo parted -s --align optimal /dev/${NAK_PARTITION_DEVICE_PREFIX}b mkpart primary linux-swap 0% 100%

# make device c1 16GB for /tmp and device c2 the rest of available application disk space for /nakisa
sudo parted -s --align optimal /dev/${NAK_PARTITION_DEVICE_PREFIX}c mkpart primary ext4 0% 16GB
sudo parted -s --align optimal /dev/x${NAK_PARTITION_DEVICE_PREFIX}c mkpart primary ext4 16GB 100%

# ext4 them all
sudo mkswap /dev/${NAK_PARTITION_DEVICE_PREFIX}b1
sudo swapon /dev/${NAK_PARTITION_DEVICE_PREFIX}b1
sudo mkfs.ext4 /dev/${NAK_PARTITION_DEVICE_PREFIX}c1
sudo mkfs.ext4 /dev/${NAK_PARTITION_DEVICE_PREFIX}c2

# make /nakisa directory
sudo mkdir /nakisa

# https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/3/html/System_Administration_Guide/s1-swap-adding.html
# ensure the following lines is present in etc/fstab file and append next four
#LABEL=cloudimg-rootfs   /   ext4    defaults,discard    0   0
cat /etc/fstab > ~/appendedFile
echo "/dev/${NAK_PARTITION_DEVICE_PREFIX}1  swap    swap    defaults    0   0" >> ~/appendedFile
echo "/dev/${NAK_PARTITION_DEVICE_PREFIX}1  /tmp    ext4    defaults    0   0" >> ~/appendedFile
echo "/dev/${NAK_PARTITION_DEVICE_PREFIX}2  /nakisa ext4    defaults    0   0" >> ~/appendedFile
sudo mv ~/appendedFile /etc/fstab

# mount all volumes and swap
sudo mount -a

# set permissions for /tmp access
sudo chmod 777 /tmp
