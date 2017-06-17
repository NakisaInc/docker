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

# set limits on number of backups to keep
NUM_MONTHLY_BACKUPS_TO_KEEP=13

# prepare backup directory for all artifacts
sudo rm -rf /nakisa/backupMonthlyFull
sudo mkdir  /nakisa/backupMonthlyFull
sudo mkdir  /nakisa/backupMonthlyFull/images
sudo mkdir  /nakisa/backupMonthlyFull/WEB-INF
sudo mkdir  /nakisa/backupMonthlyFull/tomcat-logs
sudo mkdir  /nakisa/backupMonthlyFull/mysql-data
sudo mkdir  /nakisa/backupMonthlyFull/apache-shib
sudo mkdir  /nakisa/backupMonthlyFull/apache-conf

sudo echo 'Sizings of originals:'                                              > ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/images/portraits`       >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/data-batches`   >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/effective`      >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/builds`         >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/build-archives` >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/log`            >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/auditlog`       >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_TOMCAT_LOGS_DIRECTORY}`                    >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_MYSQL_DIRECTORY}`                          >> ~/backupMonthlyFullCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_APACHE_SHIB_DIRECTORY}`                    >> ~/backupMonthlyFullCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_APACHE_CONF_DIRECTORY}`                    >> ~/backupMonthlyFullCopySizing
sudo echo ''                                                                  >> ~/backupMonthlyFullCopySizing

# backup all artifacts: data, configs, logs
sudo echo -ne 'Start: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"`'     ' > ~/backupMonthlyFullTime
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/images/portraits       /nakisa/backupMonthlyFull/images/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/data-batches   /nakisa/backupMonthlyFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/effective      /nakisa/backupMonthlyFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/builds         /nakisa/backupMonthlyFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/build-archives /nakisa/backupMonthlyFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/log            /nakisa/backupMonthlyFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/auditlog       /nakisa/backupMonthlyFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_TOMCAT_LOGS_DIRECTORY}/.                  /nakisa/backupMonthlyFull/tomcat-logs/.
#sudo cp -r ${NAK_BACKUP_MYSQL_DIRECTORY}                          /nakisa/backupMonthlyFull/.
sudo cp -r ${NAK_BACKUP_APACHE_SHIB_DIRECTORY}                    /nakisa/backupMonthlyFull/.
sudo cp -r ${NAK_BACKUP_APACHE_CONF_DIRECTORY}                    /nakisa/backupMonthlyFull/.
sudo echo -ne 'End Copy: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"`'     ' >> ~/backupMonthlyFullTime

sudo echo ''                                                            >> ~/backupMonthlyFullCopySizing
sudo echo 'Sizings of copies:'                                          >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupMonthlyFull/images/portraits`       >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupMonthlyFull/WEB-INF/data-batches`   >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupMonthlyFull/WEB-INF/effective`      >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupMonthlyFull/WEB-INF/builds`         >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupMonthlyFull/WEB-INF/build-archives` >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupMonthlyFull/WEB-INF/log`            >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupMonthlyFull/WEB-INF/auditlog`       >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupMonthlyFull/tomcat-logs`            >> ~/backupMonthlyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupMonthlyFull/mysql-data`             >> ~/backupMonthlyFullCopySizing
sudo echo `sudo du -s /nakisa/backupMonthlyFull/apache-shib`            >> ~/backupMonthlyFullCopySizing
sudo echo `sudo du -s /nakisa/backupMonthlyFull/apache-conf`            >> ~/backupMonthlyFullCopySizing
sudo echo ''                                                            >> ~/backupMonthlyFullCopySizing

# restore user access to Hanelly
#
#

# mount EBS backup volume to tarball the backup data to it
sudo mount /dev/xvdd1

# tar and compress into EBS backup volume, log action and backup the log
sudo tar -zcf /nakisa_backup/backup_`date +"%Y.%m%b.%d_%H-%M-%S.%N"`.tar.gz /nakisa/backupMonthlyFull
sudo echo 'Tarred: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"` >> ~/backupMonthlyFullTime
sudo echo '================================================================================' >> ~/backupMonthlyFullLog
sudo cat ~/backupMonthlyFullTime       >> ~/backupMonthlyFullLog
sudo echo ''                           >> ~/backupMonthlyFullLog
sudo cat ~/backupMonthlyFullCopySizing >> ~/backupMonthlyFullLog
sudo cp ~/backupMonthlyFullLog /nakisa_backup/backupMonthlyFullLog

# remove old monthly backups
NUM_MONTHLY_BACKUPS_FOUND=`ls -F /nakisa-backup/*Monthly*tar* | wc -l`
if [ ${NUM_MONTHLY_BACKUPS_FOUND} -gt ${NUM_MONTHLY_BACKUPS_TO_KEEP} ]
then
  sudo rm `ls -F *tar* | head -1`
fi

# unmount EBS backup volume when not in use so that scheduled snapshot can take an image
sudo umount -d /dev/xvdd1
