#!/bin/bash

# set memory variables to use based on $NAK_INSTALLATION_TYPE
case $NAK_INSTALLATION_TYPE in
  "MicroHTTP")            NAK_MEMORY_MIN_HANELLY=400m;  NAK_MEMORY_MAX_HANELLY=400m;  NAK_MEMORY_ES=400m;;
  "MiniHTTP")             NAK_MEMORY_MIN_HANELLY=800m;  NAK_MEMORY_MAX_HANELLY=800m;  NAK_MEMORY_ES=800m;;
  "DemoHTTP")             NAK_MEMORY_MIN_HANELLY=1500m; NAK_MEMORY_MAX_HANELLY=1500m; NAK_MEMORY_ES=1500m;;
  "DemoHTTPS")            NAK_MEMORY_MIN_HANELLY=1500m; NAK_MEMORY_MAX_HANELLY=1500m; NAK_MEMORY_ES=1500m;;
  "Training")             NAK_MEMORY_MIN_HANELLY=3000m; NAK_MEMORY_MAX_HANELLY=3000m; NAK_MEMORY_ES=3500m;;
  "XSmallUnmonitored")   NAK_MEMORY_MIN_HANELLY=2500m; NAK_MEMORY_MAX_HANELLY=2500m; NAK_MEMORY_ES=3000m;;
  "XSmallMonitored")     NAK_MEMORY_MIN_HANELLY=3000m; NAK_MEMORY_MAX_HANELLY=3000m; NAK_MEMORY_ES=2500m;;
  "Small")                NAK_MEMORY_MIN_HANELLY=5g;    NAK_MEMORY_MAX_HANELLY=5g;    NAK_MEMORY_ES=5g;;
  "Medium")               NAK_MEMORY_MIN_HANELLY=10g;   NAK_MEMORY_MAX_HANELLY=10g;   NAK_MEMORY_ES=10g;;
  "Large")                NAK_MEMORY_MIN_HANELLY=22g;   NAK_MEMORY_MAX_HANELLY=22g;   NAK_MEMORY_ES=26g;;
  *)                      NAK_MEMORY_MIN_HANELLY=1500m; NAK_MEMORY_MAX_HANELLY=1500m; NAK_MEMORY_ES=1500m;;
esac

# set image variables to use based on $NAK_INSTALLATION_TYPE 
# first set major.minor release level image dependencies
case $NAK_SOLUTION_RELEASE_HANELLY in
  "3.0"*)  NAK_IMAGE_APACHE=nakisa/apache:2.4-shib
           NAK_IMAGE_MYSQL=mysql:5.7
           NAK_IMAGE_ES=elasticsearch:5.2.0
           NAK_IMAGE_CADVISOR=google/cadvisor:v0.25.0
           NAK_IMAGE_DBMONITOR=prom/mysqld-exporter:v0.10.0
           NAK_IMAGE_PROMETHEUS=prom/prometheus:v1.6.0
           NAK_IMAGE_GRAFANA=grafana/grafana:4.2.0
           ;;
  *)       NAK_IMAGE_APACHE=nakisa/apache:2.4-shib
           NAK_IMAGE_MYSQL=mysql:5.7
           NAK_IMAGE_ES=elasticsearch:5.2.0
           NAK_IMAGE_CADVISOR=google/cadvisor:v0.25.0
           NAK_IMAGE_DBMONITOR=prom/mysqld-exporter:v0.10.0
           NAK_IMAGE_PROMETHEUS=prom/prometheus:v1.6.0
           NAK_IMAGE_GRAFANA=grafana/grafana:4.2.0
           ;;
esac

# now set post certified release level dependencies
case $NAK_SOLUTION_RELEASE_HANELLY in
  "3.0.0") NAK_IMAGE_HANELLY=nakisa/hanelly:3.0.0
           NAK_IMAGE_IDOC_LISTENER=nakisa/tools:idoc-listener-1.0.0
           ;;
  "3.0.1") NAK_IMAGE_HANELLY=nakisa/hanelly:3.0.1
           NAK_IMAGE_IDOC_LISTENER=nakisa/tools:idoc-listener-1.1.0
           ;;
#  "3.0.2") NAK_IMAGE_HANELLY=nakisa/hanelly:3.0.2
#           NAK_IMAGE_IDOC_LISTENER=nakisa/tools:idoc-listener-1.1.0
#           NAK_IMAGE_BACKUP_RESTORE=tbd
#           NAK_IMAGE_TASK_MANAGER=tbd
#           ;;
  "3.0.2-snapshot")
           NAK_IMAGE_HANELLY=nakisa/hanelly:3.0.2-snapshot
           NAK_IMAGE_IDOC_LISTENER=nakisa/tools:idoc-listener-1.1.0
#           NAK_IMAGE_BACKUP_RESTORE=backup-management-1.1.0-snapshot
#           NAK_IMAGE_TASK_MANAGER=task-manager-1.1.0-snapshot
           ;;
esac

# generate the docker stack .yml file based on parameters and components needed
# below code is failsafe and generates full stack for unexpected $NAK_INSTALLATION_TYPE
cd /nakisa/app/hanelly; cp dsService- ~/ds-Generated

# always add Apache container except for DemoHTTP and Training installation types
# 3.0.0 has Redis dependency
if [ $NAK_SOLUTION_RELEASE_HANELLY = "3.0.0" ]
then
  if [ $NAK_INSTALLATION_TYPE = "MicroHTTP" ] || [ $NAK_INSTALLATION_TYPE = "MiniHTTP" ] ||
     [ $NAK_INSTALLATION_TYPE = "DemoHTTP"  ] || [ $NAK_INSTALLATION_TYPE = "Training" ]
  then
    cat dsService-HanellyRedis_noProxy | sed 's,<NAK_IMAGE_HANELLY>,'"${NAK_IMAGE_HANELLY}"',g' | sed 's,<NAK_MEMORY_MIN_HANELLY>,'"${NAK_MEMORY_MIN_HANELLY}"',g' | sed 's,<NAK_MEMORY_MAX_HANELLY>,'"${NAK_MEMORY_MAX_HANELLY}"',g' >> ~/ds-Generated
  else
    cat dsService-Apache | sed 's,<NAK_IMAGE_APACHE>,'"${NAK_IMAGE_APACHE}"',g' >> ~/ds-Generated
    cat dsService-HanellyRedis | sed 's,<NAK_IMAGE_HANELLY>,'"${NAK_IMAGE_HANELLY}"',g' | sed 's,<NAK_MEMORY_MIN_HANELLY>,'"${NAK_MEMORY_MIN_HANELLY}"',g' | sed 's,<NAK_MEMORY_MAX_HANELLY>,'"${NAK_MEMORY_MAX_HANELLY}"',g' >> ~/ds-Generated
  fi
# 3.0.1 and later do not have Redis
else
  if [ $NAK_INSTALLATION_TYPE = "MicroHTTP" ] || [ $NAK_INSTALLATION_TYPE = "MiniHTTP" ] ||
     [ $NAK_INSTALLATION_TYPE = "DemoHTTP"  ] || [ $NAK_INSTALLATION_TYPE = "Training" ]
  then
    cat dsService-Hanelly_noProxy | sed 's,<NAK_IMAGE_HANELLY>,'"${NAK_IMAGE_HANELLY}"',g' | sed 's,<NAK_MEMORY_MIN_HANELLY>,'"${NAK_MEMORY_MIN_HANELLY}"',g' | sed 's,<NAK_MEMORY_MAX_HANELLY>,'"${NAK_MEMORY_MAX_HANELLY}"',g' >> ~/ds-Generated
  else
    cat dsService-Apache | sed 's,<NAK_IMAGE_APACHE>,'"${NAK_IMAGE_APACHE}"',g' >> ~/ds-Generated
    cat dsService-Hanelly | sed 's,<NAK_IMAGE_HANELLY>,'"${NAK_IMAGE_HANELLY}"',g' | sed 's,<NAK_MEMORY_MIN_HANELLY>,'"${NAK_MEMORY_MIN_HANELLY}"',g' | sed 's,<NAK_MEMORY_MAX_HANELLY>,'"${NAK_MEMORY_MAX_HANELLY}"',g' >> ~/ds-Generated
  fi
fi

cat dsService-mySQL_ES | sed 's,<NAK_IMAGE_MYSQL>,'"${NAK_IMAGE_MYSQL}"',g' | sed 's,<NAK_IMAGE_ES>,'"${NAK_IMAGE_ES}"',g' | sed 's,<NAK_MEMORY_ES>,'"${NAK_MEMORY_ES}"',g' >> ~/ds-Generated

# add Redis if 3.0.0
if [ $NAK_SOLUTION_RELEASE_HANELLY = "3.0.0" ]
then
  sudo cat dsService-Redis >> ~/ds-Generated
fi

# always add iDoc Listener except for DemoHTTP and DemoHTTPS
if [ $NAK_INSTALLATION_TYPE != "MicroHTTP" ] && [ $NAK_INSTALLATION_TYPE != "MiniHTTP" ] && 
   [ $NAK_INSTALLATION_TYPE != "DemoHTTP"  ] && [ $NAK_INSTALLATION_TYPE != "DemoHTTPS" ]
then
  sudo cat dsService-iDocListener | sed 's,<NAK_IMAGE_IDOC_LISTENER>,'"${NAK_IMAGE_IDOC_LISTENER}"',g' >> ~/ds-Generated
fi

# add Backup & Restore for all customer installation types
if [ $NAK_INSTALLATION_TYPE != "MicroHTTP" ] && [ $NAK_INSTALLATION_TYPE != "MiniHTTP" ] && 
   [ $NAK_INSTALLATION_TYPE != "DemoHTTP"  ] && [ $NAK_INSTALLATION_TYPE != "DemoHTTPS" ]
   [ $NAK_INSTALLATION_TYPE != "Training"  ] && [ $NAK_INSTALLATION_TYPE != "XSmallUnmonitored" ]
then
echo ''
# sudo cat dsService-BackupRestore | sed 's,<NAK_IMAGE_BACKUP_RESTORE>,'"${NAK_IMAGE_BACKUP_RESTORE}"',g' | sed 's,<NAK_IMAGE_TASK_MANAGER>,  '"${NAK_IMAGE_TASK_MANAGER}  "',g' >> ~/ds-Generated
fi

# add Monitoring for all customer installation types
if [ $NAK_INSTALLATION_TYPE != "MicroHTTP" ] && [ $NAK_INSTALLATION_TYPE != "MiniHTTP" ] && 
   [ $NAK_INSTALLATION_TYPE != "DemoHTTP"  ] && [ $NAK_INSTALLATION_TYPE != "DemoHTTPS" ] &&
   [ $NAK_INSTALLATION_TYPE != "Training"  ] && [ $NAK_INSTALLATION_TYPE != "XSmallUnmonitored" ]
then
  sudo cat dsService-Monitoring | sed 's,<NAK_IMAGE_CADVISOR>,'"${NAK_IMAGE_CADVISOR}"',g' | sed 's,<NAK_IMAGE_DBMONITOR>,'"${NAK_IMAGE_DBMONITOR}"',g' | sed 's,<NAK_IMAGE_PROMETHEUS>,'"${NAK_IMAGE_PROMETHEUS}"',g' | sed 's,<NAK_IMAGE_GRAFANA>,'"${NAK_IMAGE_GRAFANA}"',g' >> ~/ds-Generated
fi

sudo mv ~/ds-Generated /nakisa/app/hanelly/ds-Hanelly-$NAK_SOLUTION_RELEASE_HANELLY-$NAK_INSTALLATION_TYPE.yml
