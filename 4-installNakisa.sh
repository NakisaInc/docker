#!/bin/bash

# install Nakisa application docker structure
cd /nakisa/app
sudo git clone -b 2DiskFormation https://github.com/NakisaInc/docker.git .
cd /nakisa/app/hanelly/ssl
sudo docker login -u devopsnakisa -p nakisa.1
sudo docker-compose up -d
sudo docker ps


