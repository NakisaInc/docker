#!/bin/bash

# partition disk
sudo bash ./1-partitionDisk.sh
 
# configure host
sudo bash ./2-configureHost.sh

# install docker service
sudo bash ./3-installDocker.sh

# reboot system
sudo reboot

# instructions for user
echo "Host formation has been completed - you can take an AMI snapshot if you like"
echo "Next step is to install the application:"
echo ""
echo "sudo bash /nakisa/4-installNakisa.sh"
