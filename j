#!/bin/bash

# to get this installation script:
# wget -O - https://raw.githubusercontent.com/NakisaInc/docker/Hanelly-3.0/formHost.sh | sudo bash

# persist Nakisa environemental variables across reboot
set | grep NAK >> ~/.bashrc
set | grep NAK >> ~/.profile
echo 'Persisting NAK_ environmental variables over reboot'
tail ~/.bashrc
tail ~/.profile
