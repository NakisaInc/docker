# set up cron service
sudo apt-get install cron
sudo service cron start

# download backup scripts
wget -O - https://raw.githubusercontent.com/NakisaInc/docker/Hanelly-3.0/backupDailyDBOnly.sh  > ~/backupDailyDBOnly.sh
wget -O - https://raw.githubusercontent.com/NakisaInc/docker/Hanelly-3.0/backupWeeklyFull.sh   > ~/backupWeeklyFull.sh
wget -O - https://raw.githubusercontent.com/NakisaInc/docker/Hanelly-3.0/backupMonthlyFull.sh  > ~/backupMonthlyFullFull.sh

# for each backup script: ~/backupDailyDBOnly, ~/backupWeeklyFull, ~/backupMonthlyFull
# set the following  variables to the directories which need to be copied
NAK_BACKUP_HANELLY_DIRECTORY
NAK_BACKUP_TOMCAT_LOGS_DIRECTORY
NAK_BACKUP_MYSQL_DIRECTORY
NAK_BACKUP_APACHE_SHIB_DIRECTORY
NAK_BACKUP_APACHE_CONF_DIRECTORY
# modify the limits on the number of daily, weekly and monthly backups to keep as needed or keep the defaults
NUM_DAILY_BACKUPS_TO_KEEP=10
NUM_WEEKLY_BACKUPS_TO_KEEP=5
NUM_MONTHLY_BACKUPS_TO_KEEP=13

# setup cron job to run daily, weekly and monthly backup scripts
sudo crontab -e

# add the following lines to the crontab file and save it - the jobs are now scheduled
# eg. Coty Prod: 9pm PST or 4am UTC (next day)
# min hour dayOfMonth month dayOfWeek
  0   5    1          *     *             ~/backupMonthlyFull     # Monthly Full backup @10pm PST: 1st of the month
  0   4    *          *     0             ~/backupWeeklyFull      # Weekly  Full backup  @9pm PST: Sat
  0   4    *          *     1,2,3,4,5,6   ~/backupDailyDBOnly     # Daily   Data backup  @9pm PST: Sun-Fri

# manually execute each backup script to ensure it is working correctly and backing up the required directories
sudo chmod +x /nakisa/app/backupDailyDBOnly /nakisa/app/backupWeeklyFull /nakisa/app/backupMonthlyFull
. /nakisa/app/backupDailyDBOnly
. /nakisa/app/backupWeeklyFull
. /nakisa/app/backupMonthlyFull
# check for any error messages when running the above in case incorrect directories were specified
# check the following backup logs in ~/ to ensure :
# back
# check the copied content in /nakisa/backupDBOnly and /nakisa/backupFull directories as well as the tar files in /nakisa_backup
# you will need to mount the /nakisa_backup directory because the backup scripts unmount it when completed
sudo mount /dev/xvdd1


