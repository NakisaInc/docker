#!/bin/bash
echo 'set docker id/pw environment variables before proceeding using following'
echo 'export NAK_DOCKR_ID="<docker-login-id>"'
echo 'export NAK_DOCKR_PW="<docker-login-pw>"'
read -rsp $'Press CTL+C to abort ...\nPress any key to continnue ...\n' -n 1 key

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

# login to docker
sudo docker login -u ${NAK_DOCKR_ID} -p ${NAK_DOCKR_PW}

# install applicaton specific docker structure and images - will perform reboot when done'
sudo bash ./installApplicationFiles.sh
