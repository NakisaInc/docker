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
