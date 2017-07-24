#!/bin/bash

# create required host directories to persist data, logs and configurations
sudo mkdir /nakisa/app-volumes
sudo mkdir /nakisa/app-volumes/apache-www
sudo mkdir /nakisa/app-volumes/apache-ssl
sudo mkdir /nakisa/app-volumes/apache-shib
sudo mkdir /nakisa/app-volumes/apache-conf
sudo mkdir /nakisa/app-volumes/apache-logs
sudo mkdir /nakisa/app-volumes/tomcat-logs
sudo mkdir /nakisa/app-volumes/mysql-data
sudo mkdir /nakisa/app-volumes/mysql-logs
sudo mkdir /nakisa/app-volumes/mysql-dump
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
sudo mkdir /nakisa/app-volumes/prometheus-agent         # monitoring PoC only - not for customer use
sudo mkdir /nakisa/app-volumes/prometheus-conf          # monitoring PoC only - not for customer use
sudo mkdir /nakisa/app-volumes/grafana-data             # monitoring PoC only - not for customer use
sudo mkdir /nakisa/app-volumes/grafana-startup          # monitoring PoC only - not for customer use  

# if Apache config present in apache-conf persisted volume then keep it as modification may have been made that are needed (eg. SSO SAML ADFDS support)
if [ -f "/nakisa/app-volumes/apache-conf/hanelly-ssl.conf" ]
then
  echo "Apache configuration file found: /nakisa/app-volumes/apache-conf/hanelly-ssl.conf will keep it"
# if nothing there then copy out of box Apache config into apache-conf persisted volume
else
  echo "Copying Apache configuration files from: /nakisa/app/hanelly/apache-conf-OOB"
  sudo cp -r /nakisa/app/hanelly/Service_OOBConfigs/apache-conf/* /nakisa/app-volumes/apache-conf/.
fi

# copy *.nakisa.cloud certificate into apache-ssl persisted volume
sudo cp -r /nakisa/app/hanelly/Service_OOBConfigs/apache-ssl/* /nakisa/app-volumes/apache-ssl/.

# copy apache maintenance page into apache-www persisted volume
sudo cp -r /nakisa/app/hanelly/Service_OOBConfigs/apache-www/* /nakisa/app-volumes/apache-www/.

# copy OOB configs and dependencies for monitoring solution to persisted volumes
sudo cp -r /nakisa/app/hanelly/Service_OOBConfigs/prometheus-agent/* /nakisa/app-volumes/prometheus-agent/.
sudo cp -r /nakisa/app/hanelly/Service_OOBConfigs/prometheus-conf/*  /nakisa/app-volumes/prometheus-conf/.
sudo cp -r /nakisa/app/hanelly/Service_OOBConfigs/grafana-startup/*  /nakisa/app-volumes/grafana-startup/.

# log into docker
sudo docker login -u ${NAK_DOCKER_ID} -p ${NAK_DOCKER_PW}

# download all application specific docker images for all 3.0.x solutions
sudo docker swarm init
sudo docker pull nakisa/apache:2.4-shib                      # based off Apache 2.4.25
sudo docker pull nginx:1.11.5
sudo docker pull nakisa/hanelly:3.0.0
sudo docker pull nakisa/hanelly:3.0.1
sudo docker pull nakisa/hanelly:3.0.2
sudo docker pull nakisa/hanelly:3.0.3
sudo docker pull nakisa/hanelly:3.0.4
sudo docker pull nakisa/hanelly:3.0.5
sudo docker pull nakisa/hanelly:3.0.6
sudo docker pull nakisa/hanelly:3.0.4-snapshot
sudo docker pull nakisa/hanelly:3.0.5-snapshot
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
#sudo docker pull google/cadvisor:v0.25.0
#sudo docker pull prom/mysqld-exporter:v0.10.0
#sudo docker pull prom/prometheus:v1.6.0
#sudo docker pull grafana/grafana:4.2.0

# copy private key into Apache and NGINX folders
sudo cp ~/cert.key /nakisa/app-volumes/apache-ssl
sudo cp ~/cert.key /nakisa/app/hanelly/nginx
