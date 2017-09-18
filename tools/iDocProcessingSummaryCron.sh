#!/bin/bash 

# min hour dayOfMonth month dayOfWeek
#  0/10   *    *          *     *             /nakisa/app/tools/iDocProcessingSummaryCron.sh
# crontab ls
# crontab -e

sudo echo -ne `date -u +"%Y.%m%b.%d_%H-%M-%S.%N"`' UTC: '                  >> ~/iDocProcessingSummaryLog
sudo echo -ne `ls -l /opt/tomcat/webapps/hanelly/WEB-INF/idocs -l | wc -l` >> ~/iDocProcessingSummaryLog
sudo echo ''                                                               >> ~/iDocProcessingSummaryLog
