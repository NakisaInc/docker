#!/bin/bash

# to get this installation script:
# wget -O - https://raw.githubusercontent.com/NakisaInc/docker/Hanelly-3.0/formHost.sh | sudo bash

# install git
sudo apt-get install -y --no-install-recommends git
 
# create /nakisaInstaller application directory and download the installer
sudo mkdir /nakisaInstaller; cd /nakisaInstaller
sudo git clone -b Hanelly_3.0 https://github.com/NakisaInc/docker.git .

# partition disk
sudo bash ./1-partitionDisk.sh
 
# configure host
sudo bash ./2-configureHost.sh

# install docker service
sudo bash ./3-installDocker.sh

# reboot system
sudo reboot
