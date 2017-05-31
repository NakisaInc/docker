#!/bin/bash

# install Nakisa application docker structure
# add more directories for component logs and JVM working dirs as they are defined/found
cd /nakisa/app
sudo git clone https://github.com/NakisaInc/docker.git .
cd /nakisa/app/hanelly

sudo mkdir apache-data; sudo mkdir apache-logs; sudo mkdir apache-ssl; sudo mkdir apache-shib;
sudo mkdir mysql-data
sudo mkdir redis-data;  sudo mkdir redis-logs;
sudo mkdir es-data;     sudo mkdir es-logs;
sudo mkdir idocs-data;  sudo mkdir idocs-logs;
sudo mkdir bnr-data;    sudo mkdir bnr-logs;    sudo mkdir bnr-storage;
sudo mkdir tm-logs
sudo mkdir grafana

sudo cp -rn apache/* apache-data; sudo rm -rf apache

# download all application specific docker images
sudo docker swarm init
sudo docker pull nakisa/apache:2.4-shib
#sudo docker pull nginx:1.11.5
sudo docker pull nakisa/hanelly:3.0.1-snapshot
sudo docker pull mysql:5.7
sudo docker pull redis:3.2.8
sudo docker pull elasticsearch:5.2.0
sudo docker pull nakisa/tools:idoc-listener-1.1.0-snapshot
sudo docker pull nakisa/tools:backup-management-1.0.0
sudo docker pull nakisa/tools:task-manager-1.0.0
sudo docker pull google/cadvisor:v0.25.0
sudo docker pull prom/mysqld-exporter:v0.10.0
sudo docker pull prom/prometheus:v1.6.0
sudo docker pull grafana/grafana:4.2.0
