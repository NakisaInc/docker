#!/bin/bash

# to get this installation script:
# wget -O - https://raw.githubusercontent.com/NakisaInc/docker/master/formHost.sh | sudo bash

# install git
sudo apt-get install -y --no-install-recommends git
 
# create /nakisaInstaller application directory and download the installer
sudo mkdir /nakisaInstaller; cd /nakisaInstaller
sudo git clone https://github.com/NakisaInc/docker.git .

# partition disk (applicaton agnostic)
sudo bash ./1-partitionDisk.sh
 
# configure host (applicaton agnostic)
sudo bash ./2-configureHost.sh

# install docker service (applicaton agnostic)
sudo bash ./3-installDocker.sh

# provide next steps to user
echo '# log into docker'
echo 'sudo docker login -u <docker-userid> -p <docker-password>'
echo ''
echo '# install applicaton specific docker structure and images - will perform reboot when done'
echo 'sudo bash ./installApplication.sh'


