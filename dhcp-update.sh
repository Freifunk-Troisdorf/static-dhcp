#!/bin/sh
cd /opt/freifunk/static-dhcp
git checkout master
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
        git checkout fallback
        exit 1;
else
        /etc/init.d/isc-dhcp-server restart
fi
