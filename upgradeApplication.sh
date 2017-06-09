#!/bin/bash

# Must be logged into docker to execute the below
# sudo docker login -u <docker-userid> -p <docker-password>

# create required host directories to persist data and logs
cd /nakisa/app/hanelly
sudo mkdir apache-shib; sudo mkdir apache-logs;

# download all application specific docker images
sudo docker pull nakisa/apache:2.4-shib                      # based off Apache 2.4.25
sudo docker pull nakisa/hanelly:3.0.0
sudo docker pull nakisa/hanelly:3.0.1
sudo docker pull nakisa/hanelly:3.0.2-snapshot
sudo docker pull nakisa/tools:idoc-listener-1.0.0
sudo docker pull nakisa/tools:idoc-listener-1.1.0
#sudo docker pull nakisa/tools:backup-management-1.0.0
#sudo docker pull nakisa/tools:task-manager-1.0.0

echo '# when reboot completes complete last steps:'
cd /nakisa/app; more lastSteps_README
