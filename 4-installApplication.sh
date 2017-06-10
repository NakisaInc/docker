#!/bin/bash

# create required host directories to persist data, logs and configurations
sudo mkdir /nakisa/app-volumes
sudo mkdir /nakisa/app-volumes/apache-shib
sudo mkdir /nakisa/app-volumes/apache-conf
sudo mkdir /nakisa/app-volumes/apache-logs
sudo mkdir /nakisa/app-volumes/mysql-data
sudo mkdir /nakisa/app-volumes/redis-data               # 3.0.0 CR solution only, deprecated subsequently
sudo mkdir /nakisa/app-volumes/redis-logs               # 3.0.0 CR solution only, deprecated subsequently
sudo mkdir /nakisa/app-volumes/es-data
sudo mkdir /nakisa/app-volumes/es-logs
sudo mkdir /nakisa/app-volumes/idocs-data
sudo mkdir /nakisa/app-volumes/idocs-logs
#sudo mkdir /nakisa/app-volumes/bnr-data
#sudo mkdir /nakisa/app-volumes/bnr-logs
#sudo mkdir /nakisa/app-volumes/bnr-storage
#sudo mkdir /nakisa/app-volumes/tm-logs
sudo mkdir /nakisa/app-volumes/grafana

# copy out of box Apache config into apache-conf persisted volume
if [ -f "/nakisa/app-volumes/apache-conf/hanelly-ssl.conf" ]
then
  echo "Apache configuration file found: /nakisa/app-volumes/apache-conf/hanelly-ssl.conf will keep it"
else
  echo "Copying Apache configuration files from: /nakisa/app/hanelly/apache-conf-OOB"
  sudo cp -r /nakisa/app/hanelly/apache-conf-OOB/* /nakisa/app-volumes/apache-conf/.
fi

# log into docker
sudo docker login -u ${NAK_DOCKER_ID} -p ${NAK_DOCKER_PW}

# download all application specific docker images for all 3.0.x solutions
sudo docker swarm init
sudo docker pull nakisa/apache:2.4-shib                      # based off Apache 2.4.25
sudo docker pull nginx:1.11.5
sudo docker pull nakisa/hanelly:3.0.0
sudo docker pull nakisa/hanelly:3.0.1
sudo docker pull nakisa/hanelly:3.0.2-snapshot
sudo docker pull mysql:5.7
sudo docker pull redis:3.2.8
sudo docker pull elasticsearch:5.2.0
sudo docker pull nakisa/tools:idoc-listener-1.0.0
sudo docker pull nakisa/tools:idoc-listener-1.1.0
sudo docker pull nakisa/tools:idoc-listener-1.2.0-snapshot
sudo docker pull nakisa/tools:backup-management-1.0.0
sudo docker pull nakisa/tools:backup-management-1.1.0-snapshot
sudo docker pull nakisa/tools:task-manager-1.0.0
sudo docker pull nakisa/tools:task-manager-1.1.0-snapshot
sudo docker pull google/cadvisor:v0.25.0
sudo docker pull prom/mysqld-exporter:v0.10.0
sudo docker pull prom/prometheus:v1.6.0
sudo docker pull grafana/grafana:4.2.0

# copy private key into Apache and NGINX folders
sudo cp ~/cert.key /nakisa/app/hanelly/apache-ssl
sudo cp ~/cert.key /nakisa/app/hanelly/nginx
