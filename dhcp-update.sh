#!/bin/sh
cd /opt/freifunk/static-dhcp
git remote update
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
data=`cat ./static.conf.template | sort | uniq -d`
if [ $LOCAL = $REMOTE ]; then
    cp ./static.conf.template ./static.conf
    echo "Up-to-date"
    exit 0
else
    echo "Need to pull"
    git pull
fi
if [ ${#data} -gt 1 ]; then
    exit 1;
else
    cp ./static.conf.template ./static.conf
    /etc/init.d/isc-dhcp-server restart
fi
