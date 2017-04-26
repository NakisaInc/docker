#!/bin/bash

# install Nakisa application docker structure
cd /nakisa/app
sudo git clone -b 2DiskFormation https://github.com/NakisaInc/docker.git .
cd /nakisa/app/hanelly/ssl
sudo docker login -u devopsnakisa -p nakisa.1
echo "Ready for docker-compose, please modify the memory settings in the docker-compose.yml file if you need to"
echo "then run the following commands:"
echo ""
echo "# start all docker containers"
echo "sudo docker-compose up -d"
echo ""
echo "# check that all docker containers have instantiated correctly"
echo "sudo docker ps"


