#!/bin/bash

# partition disk
sudo bash ./1-partitionDisk.sh
 
# configure host
sudo bash ./2-configureHost.sh

# install docker service
sudo bash ./3-installDocker.sh

# reboot system
sudo reboot
