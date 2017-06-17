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
NUM_WEEKLY_BACKUPS_TO_KEEP=5

# prepare backup directory for all artifacts
sudo rm -rf /nakisa/backupWeeklyFull
sudo mkdir  /nakisa/backupWeeklyFull
sudo mkdir  /nakisa/backupWeeklyFull/images
sudo mkdir  /nakisa/backupWeeklyFull/WEB-INF
sudo mkdir  /nakisa/backupWeeklyFull/tomcat-logs
sudo mkdir  /nakisa/backupWeeklyFull/mysql-data
sudo mkdir  /nakisa/backupWeeklyFull/apache-shib
sudo mkdir  /nakisa/backupWeeklyFull/apache-conf

sudo echo 'Sizings of originals:'                                              > ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/images/portraits`       >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/data-batches`   >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/effective`      >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/builds`         >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/build-archives` >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/log`            >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/auditlog`       >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_TOMCAT_LOGS_DIRECTORY}`                    >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_MYSQL_DIRECTORY}`                          >> ~/backupWeeklyFullCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_APACHE_SHIB_DIRECTORY}`                    >> ~/backupWeeklyFullCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_APACHE_CONF_DIRECTORY}`                    >> ~/backupWeeklyFullCopySizing
sudo echo ''                                                                  >> ~/backupWeeklyFullCopySizing

# backup all artifacts: data, configs, logs
sudo echo -ne 'Start: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"`'     ' > ~/backupWeeklyFullTime
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/images/portraits       /nakisa/backupWeeklyFull/images/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/data-batches   /nakisa/backupWeeklyFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/effective      /nakisa/backupWeeklyFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/builds         /nakisa/backupWeeklyFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/build-archives /nakisa/backupWeeklyFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/log            /nakisa/backupWeeklyFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/auditlog       /nakisa/backupWeeklyFull/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_TOMCAT_LOGS_DIRECTORY}/.                  /nakisa/backupWeeklyFull/tomcat-logs/.
#sudo cp -r ${NAK_BACKUP_MYSQL_DIRECTORY}                          /nakisa/backupWeeklyFull/.
sudo cp -r ${NAK_BACKUP_APACHE_SHIB_DIRECTORY}                    /nakisa/backupWeeklyFull/.
sudo cp -r ${NAK_BACKUP_APACHE_CONF_DIRECTORY}                    /nakisa/backupWeeklyFull/.
sudo echo -ne 'End Copy: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"`'     ' >> ~/backupWeeklyFullTime

sudo echo ''                                                           >> ~/backupWeeklyFullCopySizing
sudo echo 'Sizings of copies:'                                         >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupWeeklyFull/images/portraits`       >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupWeeklyFull/WEB-INF/data-batches`   >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupWeeklyFull/WEB-INF/effective`      >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupWeeklyFull/WEB-INF/builds`         >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupWeeklyFull/WEB-INF/build-archives` >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupWeeklyFull/WEB-INF/log`            >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupWeeklyFull/WEB-INF/auditlog`       >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupWeeklyFull/tomcat-logs`            >> ~/backupWeeklyFullCopySizing
#sudo echo `sudo du -s /nakisa/backupWeeklyFull/mysql-data`             >> ~/backupWeeklyFullCopySizing
sudo echo `sudo du -s /nakisa/backupWeeklyFull/apache-shib`            >> ~/backupWeeklyFullCopySizing
sudo echo `sudo du -s /nakisa/backupWeeklyFull/apache-conf`            >> ~/backupWeeklyFullCopySizing
sudo echo ''                                                           >> ~/backupWeeklyFullCopySizing

# restore user access to Hanelly
#
#

# mount EBS backup volume to tarball the backup data to it
sudo mount /dev/xvdd1

# tar and compress into EBS backup volume, log action and backup the log
sudo tar -zcf /nakisa_backup/backup_`date +"%Y.%m%b.%d_%H-%M-%S.%N"`.tar.gz /nakisa/backupWeeklyFull
sudo echo 'Tarred: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"` >> ~/backupWeeklyFullTime
sudo echo '================================================================================' >> ~/backupWeeklyFullLog
sudo cat ~/backupWeeklyFullTime       >> ~/backupWeeklyFullLog
sudo echo ''                          >> ~/backupWeeklyFullLog
sudo cat ~/backupWeeklyFullCopySizing >> ~/backupWeeklyFullLog
sudo cp ~/backupWeeklyFullLog /nakisa_backup/backupWeeklyFullLog

# remove old weekly backups
NUM_WEEKLY_BACKUPS_FOUND=`ls -F /nakisa-backup/*Weekly*tar* | wc -l`
if [ ${NUM_WEEKLY_BACKUPS_FOUND} -gt ${NUM_WEEKLY_BACKUPS_TO_KEEP} ]
then
  sudo rm `ls -F *tar* | head -1`
fi

# unmount EBS backup volume when not in use so that scheduled snapshot can take an image
sudo umount -d /dev/xvdd1
