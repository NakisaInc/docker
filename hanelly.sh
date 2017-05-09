#!/bin/bash

cd ~
 
mkdir nakisa
 
cd nakisa
 
git clone -b app3_2 https://github.com/NakisaInc/docker.git .
 
sudo bash ./installdocker.sh
 
cd hanelly/nossl/

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
          _______  _        _______  _        _             
|\     /|(  ___  )( (    /|(  ____ \( \      ( \   |\     /|
| )   ( || (   ) ||  \  ( || (    \/| (      | (   ( \   / )
| (___) || (___) ||   \ | || (__    | |      | |    \ (_) / 
|  ___  ||  ___  || (\ \) ||  __)   | |      | |     \   /  
| (   ) || (   ) || | \   || (      | |      | |      ) (   
| )   ( || )   ( || )  \  || (____/\| (____/\| (____/\| |   
|/     \||/     \||/    )_)(_______/(_______/(_______/\_/   
                                                            
Switch to application by running:
cd ~/nakisa/hanelly/nossl/

Please get credentials from Nakisa support. 
Then login to docker hub using:
sudo docker login

Then run Hanelly using:
sudo docker-compose up -d'

