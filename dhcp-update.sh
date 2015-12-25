#!/bin/sh
cd /opt/freifunk/static-dhcp
git remote update
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    git pull
    /etc/init.d/isc-dhcp-server restart
else
    echo "Nothing"
fi