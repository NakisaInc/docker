#!/bin/bash

# symlink docker to /nakisa/docker-data so that all docker volumes are on /nakisa
sudo mkdir /nakisa/app
sudo mkdir /nakisa/docker-data
sudo ln -s /nakisa/docker-data /var/lib/docker

# install Linux tools and dependencies
sudo apt-get update
sudo apt-get install -y linux-aws linux-headers-aws linux-image-aws
sudo apt-get install -y --no-install-recommends \
    linux-image-$(uname -r) \
    linux-image-extra-virtual \
    apt-transport-https \
    ca-certificates \
    curl \
    unzip \
	htop \
    software-properties-common
 
curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
sudo apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D

sudo add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"
  
# can we use below to replace docker-engine and docker-compose?
#curl -sSL https://get.docker.com/ | sh

# for some reasons need to do apt-get update again otherwise docker-engine install fails 
sudo apt-get update
sudo apt-get install -y docker-engine
sudo curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version
