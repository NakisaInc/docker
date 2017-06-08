#!/bin/bash

# install Nakisa application docker structure
cd /nakisa/app
sudo git clone -b Hanelly-${NAK_RELEASE_TAG} https://github.com/NakisaInc/docker.git .

# create required host directories to persist data and logs
cd /nakisa/app/hanelly
sudo mkdir apache-shib; sudo mkdir apache-logs;
sudo mkdir mysql-data
sudo mkdir redis-data;  sudo mkdir redis-logs;               # 3.0.0 CR solution only, deprecated subsequently
sudo mkdir es-data;     sudo mkdir es-logs;
sudo mkdir idocs-data;  sudo mkdir idocs-logs;
sudo mkdir bnr-data;    sudo mkdir bnr-logs;    sudo mkdir bnr-storage;
sudo mkdir tm-logs
sudo mkdir grafana

# log into docker
sudo docker login -u ${NAK_DOCKER_ID} -p ${NAK_DOCKER_PW}

# download all application specific docker images for all 3.0.x solutions
sudo docker swarm init
sudo docker pull nakisa/apache:2.4-shib                      # based off Apache 2.4.25
sudo docker pull nginx:1.11.5
sudo docker pull nakisa/hanelly:3.0.0
sudo docker pull nakisa/hanelly:3.0.1-snapshot
sudo docker pull mysql:5.7
sudo docker pull redis:3.2.8
sudo docker pull elasticsearch:5.2.0
sudo docker pull nakisa/tools:idoc-listener-1.0.0
sudo docker pull nakisa/tools:idoc-listener-1.1.0-snapshot
sudo docker pull nakisa/tools:backup-management-1.0.0
sudo docker pull nakisa/tools:task-manager-1.0.0
sudo docker pull google/cadvisor:v0.25.0
sudo docker pull prom/mysqld-exporter:v0.10.0
sudo docker pull prom/prometheus:v1.6.0
sudo docker pull grafana/grafana:4.2.0
