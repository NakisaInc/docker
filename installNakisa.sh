#!/bin/bash

# install Nakisa application docker structure
cd /nakisa/app
sudo git clone -b 2DiskFormation https://github.com/NakisaInc/docker.git .
cd /nakisa/app/hanelly/ssl
sudo docker login -u devopsnakisa -p nakisa.1
echo ""
echo "################################################################################"
echo ""
echo "#Application directory is populated and ready for docker-compose"
echo "#Now is a good time to take a Docker Container Startup Ready system snapshot (AWS AMI), before starting the containers."
echo ""
echo "#Please modify the memory settings in the docker-compose.yml file if you need to and run the following commands:"
echo "cd /nakisa/app/hanelly/ssl"
echo ""
echo "# start all docker containers"
echo "sudo docker-compose up -d"
echo ""
echo "# check that all docker containers have instantiated correctly"
echo "sudo docker ps"
echo ""
echo "# Go to the URL of the application to ensure it is working correctly"



