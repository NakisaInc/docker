#!/bin/bash

# to get this installation script:
# wget -O - https://raw.githubusercontent.com/NakisaInc/docker/app3_2/formHost.sh | sudo bash

# install git
sudo apt-get install -y --no-install-recommends git
 
# create /nakisaInstaller installer directory and download the installer
sudo mkdir /nakisaInstaller; cd /nakisaInstaller
sudo git clone -b app3_2 https://github.com/NakisaInc/docker.git .

# partition disk
sudo bash ./1-partitionDisk.sh
 
# configure host
sudo bash ./2-configureHost.sh

# install docker service
sudo bash ./3-installDocker.sh

# install Nakisa application docker structure and remove /nakisaInstaller installer directory
cd /nakisa/app
sudo git clone -b app3_2 https://github.com/NakisaInc/docker.git .
sudo rm -rf /nakisaInstaller

# reboot system
sudo reboot
