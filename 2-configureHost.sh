#!/bin/bash

# Set ceiling for number of open files to maximum allowed by system
# https://underyx.me/2015/05/18/raising-the-maximum-number-of-file-descriptors
cat /etc/security/limits.conf > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Set ceiling for maximum nunmber of open files for root and all other users" >> ~/appendedFile
echo "# cat /proc/sys/fs/file-max returns the max possible ceiling for the system" >> ~/appendedFile
echo "# although if you use too high a number it will ignore it - not sure why" >> ~/appendedFile
echo "*    soft nofile 65536" >> ~/appendedFile
echo "*    hard nofile 65536" >> ~/appendedFile
echo "root soft nofile 65536" >> ~/appendedFile
echo "root hard nofile 65536" >> ~/appendedFile
sudo mv ~/appendedFile /etc/security/limits.conf

cat /etc/pam.d/common-session  > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Ensure OS ceiling for number of open files is set for each session" >> ~/appendedFile
echo "session required pam_limits.so" >> ~/appendedFile
sudo mv ~/appendedFile /etc/pam.d/common-session

cat /etc/pam.d/common-session-noninteractive > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Ensure OS ceiling for number of open files is set for each session" >> ~/appendedFile
echo "session required pam_limits.so" >> ~/appendedFile
sudo mv ~/appendedFile /etc/pam.d/common-session-noninteractive

cat /etc/sysctl.conf > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Set ceiling for number of open files to maximum allowed by system" >> ~/appendedFile
echo "fs.file-max = 65536" >> ~/appendedFile
sudo mv ~/appendedFile /etc/sysctl.conf
# set for running os just in case
sudo sysctl -w fs.file-max=65536

# Increase Elastic Search virtual memory
# https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html
cat /etc/sysctl.conf > ~/appendedFile
echo "" >> ~/appendedFile
echo "# Set Elastic Search virtual memory and preserve setting over reboot" >> ~/appendedFile
echo "vm.max_map_count = 262144" >> ~/appendedFile
sudo mv ~/appendedFile /etc/sysctl.conf
# set for running os just in case
sudo sysctl -w vm.max_map_count=262144
