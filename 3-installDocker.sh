#!/bin/bash

# symlink docker to /nakisa/docker-data so that all docker volumes are on /nakisa
sudo mkdir /nakisa/app
sudo mkdir /nakisa/docker-data
sudo ln -s /nakisa/docker-data /var/lib/docker

sudo apt-get update
 
sudo apt-get install -y --no-install-recommends \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual
 
sudo apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    unzip \
    software-properties-common
 
curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
 
sudo apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D
 
sudo add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"
 
sudo apt-get update
 
sudo apt-get -y install docker-engine
 
sudo curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
 
sudo chmod +x /usr/local/bin/docker-compose
 
sudo docker-compose --version

# install Nakisa application docker structure
cd /nakisa/app
sudo git clone -b Hanelly-3.0 https://github.com/NakisaInc/docker.git .

