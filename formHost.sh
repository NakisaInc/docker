#!/bin/bash

# to get this installation script:
# wget -O - https://raw.githubusercontent.com/NakisaInc/docker/master/formHost.sh | sudo bash

# install git
sudo apt-get install -y --no-install-recommends git
 
# create /nakisaInstaller application directory and download the installer
sudo mkdir /nakisaInstaller; cd /nakisaInstaller
sudo git clone -b Hanelly-${NAK_RELEASE_TAG} https://github.com/NakisaInc/docker.git .

# partition disk (applicaton agnostic)
sudo bash /nakisaInstaller/1-partitionDisk.sh
 
# configure host (applicaton agnostic)
sudo bash /nakisaInstaller/2-configureHost.sh

# install docker service (applicaton agnostic)
sudo bash /nakisaInstaller/3-installDocker.sh

# install applicaton specific docker structure and images - will perform reboot when done
sudo bash /nakisaInstaller/4-installApplication.sh

echo '# when reboot completes complete last steps documented in'
echo 'cd /nakisa/app; more lastSteps_README'

# reboot system
sudo rm -rf /nakisaInstaller
sudo reboot


