#!/bin/bash
NAK_PARTITION_DISKS=$1

# to get and run this installation script:
# wget -O - https://raw.githubusercontent.com/NakisaInc/docker/Hanelly-3.0/formHost.sh > ~/formHost.sh
# . ~/formHost.sh partition3Disks                   # AWS 3-disk host formation
# . ~/formHost.sh asIs                              # use host with as is disk partitions

# persist Nakisa environemental variables across reboot
set | grep NAK >> ~/.bashrc
set | grep NAK >> ~/.profile
echo 'Persisting NAK_ environmental variables over reboot'

# install git
sudo apt-get install -y --no-install-recommends git
 
# partition disk (applicaton agnostic)
if [ $NAK_PARTITION_DISKS = "partition3Disks" ]
then
  wget -O - https://raw.githubusercontent.com/NakisaInc/docker/Hanelly-3.0/1-partitionDisk.sh > ~/1-partitionDisk.sh
  . ~/1-partitionDisk.sh
  sudo rm ~/1-partitionDisk.sh
else
  sudo mkdir /nakisa
fi

# now that disk is properly partitioned install Nakisa application directory structure
sudo mkdir /nakisa/app; cd /nakisa/app
sudo git clone -b Hanelly-3.0 https://github.com/NakisaInc/docker.git .

# configure host (applicaton agnostic)
. /nakisa/app/2-configureHost.sh

# install docker service (applicaton agnostic)
. /nakisa/app/3-installDocker.sh

# install applicaton specific docker structure and images - will perform reboot when done
. /nakisa/app/4-installApplication.sh

# generate docker stack file based on environment variables
. /nakisa/app/5-generateStackFile.sh

echo '    ............... ....      .......    ............  ...................... ..............     .... .......      ......................   '
echo '   ......................   .........    ....................................................   .............      .......................  '
echo '   ,8MNNDNNO...7NMDNNDO..     .. M?..    . +DMDMD ...... ZDNNMDI:8DDNNNNNNNNNDN:.,8DDNNNM8,.     .~8MNNNNMD~     ..+NNNNDNN=....:8NNDND...  '
echo '   . .ZMM~.    ..:MM: ...    ...8MM ..   ....,:MMM=...    .,M,... .NMM........M~. . OMM=., ..    ... 7MM7 ..     ....,8MM+... ...,=M?. .    '
echo '   ...$MM,.......,MM:...  .. ..:MMMZ ..      ..MMMM?....  .,M..  ..8MM,.......+I.. .ZMM:....    .....?MM=...       ....DMM?.   ..~M .. ...  '
echo '   ...$MM,.......,MM:...  ....,M,IMMI..      ..N$ZMMN ..  .,M.   ..8MM,......,.... .ZMM:. ..    .....?MM=...         ...OMM~....,M~..  .    '
echo '   ...$MM,.      ,MM:.     . .N8  OMM...     ..M$.,MMM~ .. .M  . ..8MM.  . ..D..   .ZMM:.        ... ?MM+...           ..DNM+..~M..         '
echo '   ...7MM=~~~~~~:=MM:.    ..,~N....MMZ...    ..M7...NMM+ . .M  . ..8MM$$7$$ZMD.    .ZMM:.        ... ?MM+...           .  IMM~.M:.          '
echo '   ...7MM,......,:MM:..... .,N. ...IMM?..     .M$ . .OMMN. .M  . ..8MM,.... 7D .   .ZMM:.          . ?MM+...           ... ZMMM....         '
echo '   ...7MM, .    .,MM:.....  MMNMNNNDMMM .     .M$ . ...MMM:,M  . ..8MM,.... .D .....ZMM:.       .... ?MM+...    ...      ...MMD....         '
echo '   ...$MM,. .....,MM:......=D ...... MMZ      .M$.. ....NMM~M    ..8MM,... ..,.... .ZMM:. ......,~...?MM=...   ...:..      .MMN...          '
echo '   ...$MM,. .....,MM:.... ~M...   ..,IMMI.... .M$.. ..  .8MMM    ..8MM,... ....~=...ZMM:. ......I? ..?MM=... ....=$..      .MMN....         '
echo '    ..ZMM~.......:MM~.....MO  .  .... MMM,...  MZ,...  ...:MM......NMM,..... .ZM  ..8MM=.......78....IMM7..... .IM,........,MMM,.....       '
echo '   .78MMMMO7 ..?OMMMMD7,DMMMD7 . ...?DMMMMN=,$NMMO7. . ... .N...,78MMMMMMMMMMMM+  $8MMMMMMMMMMMM: :7NMMMMMMMMMMMM+.......+$MMMMD$, ..       '
echo '    ..      ....            ...   .                ...   .  ...       ....   ......       ...   ...             ...    ....     ..          '
echo '   ......... .................    .  ................    . .  .....................................................    ............         '
echo ''
echo '--------------------------------------------------------------------------------------------------------------------------------------------'
echo '# when reboot completes carry out last steps documented in:'
echo 'cd /nakisa/app; more lastSteps_README'
echo '--------------------------------------------------------------------------------------------------------------------------------------------'

# cleanup temporary installation files and reboot system
sudo rm ~/formHost.sh
sudo reboot


