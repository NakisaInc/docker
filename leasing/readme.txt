****************************************************
for compose after the app ready AMI
****************************************************
sudo wget -O /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/1.14.0/docker-compose-Linux-x86_64

sudo chmod +x /usr/local/bin/docker-compose

cd /nakisa/app
sudo git clone https://github.com/NakisaInc/docker.git .


sudo cp ~/temp1 /nakisa/app/leasing/nginx/cert.key
sudo docker-compose -f /nakisa/app/leasing/docker-compose.yml up -d

**************************************************
for stack after Appready AMI
***************************************************

cd /nakisa/app
sudo git clone https://github.com/NakisaInc/docker.git .

sudo mkdir /nakisa/app/leasing/es
sudo mkdir /nakisa/app/leasing/data
sudo mkdir /nakisa/app/leasing/mysql

sudo cp ~/temp1 /nakisa/app/leasing/nginx/cert.key

sudo docker swarm init

#for elasticsearch:2.4.1 -- NOT FOR 5.2.0
sudo docker pull elasticsearch:2.4.1

sudo docker pull nakisa/leaseadministration:3.2-mysql-standalone-es

#for elasticsearch:2.4.1
sudo docker stack deploy -c /nakisa/app/leasing/docker-stack-es241.yml NSLAN
#for elasticsearch:5.2.0
sudo docker stack deploy -c /nakisa/app/leasing/docker-stack-es520.yml NSLAN

---------------------------------------------
usefull commands for testing stack
--------------------------------------------
#check deployed stack
sudo docker stack ps NSLAN

#check individual service logs
sudo docker service logs NSLAN_elasticsearch
sudo docker service logs NSLAN_slan
sudo docker service logs NSLAN_slandb
sudo docker service logs NSLAN_nginx
#remove stack
sudo docker stack rm NSLAN