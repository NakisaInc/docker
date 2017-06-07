#!/bin/bash

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
# Installation Type Specific                             #
#                                                        #
# Only uncomment the required installation type          #
#                                                        #
# Make any necessary changes for                         #
#  - docker credentials                                  #
#  - memory allocations                                  #
#  - apache config                                       #
#  - stack file                                          #
#  - docker images                                       #
#  - mysql passwords                                     #
#                                                        #
#                                                        #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++#

#=============================================#
# Demo HTTP                                   #
#=============================================#
# export NAK_DOCKR_ID="<docker-login-id>"
# export NAK_DOCKR_PW="<docker-login-pw>"

# export NAK_APACHE_CONF="hanelly-nossl.conf"
# export NAK_STACK_FILE="ds-demo-http.yml"

# export NAK_HANELLY_MEM_ALLOC="-Xms1536m -Xmx1536m"
# export NAK_ES_MEM_ALLOC="-Xms1536m -Xmx1536m"

# export NAK_HANELLY_IMG_TAG="3.0.1-snapshot"
# export NAK_IDOC_IMG_TAG="idoc-listener-1.1.0-snapshot"
# export NAK_BACREC_IMG_TAG="backup-management-1.0.0"
# export NAK_TASKMGR_IMG_TAG="task-manager-1.0.0"
# export NAK_APACSHIB_IMG_TAG="2.4-shib"
# export NAK_MYSQL_ROOT_PASSWORD="hanelly"
# export NAK_MYSQL_PASSWORD="hanelly"

#=============================================#
# DEMO HTTPS                                  #
#=============================================#

# export NAK_DOCKR_ID="<docker-login-id>"
# export NAK_DOCKR_PW="<docker-login-pw>"

# export NAK_APACHE_CONF="hanelly-ssl.conf"
# export NAK_STACK_FILE="ds-demo-https.yml"

# export NAK_HANELLY_MEM_ALLOC="-Xms1536m -Xmx1536m"
# export NAK_ES_MEM_ALLOC="-Xms1536m -Xmx1536m"

# export NAK_HANELLY_IMG_TAG="3.0.1-snapshot"
# export NAK_IDOC_IMG_TAG="idoc-listener-1.1.0-snapshot"
# export NAK_BACREC_IMG_TAG="backup-management-1.0.0"
# export NAK_TASKMGR_IMG_TAG="task-manager-1.0.0"
# export NAK_APACSHIB_IMG_TAG="2.4-shib"
# export NAK_MYSQL_ROOT_PASSWORD="hanelly"
# export NAK_MYSQL_PASSWORD="hanelly"

#=============================================#
# Training                                    #
#=============================================#

# export NAK_DOCKR_ID="<docker-login-id>"
# export NAK_DOCKR_PW="<docker-login-pw>"

# export NAK_APACHE_CONF="hanelly-nossl.conf"
# export NAK_STACK_FILE="ds-training.yml"

# export NAK_HANELLY_MEM_ALLOC="-Xms3g -Xmx3g"
# export NAK_ES_MEM_ALLOC="-Xms3584m -Xmx3584m"

# export NAK_HANELLY_IMG_TAG="3.0.1-snapshot"
# export NAK_IDOC_IMG_TAG="idoc-listener-1.1.0-snapshot"
# export NAK_BACREC_IMG_TAG="backup-management-1.0.0"
# export NAK_TASKMGR_IMG_TAG="task-manager-1.0.0"
# export NAK_APACSHIB_IMG_TAG="2.4-shib"
# export NAK_MYSQL_ROOT_PASSWORD="hanelly"
# export NAK_MYSQL_PASSWORD="hanelly"

#=============================================#
# X-SMALL-Unmonitored                         #
#=============================================#

# export NAK_DOCKR_ID="<docker-login-id>"
# export NAK_DOCKR_PW="<docker-login-pw>"

# export NAK_APACHE_CONF="hanelly-ssl.conf"
# export NAK_STACK_FILE="ds-xsmall-no-mon.yml"

# export NAK_HANELLY_MEM_ALLOC="-Xms2560m -Xmx2560g"
# export NAK_ES_MEM_ALLOC="-Xms3g -Xmx3g"

# export NAK_HANELLY_IMG_TAG="3.0.1-snapshot"
# export NAK_IDOC_IMG_TAG="idoc-listener-1.1.0-snapshot"
# export NAK_BACREC_IMG_TAG="backup-management-1.0.0"
# export NAK_TASKMGR_IMG_TAG="task-manager-1.0.0"
# export NAK_APACSHIB_IMG_TAG="2.4-shib"
# export NAK_MYSQL_ROOT_PASSWORD="hanelly"
# export NAK_MYSQL_PASSWORD="hanelly"


#=============================================#
# X-small Monitored                           #
#=============================================#

# export NAK_DOCKR_ID="<docker-login-id>"
# export NAK_DOCKR_PW="<docker-login-pw>"

# export NAK_APACHE_CONF="hanelly-ssl.conf"
# export NAK_STACK_FILE="ds-Apache-tagged.yml"

# export NAK_HANELLY_MEM_ALLOC="-Xms2g -Xmx2g"
# export NAK_ES_MEM_ALLOC="-Xms2560m -Xmx2560m"

# export NAK_HANELLY_IMG_TAG="3.0.1-snapshot"
# export NAK_IDOC_IMG_TAG="idoc-listener-1.1.0-snapshot"
# export NAK_BACREC_IMG_TAG="backup-management-1.0.0"
# export NAK_TASKMGR_IMG_TAG="task-manager-1.0.0"
# export NAK_APACSHIB_IMG_TAG="2.4-shib"
# export NAK_MYSQL_ROOT_PASSWORD="hanelly"
# export NAK_MYSQL_PASSWORD="hanelly"

#=============================================#
# SMALL                                       #
#=============================================#

# export NAK_DOCKR_ID="<docker-login-id>"
# export NAK_DOCKR_PW="<docker-login-pw>"

# export NAK_APACHE_CONF="hanelly-ssl.conf"
# export NAK_STACK_FILE="ds-Apache-tagged.yml"

# export NAK_HANELLY_MEM_ALLOC="-Xms5g -Xmx5g"
# export NAK_ES_MEM_ALLOC="-Xms5g -Xmx5g"

# export NAK_HANELLY_IMG_TAG="3.0.1-snapshot"
# export NAK_IDOC_IMG_TAG="idoc-listener-1.1.0-snapshot"
# export NAK_BACREC_IMG_TAG="backup-management-1.0.0"
# export NAK_TASKMGR_IMG_TAG="task-manager-1.0.0"
# export NAK_APACSHIB_IMG_TAG="2.4-shib"
# export NAK_MYSQL_ROOT_PASSWORD="hanelly"
# export NAK_MYSQL_PASSWORD="hanelly"

#=============================================#
# MEDIUM                                      #
#=============================================#
# export NAK_DOCKR_ID="<docker-login-id>"
# export NAK_DOCKR_PW="<docker-login-pw>"

# export NAK_APACHE_CONF="hanelly-ssl.conf"
# export NAK_STACK_FILE="ds-Apache-tagged.yml"

# export NAK_HANELLY_MEM_ALLOC="-Xms10g -Xmx10g"
# export NAK_ES_MEM_ALLOC="-Xms10g -Xmx10g"

# export NAK_HANELLY_IMG_TAG="3.0.1-snapshot"
# export NAK_IDOC_IMG_TAG="idoc-listener-1.1.0-snapshot"
# export NAK_BACREC_IMG_TAG="backup-management-1.0.0"
# export NAK_TASKMGR_IMG_TAG="task-manager-1.0.0"
# export NAK_APACSHIB_IMG_TAG="2.4-shib"
# export NAK_MYSQL_ROOT_PASSWORD="hanelly"
# export NAK_MYSQL_PASSWORD="hanelly"

#=============================================#
# LARGE
#=============================================#
# export NAK_DOCKR_ID="<docker-login-id>"
# export NAK_DOCKR_PW="<docker-login-pw>"

# export NAK_APACHE_CONF="hanelly-ssl.conf"
# export NAK_STACK_FILE="ds-Apache-tagged.yml"

# export NAK_HANELLY_MEM_ALLOC="-Xms22g -Xmx22g"
# export NAK_ES_MEM_ALLOC="-Xms26g -Xmx26g"

# export NAK_HANELLY_IMG_TAG="3.0.1-snapshot"
# export NAK_IDOC_IMG_TAG="idoc-listener-1.1.0-snapshot"
# export NAK_BACREC_IMG_TAG="backup-management-1.0.0"
# export NAK_TASKMGR_IMG_TAG="task-manager-1.0.0"
# export NAK_APACSHIB_IMG_TAG="2.4-shib"
# export NAK_MYSQL_ROOT_PASSWORD="hanelly"
# export NAK_MYSQL_PASSWORD="hanelly"

##############################################################
#              NO CHANGES BEYOND This                        #
##############################################################

cd /nakisa/app
sudo git clone https://github.com/NakisaInc/docker.git .
cd /nakisa/app/hanelly
# setup required directories
sudo mkdir apache-shib; sudo mkdir apache-logs;
sudo mkdir mysql-data
sudo mkdir es-data;     sudo mkdir es-logs;
sudo mkdir idocs-data;  sudo mkdir idocs-logs;
sudo mkdir bnr-data;    sudo mkdir bnr-logs;    sudo mkdir bnr-storage;
sudo mkdir tm-logs
sudo mkdir grafana

#login to docker hub
sudo docker login -u ${NAK_DOCKR_ID} -p ${NAK_DOCKR_PW}

#initialize swarm
sudo docker swarm init

# check for updated images
sudo docker pull nakisa/tools:${NAK_IDOC_IMG_TAG}
sudo docker pull nakisa/tools:${NAK_BACREC_IMG_TAG}
sudo docker pull nakisa/tools:${NAK_TASKMGR_IMG_TAG}
sudo docker pull nakisa/hanelly:${NAK_HANELLY_IMG_TAG}
sudo docker pull nakisa/apache:${NAK_APACSHIB_IMG_TAG}

# pick the right stack file template
sudo cp /nakisa/app/hanelly/${NAK_STACK_FILE} /nakisa/app/hanelly/ds-hanelly.yml

# set memory allocations
sudo sed -i "s/\${NAK_HANELLY_MEM_ALLOC}/${NAK_HANELLY_MEM_ALLOC}/g" /nakisa/app/hanelly/ds-hanelly.yml
sudo sed -i "s/\${NAK_ES_MEM_ALLOC}/${NAK_ES_MEM_ALLOC}/g" /nakisa/app/hanelly/ds-hanelly.yml

# set docker image tags
sudo sed -i "s/\${NAK_APACSHIB_IMG_TAG}/${NAK_APACSHIB_IMG_TAG}/g" /nakisa/app/hanelly/ds-hanelly.yml
sudo sed -i "s/\${NAK_HANELLY_IMG_TAG}/${NAK_HANELLY_IMG_TAG}/g" /nakisa/app/hanelly/ds-hanelly.yml
sudo sed -i "s/\${NAK_IDOC_IMG_TAG}/${NAK_IDOC_IMG_TAG}/g" /nakisa/app/hanelly/ds-hanelly.yml
sudo sed -i "s/\${NAK_BACREC_IMG_TAG}/${NAK_BACREC_IMG_TAG}/g" /nakisa/app/hanelly/ds-hanelly.yml
sudo sed -i "s/\${NAK_TASKMGR_IMG_TAG}/${NAK_TASKMGR_IMG_TAG}/g" /nakisa/app/hanelly/ds-hanelly.yml

# set mysql passwords
sudo sed -i "s/\${NAK_MYSQL_ROOT_PASSWORD}/${NAK_MYSQL_ROOT_PASSWORD}/g" /nakisa/app/hanelly/ds-hanelly.yml
sudo sed -i "s/\${NAK_MYSQL_PASSWORD}/${NAK_MYSQL_PASSWORD}/g" /nakisa/app/hanelly/ds-hanelly.yml

# copy the selected apache config
sudo cp /nakisa/app/hanelly/apache-conf/configs/${NAK_APACHE_CONF} /nakisa/app/hanelly/apache-conf/hanelly.conf
# copy ssl certificate
sudo cp ~/temp1 /nakisa/app/hanelly/apache-ssl/cert.key

# deploy docker stack
sudo docker stack deploy -c /nakisa/app/hanelly/ds-hanelly.yml NHAN
