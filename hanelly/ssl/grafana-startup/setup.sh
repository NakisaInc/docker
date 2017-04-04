#!/bin/bash

# If edited in windows, please make sure that \r\n is replaces by \n
# http://stackoverflow.com/questions/11341660/change-eol-on-multiple-files-in-one-go


# cd /var/lib/nakisa
# chmod +x setup.sh
# ./setup.sh

/run.sh &

sleep 5

apt-get update
apt-get -y --no-install-recommends install curl

# Add datasource
curl -vX POST http://admin:admin@localhost:3000/api/datasources -d @/var/lib/nakisa/prometheus.json --header "Content-Type: application/json"

# Adding dashboards
curl -vX POST http://admin:admin@localhost:3000/api/dashboards/db -d @/var/lib/nakisa/testdashboard.json --header "Content-Type: application/json"
#curl -vX POST http://admin:admin@localhost:3000/api/dashboards/db -d @testdashboard.json --header "Content-Type: application/json"
#curl -vX POST http://admin:admin@localhost:3000/api/dashboards/db -d @testdashboard.json --header "Content-Type: application/json"
#curl -vX POST http://admin:admin@localhost:3000/api/dashboards/db -d @testdashboard.json --header "Content-Type: application/json"

# do not exit or the container will exit :)
sleep infinity
