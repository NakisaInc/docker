#!/bin/bash 

# Set environemental variables to identify the directories to be backed up
#
# Hanelly 2.2 directories - may be different per installation
NAK_BACKUP_MYSQL_DIRECTORY=/nakisa/mysql
#
# Hanelly 3.0 directories - standardized
NAK_BACKUP_MYSQL_DIRECTORY=/nakisa/app-volumes/mysql-data

# prepare backup directory for all artifacts
sudo rm -rf /nakisa/backupDBOnly
sudo mkdir  /nakisa/backupDBOnly
sudo mkdir  /nakisa/backupDBOnly/images
sudo mkdir  /nakisa/backupDBOnly/WEB-INF
sudo mkdir  /nakisa/backupDBOnly/tomcat-logs
sudo mkdir  /nakisa/backupDBOnly/mysql-data
sudo mkdir  /nakisa/backupDBOnly/apache-shib
sudo mkdir  /nakisa/backupDBOnly/apache-conf

sudo echo 'Sizings of originals:'                                              > ~/backupDBOnlyCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/images/portraits`       >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/data-batches`   >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/effective`      >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/builds`         >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/build-archives` >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/log`            >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/auditlog`       >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_TOMCAT_LOGS_DIRECTORY}`                    >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_MYSQL_DIRECTORY}`                          >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_APACHE_SHIB_DIRECTORY}`                    >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_APACHE_CONF_DIRECTORY}`                    >> ~/backupDBOnlyCopySizing
sudo echo ''                                                                  >> ~/backupDBOnlyCopySizing

# backup all artifacts: data, configs, logs
sudo echo -ne 'Start: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"`'     ' > ~/backupDBOnlyTime
sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/images/portraits       /nakisa/backupDBOnly/images/.
sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/data-batches   /nakisa/backupDBOnly/WEB-INF/.
sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/effective      /nakisa/backupDBOnly/WEB-INF/.
sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/builds         /nakisa/backupDBOnly/WEB-INF/.
sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/build-archives /nakisa/backupDBOnly/WEB-INF/.
sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/log            /nakisa/backupDBOnly/WEB-INF/.
sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/auditlog       /nakisa/backupDBOnly/WEB-INF/.
sudo cp -r ${NAK_BACKUP_TOMCAT_LOGS_DIRECTORY}/.                  /nakisa/backupDBOnly/tomcat-logs/.
sudo cp -r ${NAK_BACKUP_MYSQL_DIRECTORY}                          /nakisa/backupDBOnly/.
sudo cp -r ${NAK_BACKUP_APACHE_SHIB_DIRECTORY}                    /nakisa/backupDBOnly/.
sudo cp -r ${NAK_BACKUP_APACHE_CONF_DIRECTORY}                    /nakisa/backupDBOnly/.
sudo echo -ne 'End Copy: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"`'     ' >> ~/backupDBOnlyTime

sudo echo ''                                                 >> ~/backupDBOnlyCopySizing
sudo echo 'Sizings of copies:'                               >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s /nakisa/backup/images/portraits`       >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s /nakisa/backup/WEB-INF/data-batches`   >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s /nakisa/backup/WEB-INF/effective`      >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s /nakisa/backup/WEB-INF/builds`         >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s /nakisa/backup/WEB-INF/build-archives` >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s /nakisa/backup/WEB-INF/log`            >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s /nakisa/backup/WEB-INF/auditlog`       >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s /nakisa/backup/tomcat-logs`            >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s /nakisa/backup/mysql-data`             >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s /nakisa/backup/apache-shib`            >> ~/backupDBOnlyCopySizing
sudo echo `sudo du -s /nakisa/backup/apache-conf`            >> ~/backupDBOnlyCopySizing
sudo echo ''                                                 >> ~/backupDBOnlyCopySizing

# tar and compress into EBS backup volume, log action and backup the log
sudo tar -zcf /nakisa_backup/backup_`date +"%Y.%m%b.%d_%H-%M-%S.%N"`.tar.gz /nakisa/backupDBOnly
sudo echo 'Tarred: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"` >> ~/backupDBOnlyTime
sudo echo '================================================================================' >> ~/backupDBOnlyLog
sudo cat ~/backupDBOnlyTime       >> ~/backupDBOnlyLog
sudo echo ''                    >> ~/backupDBOnlyLog
sudo cat ~/backupDBOnlyCopySizing >> ~/backupDBOnlyLog
sudo cp ~/backupDBOnlyLog /nakisa_backup/backupDBOnlyLog
