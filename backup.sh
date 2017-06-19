#!/bin/bash 
NAK_BACKUP_TYPE=$1

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
NUM_DAILY_BACKUPS_TO_KEEP=10
NUM_WEEKLY_BACKUPS_TO_KEEP=5
NUM_MONTHLY_BACKUPS_TO_KEEP=13

# prepare backup directory for all artifacts
sudo rm -rf /nakisa/backup${NAK_BACKUP_TYPE}
sudo mkdir  /nakisa/backup${NAK_BACKUP_TYPE}
sudo mkdir  /nakisa/backup${NAK_BACKUP_TYPE}/mysql-data
if [ $NAK_BACKUP_TYPE != "DailyDBOnly" ]
then
  sudo mkdir  /nakisa/backup${NAK_BACKUP_TYPE}/images
  sudo mkdir  /nakisa/backup${NAK_BACKUP_TYPE}/WEB-INF
  sudo mkdir  /nakisa/backup${NAK_BACKUP_TYPE}/tomcat-logs
  sudo mkdir  /nakisa/backup${NAK_BACKUP_TYPE}/apache-shib
  sudo mkdir  /nakisa/backup${NAK_BACKUP_TYPE}/apache-conf
fi

sudo echo 'Sizings of originals:'                                                > ~/backup${NAK_BACKUP_TYPE}CopySizing
sudo echo `sudo du -s ${NAK_BACKUP_MYSQL_DIRECTORY}`                            >> ~/backup${NAK_BACKUP_TYPE}CopySizing
if [ $NAK_BACKUP_TYPE != "DailyDBOnly" ]
then
  sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/images/portraits`       >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/data-batches`   >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/effective`      >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/builds`         >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/build-archives` >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/log`            >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/auditlog`       >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s ${NAK_BACKUP_TOMCAT_LOGS_DIRECTORY}`                    >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s ${NAK_BACKUP_APACHE_SHIB_DIRECTORY}`                    >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s ${NAK_BACKUP_APACHE_CONF_DIRECTORY}`                    >> ~/backup${NAK_BACKUP_TYPE}CopySizing
fi
sudo echo ''                                                                    >> ~/backup${NAK_BACKUP_TYPE}CopySizing

# backup all artifacts: data, configs, logs
sudo echo -ne 'Start: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"`'     ' > ~/backup${NAK_BACKUP_TYPE}Time
sudo cp -r ${NAK_BACKUP_MYSQL_DIRECTORY}                            /nakisa/backup${NAK_BACKUP_TYPE}/.
if [ $NAK_BACKUP_TYPE != "DailyDBOnly" ]
then
  sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/images/portraits       /nakisa/backup${NAK_BACKUP_TYPE}/images/.
  sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/data-batches   /nakisa/backup${NAK_BACKUP_TYPE}/WEB-INF/.
  sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/effective      /nakisa/backup${NAK_BACKUP_TYPE}/WEB-INF/.
  sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/builds         /nakisa/backup${NAK_BACKUP_TYPE}/WEB-INF/.
  sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/build-archives /nakisa/backup${NAK_BACKUP_TYPE}/WEB-INF/.
  sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/log            /nakisa/backup${NAK_BACKUP_TYPE}/WEB-INF/.
  sudo cp -r ${NAK_BACKUP_HANELLY_DIRECTORY}/WEB-INF/auditlog       /nakisa/backup${NAK_BACKUP_TYPE}/WEB-INF/.
  sudo cp -r ${NAK_BACKUP_TOMCAT_LOGS_DIRECTORY}/.                  /nakisa/backup${NAK_BACKUP_TYPE}/tomcat-logs/.
  sudo cp -r ${NAK_BACKUP_APACHE_SHIB_DIRECTORY}                    /nakisa/backup${NAK_BACKUP_TYPE}/.
  sudo cp -r ${NAK_BACKUP_APACHE_CONF_DIRECTORY}                    /nakisa/backup${NAK_BACKUP_TYPE}/.
fi
sudo echo -ne 'End Copy: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"`'     ' >> ~/backup${NAK_BACKUP_TYPE}Time

sudo echo 'Sizings of copies:'                                                   >> ~/backup${NAK_BACKUP_TYPE}CopySizing
sudo echo `sudo du -s /nakisa/backup${NAK_BACKUP_TYPE}/mysql-data`               >> ~/backup${NAK_BACKUP_TYPE}CopySizing
if [ $NAK_BACKUP_TYPE != "DailyDBOnly" ]
then
  sudo echo `sudo du -s /nakisa/backup${NAK_BACKUP_TYPE}/images/portraits`       >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s /nakisa/backup${NAK_BACKUP_TYPE}/WEB-INF/data-batches`   >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s /nakisa/backup${NAK_BACKUP_TYPE}/WEB-INF/effective`      >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s /nakisa/backup${NAK_BACKUP_TYPE}/WEB-INF/builds`         >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s /nakisa/backup${NAK_BACKUP_TYPE}/WEB-INF/build-archives` >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s /nakisa/backup${NAK_BACKUP_TYPE}/WEB-INF/log`            >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s /nakisa/backup${NAK_BACKUP_TYPE}/WEB-INF/auditlog`       >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s /nakisa/backup${NAK_BACKUP_TYPE}/tomcat-logs`            >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s /nakisa/backup${NAK_BACKUP_TYPE}/apache-shib`            >> ~/backup${NAK_BACKUP_TYPE}CopySizing
  sudo echo `sudo du -s /nakisa/backup${NAK_BACKUP_TYPE}/apache-conf`            >> ~/backup${NAK_BACKUP_TYPE}CopySizing
fi
sudo echo ''                                                                     >> ~/backup${NAK_BACKUP_TYPE}CopySizing

# restore user access to Hanelly
#
#

# mount EBS backup volume to tarball the backup data to it
sudo mount /dev/xvdd1

# tar and compress into EBS backup volume, log action and backup the log
sudo tar -zcf /nakisa_backup/backup${NAK_BACKUP_TYPE}_`date +"%Y.%m%b.%d_%H-%M-%S.%N"`.tar.gz /nakisa/backup${NAK_BACKUP_TYPE}
sudo echo 'Tarred: '`date +"%Y.%m%b.%d_%H-%M-%S.%N"` >> ~/backup${NAK_BACKUP_TYPE}Time
sudo echo '================================================================================' >> ~/backup${NAK_BACKUP_TYPE}Log
sudo cat ~/backup${NAK_BACKUP_TYPE}Time       >> ~/backup${NAK_BACKUP_TYPE}Log
sudo echo ''                                  >> ~/backup${NAK_BACKUP_TYPE}Log
sudo cat ~/backup${NAK_BACKUP_TYPE}CopySizing >> ~/backup${NAK_BACKUP_TYPE}Log
sudo cp  ~/backup${NAK_BACKUP_TYPE}Log        /nakisa_backup/backup${NAK_BACKUP_TYPE}Log
sudo rm  ~/backup${NAK_BACKUP_TYPE}Time       ~/backup${NAK_BACKUP_TYPE}CopySizing
cd /nakisa_backup

# remove old daily backups if any exist
NUM_DAILY_BACKUPS_FOUND=`ls -F *Daily*tar* | wc -l`
while [[ $NUM_DAILY_BACKUPS_FOUND -gt $NUM_DAILY_BACKUPS_TO_KEEP ]]; do
  sudo rm `ls -F *Daily*tar* | head -1`
  NUM_DAILY_BACKUPS_FOUND=`ls -F *Daily*tar* | wc -l`
done

# remove old weekly backups if any exist
NUM_WEEKLY_BACKUPS_FOUND=`ls -F *Weekly*tar* | wc -l`
while [[ $NUM_WEEKLY_BACKUPS_FOUND -gt $NUM_WEEKLY_BACKUPS_TO_KEEP ]]; do
  sudo rm `ls -F *Weekly*tar* | head -1`
  NUM_WEEKLY_BACKUPS_FOUND=`ls -F *Weekly*tar* | wc -l`
done

# remove old monthly backups if any exist
NUM_MONTHLY_BACKUPS_FOUND=`ls -F *Monthly*tar* | wc -l`
while [[ $NUM_MONTHLY_BACKUPS_FOUND -gt $NUM_MONTHLY_BACKUPS_TO_KEEP ]]; do
  sudo rm `ls -F *Monthly*tar* | head -1`
  NUM_MONTHLY_BACKUPS_FOUND=`ls -F *Monthly*tar* | wc -l`
done

# unmount EBS backup volume when not in use so that scheduled snapshot can take an image
sudo umount -d /dev/xvdd1
