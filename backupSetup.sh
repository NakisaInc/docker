# set up cron service
sudo apt-get install cron
sudo service cron start

# setup cron job to run daily
sudo crontab -e

# add the following lines to the crontab file and save it - the jobs are now scheduled
# min hour dayOfMonth month dayOfWeek
# Coty Prod: 9pm PST or 4am UTC (next day)
0 4 * * 1,2,3,4,5,6 /nakisa/app/backupDBOnly    # Daily  Data backup @9pm PST: Sun-Fri
0 4 * * 0           /nakisa/app/backupFull      # Weekly Full backup @9pm PST: Sat


# manually execute the backup scripts to ensure they are working and backing up the required directories
sudo chmod +x /nakisa/app/backupDBOnly /nakisa/app/backupFull
. /nakisa/app/backupDBOnly
. /nakisa/app/backupFull
# check for any error messages when running the above in case incorrect directories were specified
# check the copied content in /nakisa/backupDBOnly and /nakisa/backupFull directories as well as the tar file in /nakisa_backup
# you will need to mount the /nakisa_backup directory because the backup scripts unmount it when completed
sudo mount /dev/xvdd1

