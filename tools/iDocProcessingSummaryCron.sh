#!/bin/bash 

# min hour dayOfMonth month dayOfWeek
#  *   *    *          *     *             /nakisa/app/tools/iDocProcessingSummaryCron.sh
# crontab ls
# crontab -e

udo echo -ne `date +"%Y.%m%b.%d_%H-%M-%S.%N"`' UTC: '                           >> ~/iDocProcessingSummaryLog
sudo echo -ne "Count in .../idocs: "                                            >> ~/iDocProcessingSummaryLog
sudo echo -ne `ls -l /opt/tomcat/webapps/hanelly/WEB-INF/idocs      -l | wc -l` >> ~/iDocProcessingSummaryLog
sudo echo -ne ",   Count in .../idocs_copy: "                                   >> ~/iDocProcessingSummaryLog
sudo echo -ne `ls -l /opt/tomcat/webapps/hanelly/WEB-INF/idocs_copy -l | wc -l` >> ~/iDocProcessingSummaryLog
sudo echo ''                                                                    >> ~/iDocProcessingSummaryLog
