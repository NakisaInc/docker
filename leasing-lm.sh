#!/bin/bash

cd ~
 
mkdir nakisa
 
cd nakisa
 
git clone https://github.com/NakisaInc/docker.git .
 
sudo bash ./installdocker.sh

clear

echo '
 _        _______  _       _________ _______  _______ 
( (    /|(  ___  )| \    /\\__   __/(  ____ \(  ___  )
|  \  ( || (   ) ||  \  / /   ) (   | (    \/| (   ) |
|   \ | || (___) ||  (_/ /    | |   | (_____ | (___) |
| (\ \) ||  ___  ||   _ (     | |   (_____  )|  ___  |
| | \   || (   ) ||  ( \ \    | |         ) || (   ) |
| )  \  || )   ( ||  /  \ \___) (___/\____) || )   ( |
|/    )_)|/     \||_/    \/\_______/\_______)|/     \|
                                                      
       _______  _        _______  _                   
      (  ____ \( \      (  ___  )( (    /|            
      | (    \/| (      | (   ) ||  \  ( |            
      | (_____ | |      | (___) ||   \ | |            
      (_____  )| |      |  ___  || (\ \) |            
            ) || |      | (   ) || | \   |            
      /\____) || (____/\| )   ( || )  \  |            
      \_______)(_______/|/     \||/    )_)            
                                                                                                                  
Switch to application by running:
cd ~/nakisa/leasing/nossl-low-mem/
																												  
Please get credentials from Nakisa support. 
Then login to docker hub using:
sudo docker login

Then run SLAN using:
sudo docker-compose up -d'

