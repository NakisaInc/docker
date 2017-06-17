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

# set limits on number of daily, weekly and monthly backups to keep
NUM_DAILY_BACKUPS_TO_KEEP=10

# prepare backup directory for all artifacts
sudo rm -rf /nakisa/backupDailyDBOnly
sudo mkdir  /nakisa/backupDailyDBOnly
sudo mkdir  /nakisa/backupDailyDBOnly/images
sudo mkdir  /nakisa/backupDailyDBOnly/WEB-INF
sudo mkdir  /nakisa/backupDailyDBOnly/tomcat-logs
sudo mkdir  /nakisa/backupDailyDBOnly/mysql-data
sudo mkdir  /nakisa/backupDailyDBOnly/apache-shib
sudo mkdir  /nakisa/backupDailyDBOnly/apache-conf

sudo echo 'Sizings of originals:'                                              > ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/images/portraits`       >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/data-batches`   >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/effective`      >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/builds`         >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/build-archives` >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/log`            >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/auditlog`       >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_TOMCAT_LOGS_DIRECTORY}`                    >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s ${NAK_BACKUP_MYSQL_DIRECTORY}`                          >> ~/backupDailyDBOnlyCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_APACHE_SHIB_DIRECTORY}`                    >> ~/backupDailyDBOnlyCopySizing
sudo echo `sudo du -s ${NAK_BACKUP_APACHE_CONF_DIRECTORY}`                    >> ~/backupDailyDBOnlyCopySizing
sudo echo ''                                                                  >> ~/backupDailyDBOnlyCopySizing

# backup all artifacts: data, configs, logs
sudo echo -ne 'Start: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"`'     ' > ~/backupDailyDBOnlyTime
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/images/portraits       /nakisa/backupDailyDBOnly/images/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/data-batches   /nakisa/backupDailyDBOnly/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/effective      /nakisa/backupDailyDBOnly/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/builds         /nakisa/backupDailyDBOnly/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/build-archives /nakisa/backupDailyDBOnly/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/log            /nakisa/backupDailyDBOnly/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/auditlog       /nakisa/backupDailyDBOnly/WEB-INF/.
#sudo cp -r ${NAK_BACKUP_TOMCAT_LOGS_DIRECTORY}/.                  /nakisa/backupDailyDBOnly/tomcat-logs/.
#sudo cp -r ${NAK_BACKUP_MYSQL_DIRECTORY}                          /nakisa/backupDailyDBOnly/.
sudo cp -r ${NAK_BACKUP_APACHE_SHIB_DIRECTORY}                    /nakisa/backupDailyDBOnly/.
sudo cp -r ${NAK_BACKUP_APACHE_CONF_DIRECTORY}                    /nakisa/backupDailyDBOnly/.
sudo echo -ne 'End Copy: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"`'     ' >> ~/backupDailyDBOnlyTime

sudo echo ''                                                            >> ~/backupDailyDBOnlyCopySizing
sudo echo 'Sizings of copies:'                                          >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s /nakisa/backupDailyDBOnly/images/portraits`       >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s /nakisa/backupDailyDBOnly/WEB-INF/data-batches`   >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s /nakisa/backupDailyDBOnly/WEB-INF/effective`      >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s /nakisa/backupDailyDBOnly/WEB-INF/builds`         >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s /nakisa/backupDailyDBOnly/WEB-INF/build-archives` >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s /nakisa/backupDailyDBOnly/WEB-INF/log`            >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s /nakisa/backupDailyDBOnly/WEB-INF/auditlog`       >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s /nakisa/backupDailyDBOnly/tomcat-logs`            >> ~/backupDailyDBOnlyCopySizing
#sudo echo `sudo du -s /nakisa/backupDailyDBOnly/mysql-data`             >> ~/backupDailyDBOnlyCopySizing
sudo echo `sudo du -s /nakisa/backupDailyDBOnly/apache-shib`            >> ~/backupDailyDBOnlyCopySizing
sudo echo `sudo du -s /nakisa/backupDailyDBOnly/apache-conf`            >> ~/backupDailyDBOnlyCopySizing
sudo echo ''                                                            >> ~/backupDailyDBOnlyCopySizing

# restore user access to Hanelly
#
#

# mount EBS backup volume to tarball the backup data to it
sudo mount /dev/xvdd1

# tar and compress into EBS backup volume, log action and backup the log
sudo tar -zcf /nakisa_backup/backupDaily_`date +"%Y.%m%b.%d_%H-%M-%S.%N"`.tar.gz /nakisa/backupDailyDBOnly
sudo echo 'Tarred: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"` >> ~/backupDailyDBOnlyTime
sudo echo '================================================================================' >> ~/backupDailyDBOnlyLog
sudo cat ~/backupDailyDBOnlyTime       >> ~/backupDailyDBOnlyLog
sudo echo ''                           >> ~/backupDailyDBOnlyLog
sudo cat ~/backupDailyDBOnlyCopySizing >> ~/backupDailyDBOnlyLog
sudo cp ~/backupDailyDBOnlyLog /nakisa_backup/backupDailyDBOnlyLog

# remove old daily backups
NUM_DAILY_BACKUPS_FOUND=`ls -F /nakisa-backup/*Daily*tar* | wc -l`
if [ ${NUM_DAILY_BACKUPS_FOUND} -gt ${NUM_DAILY_BACKUPS_TO_KEEP} ]
then
  sudo rm `ls -F *tar* | head -1`
fi

# unmount EBS backup volume when not in use so that scheduled snapshot can take an image
sudo umount -d /dev/xvdd1
