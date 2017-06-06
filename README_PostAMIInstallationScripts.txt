#++++++++++++++++++++++++++++++++++++++++++++++++++++++#
# Common                                               #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++#
cd /nakisa/app
sudo git clone https://github.com/NakisaInc/docker.git .
cd /nakisa/app/hanelly

sudo mkdir apache-shib; sudo mkdir apache-logs;
sudo mkdir mysql-data
sudo mkdir redis-data;  sudo mkdir redis-logs;
sudo mkdir es-data;     sudo mkdir es-logs;
sudo mkdir idocs-data;  sudo mkdir idocs-logs;
sudo mkdir bnr-data;    sudo mkdir bnr-logs;    sudo mkdir bnr-storage;
sudo mkdir tm-logs
sudo mkdir grafana

sudo docker swarm init

# check for updated images
sudo docker pull nakisa/tools:idoc-listener-1.0.0
sudo docker pull nakisa/tools:idoc-listener-1.1.0-snapshot
sudo docker pull nakisa/tools:backup-management-1.0.0
sudo docker pull nakisa/tools:task-manager-1.0.0
sudo docker pull nakisa/hanelly:3.0.0
sudo docker pull nakisa/hanelly:3.0.1-snapshot
sudo docker pull nakisa/apache:2.4-shib

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
# Installation Type Specific                             #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#=============================================#
# Demo HTTP                                   #
#=============================================#
sudo cp /nakisa/app/hanelly/apache-conf/configs/hanelly-nossl.conf /nakisa/app/hanelly/apache-conf/hanelly.conf
sudo docker stack deploy -c ds-demo-http.yml NHAN

#=============================================#
# DEMO HTTPS                                  #
#=============================================#
sudo cp /nakisa/app/hanelly/apache-conf/configs/hanelly-ssl.conf /nakisa/app/hanelly/apache-conf/hanelly.conf
sudo mv ~/temp1 /nakisa/app/hanelly/apache-ssl/cert.key
sudo docker stack deploy -c ds-demo-https.yml NHAN
#=============================================#
# Training                                    #
#=============================================#
sudo cp /nakisa/app/hanelly/apache-conf/configs/hanelly-nossl.conf /nakisa/app/hanelly/apache-conf/hanelly.conf
sudo docker stack deploy -c ds-training.yml NHAN

#=============================================#
# X-SMALL-Unmonitored                         #
#=============================================#
sudo cp /nakisa/app/hanelly/apache-conf/configs/hanelly-ssl.conf /nakisa/app/hanelly/apache-conf/hanelly.conf
sudo mv ~/temp1 /nakisa/app/hanelly/apache-ssl/cert.key
sudo docker stack deploy -c ds-xsmall-no-mon.yml NHAN

#=============================================#
# X-small Monitored
#=============================================#

export HANELLY_MEM_ALLOC="-Xms2g -Xmx2g"
export ES_MEM_ALLOC="-Xms2560m -Xmx2560m"

export HANELLY_IMG_TAG="3.0.1-snapshot"
export IDOC_IMG_TAG="idoc-listener-1.1.0-snapshot"
export MYSQL_ROOT_PASSWORD="hanelly"
export MYSQL_PASSWORD="hanelly"

sudo sed -i "s/\${HANELLY_IMG_TAG}/${HANELLY_IMG_TAG}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${HANELLY_MEM_ALLOC}/${HANELLY_MEM_ALLOC}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${ES_MEM_ALLOC}/${ES_MEM_ALLOC}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${IDOC_IMG_TAG}/${IDOC_IMG_TAG}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${MYSQL_ROOT_PASSWORD}/${MYSQL_ROOT_PASSWORD}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${MYSQL_PASSWORD}/${MYSQL_PASSWORD}/g" ds-Apache-tagged.yml

sudo cp /nakisa/app/hanelly/apache-conf/configs/hanelly-ssl.conf /nakisa/app/hanelly/apache-conf/hanelly.conf
sudo mv ~/temp1 /nakisa/app/hanelly/apache-ssl/cert.key
sudo docker stack deploy -c ds-Apache-tagged.yml NHAN

#=============================================#
# SMALL                                       #
#=============================================#
export HANELLY_MEM_ALLOC="-Xms5g -Xmx5g"
export ES_MEM_ALLOC="-Xms5g -Xmx5g"

export HANELLY_IMG_TAG="3.0.1-snapshot"
export IDOC_IMG_TAG="idoc-listener-1.1.0-snapshot"
export MYSQL_ROOT_PASSWORD="hanelly"
export MYSQL_PASSWORD="hanelly"

sudo sed -i "s/\${HANELLY_IMG_TAG}/${HANELLY_IMG_TAG}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${HANELLY_MEM_ALLOC}/${HANELLY_MEM_ALLOC}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${ES_MEM_ALLOC}/${ES_MEM_ALLOC}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${IDOC_IMG_TAG}/${IDOC_IMG_TAG}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${MYSQL_ROOT_PASSWORD}/${MYSQL_ROOT_PASSWORD}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${MYSQL_PASSWORD}/${MYSQL_PASSWORD}/g" ds-Apache-tagged.yml

sudo cp /nakisa/app/hanelly/apache-conf/configs/hanelly-ssl.conf /nakisa/app/hanelly/apache-conf/hanelly.conf
sudo mv ~/temp1 /nakisa/app/hanelly/apache-ssl/cert.key
sudo docker stack deploy -c ds-Apache-tagged.yml NHAN

#=============================================#
# MEDIUM
#=============================================#
export HANELLY_MEM_ALLOC="-Xms10g -Xmx10g"
export ES_MEM_ALLOC= "-Xms10g -Xmx10g"

export HANELLY_IMG_TAG="3.0.1-snapshot"
export IDOC_IMG_TAG="idoc-listener-1.1.0-snapshot"
export MYSQL_ROOT_PASSWORD="hanelly"
export MYSQL_PASSWORD="hanelly"

sudo sed -i "s/\${HANELLY_IMG_TAG}/${HANELLY_IMG_TAG}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${HANELLY_MEM_ALLOC}/${HANELLY_MEM_ALLOC}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${ES_MEM_ALLOC}/${ES_MEM_ALLOC}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${IDOC_IMG_TAG}/${IDOC_IMG_TAG}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${MYSQL_ROOT_PASSWORD}/${MYSQL_ROOT_PASSWORD}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${MYSQL_PASSWORD}/${MYSQL_PASSWORD}/g" ds-Apache-tagged.yml

sudo cp /nakisa/app/hanelly/apache-conf/configs/hanelly-ssl.conf /nakisa/app/hanelly/apache-conf/hanelly.conf
sudo mv ~/temp1 /nakisa/app/hanelly/apache-ssl/cert.key
sudo docker stack deploy -c ds-Apache-tagged.yml NHAN

#=============================================#
# LARGE
#=============================================#
export HANELLY_MEM_ALLOC="-Xms10g -Xmx10g"
export ES_MEM_ALLOC="-Xms10g -Xmx10g"

export HANELLY_IMG_TAG="3.0.1-snapshot"
export IDOC_IMG_TAG="idoc-listener-1.1.0-snapshot"
export MYSQL_ROOT_PASSWORD="hanelly"
export MYSQL_PASSWORD="hanelly"

sudo sed -i "s/\${HANELLY_IMG_TAG}/${HANELLY_IMG_TAG}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${HANELLY_MEM_ALLOC}/${HANELLY_MEM_ALLOC}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${ES_MEM_ALLOC}/${ES_MEM_ALLOC}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${IDOC_IMG_TAG}/${IDOC_IMG_TAG}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${MYSQL_ROOT_PASSWORD}/${MYSQL_ROOT_PASSWORD}/g" ds-Apache-tagged.yml
sudo sed -i "s/\${MYSQL_PASSWORD}/${MYSQL_PASSWORD}/g" ds-Apache-tagged.yml

sudo cp /nakisa/app/hanelly/apache-conf/configs/hanelly-ssl.conf /nakisa/app/hanelly/apache-conf/hanelly.conf
sudo mv ~/temp1 /nakisa/app/hanelly/apache-ssl/cert.key
sudo docker stack deploy -c ds-Apache-tagged.yml NHAN