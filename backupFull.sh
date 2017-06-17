#!/bin/bash 

# stop user access to Hanelly
#
#

# Set environemental variables to identify the directories to be backed up
#
# Hanelly 2.2 directories - may be different per installation
NAK_BACKUP_HANELLY_DIRECTORY=/opt/tomcat/webapps/hanelly
NAK_BACKUP_TOMCAT_LOGS_DIRECTORY=/opt/tomcat/logs
NAK_BACKUP_MYSQL_DIRECTORY=/nakisa/mysql
NAK_BACKUP_APACHE_SHIB_DIRECTORY=/nakisa/app/hanelly/apache-shib
NAK_BACKUP_APACHE_CONF_DIRECTORY=/nakisa/app/hanelly/apache-data     # with hanelly-ssl.conf file
#
# Hanelly 3.0 directories - standardized
NAK_BACKUP_HANELLY_DIRECTORY=/nakisa/docker-data/volumes/NHAN_hanelly-data/_data
NAK_BACKUP_TOMCAT_LOGS_DIRECTORY=/nakisa/app-volumes/tomcat-logs
NAK_BACKUP_MYSQL_DIRECTORY=/nakisa/app-volumes/mysql-data
NAK_BACKUP_APACHE_SHIB_DIRECTORY=/nakisa/app-volumes/apache-shib
NAK_BACKUP_APACHE_CONF_DIRECTORY=/nakisa/app-volumes/apache-conf

# prepare backup directory for all artifacts
sudo rm -rf /nakisa/backupFull
sudo mkdir  /nakisa/backupFull
sudo mkdir  /nakisa/backupFull/images
sudo mkdir  /nakisa/backupFull/WEB-INF
sudo mkdir  /nakisa/backupFull/tomcat-logs
sudo mkdir  /nakisa/backupFull/mysql-data
sudo mkdir  /nakisa/backupFull/apache-shib
sudo mkdir  /nakisa/backupFull/apache-conf

sudo echo 'Sizings of originals:'                                              > ~/backupFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/images/portraits`       >> ~/backupFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/data-batches`   >> ~/backupFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/effective`      >> ~/backupFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/builds`         >> ~/backupFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/build-archives` >> ~/backupFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/log`            >> ~/backupFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/auditlog`       >> ~/backupFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_TOMCAT_LOGS_DIRECTORY}`                    >> ~/backupFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_MYSQL_DIRECTORY}`                          >> ~/backupFullCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_APACHE_SHIB_DIRECTORY}`                    >> ~/backupFullCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_APACHE_CONF_DIRECTORY}`                    >> ~/backupFullCopySizing
sudo echo ''                                                                  >> ~/backupFullCopySizing

# backup all artifacts: data, configs, logs
sudo echo -ne 'Start: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"`'     ' > ~/backupFullTime
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/images/portraits       /nakisa/backupFull/images/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/data-batches   /nakisa/backupFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/effective      /nakisa/backupFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/builds         /nakisa/backupFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/build-archives /nakisa/backupFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/log            /nakisa/backupFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/auditlog       /nakisa/backupFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_TOMCAT_LOGS_DIRECTORY}/.                  /nakisa/backupFull/tomcat-logs/.
##sudo cp -r ${NAK_BACKUP_MYSQL_DIRECTORY}                          /nakisa/backupFull/.
sudo cp -r ${NAK_BACKUP_APACHE_SHIB_DIRECTORY}                    /nakisa/backupFull/.
sudo cp -r ${NAK_BACKUP_APACHE_CONF_DIRECTORY}                    /nakisa/backupFull/.
sudo echo -ne 'End Copy: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"`'     ' >> ~/backupFullTime

sudo echo ''                                                 >> ~/backupFullCopySizing
sudo echo 'Sizings of copies:'                               >> ~/backupFullCopySizing
#sudo echo `sudo du -s /nakisa/backupFull/images/portraits`       >> ~/backupFullCopySizing
#sudo echo `sudo du -s /nakisa/backupFull/WEB-INF/data-batches`   >> ~/backupFullCopySizing
#sudo echo `sudo du -s /nakisa/backupFull/WEB-INF/effective`      >> ~/backupFullCopySizing
#sudo echo `sudo du -s /nakisa/backupFull/WEB-INF/builds`         >> ~/backupFullCopySizing
#sudo echo `sudo du -s /nakisa/backupFull/WEB-INF/build-archives` >> ~/backupFullCopySizing
#sudo echo `sudo du -s /nakisa/backupFull/WEB-INF/log`            >> ~/backupFullCopySizing
#sudo echo `sudo du -s /nakisa/backupFull/WEB-INF/auditlog`       >> ~/backupFullCopySizing
#sudo echo `sudo du -s /nakisa/backupFull/tomcat-logs`            >> ~/backupFullCopySizing
#sudo echo `sudo du -s /nakisa/backupFull/mysql-data`             >> ~/backupFullCopySizing
sudo echo `sudo du -s /nakisa/backupFull/apache-shib`            >> ~/backupFullCopySizing
sudo echo `sudo du -s /nakisa/backupFull/apache-conf`            >> ~/backupFullCopySizing
sudo echo ''                                                 >> ~/backupFullCopySizing

# restore user access to Hanelly
#
#

# mount EBS backup volume to tarball the backup data to it
sudo mount /dev/xvdd1

# tar and compress into EBS backup volume, log action and backup the log
sudo tar -zcf /nakisa_backup/backup_`date +"%Y.%m%b.%d_%H-%M-%S.%N"`.tar.gz /nakisa/backupFull
sudo echo 'Tarred: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"` >> ~/backupFullTime
sudo echo '================================================================================' >> ~/backupFullLog
sudo cat ~/backupFullTime       >> ~/backupFullLog
sudo echo ''                    >> ~/backupFullLog
sudo cat ~/backupFullCopySizing >> ~/backupFullLog
sudo cp ~/backupFullLog /nakisa_backup/backupFullLog

# unmount EBS backup volume when not in use so that scheduled snapshot can take an image
sudo umount -d /dev/xvdd1
