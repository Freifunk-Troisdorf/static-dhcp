#!/bin/sh
cd /opt/freifunk/static-dhcp
git remote update
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
data=`cat ./static.conf | sort | uniq -d`
if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
    exit 0
else
    echo "Need to pull"
    git pull
fi
if [ ${#data} -gt 1 ]; then
        exit 1;
else
        /etc/init.d/isc-dhcp-server restart
fi
