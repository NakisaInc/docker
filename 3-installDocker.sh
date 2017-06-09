#!/bin/bash

# symlink docker to /nakisa/docker-data so that all docker volumes are on /nakisa
sudo mkdir /nakisa/app
sudo mkdir /nakisa/docker-data
sudo ln -s /nakisa/docker-data /var/lib/docker

# install Linux tools and dependencies
sudo apt-get install -y linux-aws linux-headers-aws linux-image-aws
sudo apt-get install -y --no-install-recommends \
    linux-image-$(uname -r) \
    linux-image-extra-virtual \
    apt-transport-https \
    ca-certificates \
    curl \
    unzip \
    htop \
    smem \
    software-properties-common
 
# install docker services
sudo curl -sSL https://get.docker.com/ | sh

