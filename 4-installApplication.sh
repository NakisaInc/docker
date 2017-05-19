#!/bin/bash

# install Nakisa application docker structure
# add more directories for component logs and JVM working dirs as they are defined/found
cd /nakisa/app
sudo git clone -b Hanelly-3.0.0-CR https://github.com/NakisaInc/docker.git .
cd /nakisa/app/hanelly
sudo mkdir mysql-data
sudo mkdir redis-data; sudo mkdir redis-logs;
sudo mkdir es-data;    sudo mkdir es-logs;
sudo mkdir idocs-data; sudo mkdir idocs-logs;
sudo mkdir bnr-data;   sudo mkdir bnr-logs;   sudo mkdir bnr-storage;
sudo mkdir tm-logs
sudo mkdir grafana

# download all application specific docker images
sudo docker login -u devopsnakisa -p nakisa.1
sudo docker swarm init
sudo docker pull nginx:1.11.5
sudo docker pull nakisa/hanelly:3.0.0
sudo docker pull mysql:5.7
sudo docker pull redis:3.2.8
sudo docker pull elasticsearch:5.2.0
sudo docker pull nakisa/tools:idoc-listener-1.0.0
sudo docker pull nakisa/tools:backup-management
sudo docker pull nakisa/tools:task-manager
sudo docker pull google/cadvisor:v0.25.0
sudo docker pull prom/mysqld-exporter:v0.10.0
sudo docker pull prom/prometheus:v1.6.0
sudo docker pull grafana/grafana:4.2.0
