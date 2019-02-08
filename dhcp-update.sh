#!/bin/sh
cd /opt/freifunk/static-dhcp
git remote update
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
if [ $LOCAL = $REMOTE ]; then
    cp ./static.conf.template ./static.conf
    echo "Up-to-date"
    exit 0
else
    echo "Need to pull"
    git pull
fi
./check.sh
if [ $? -eq 1 ]; then
    echo "Config Fehlerhaft"
    exit 1;
else
    echo "DHCP Restart"
    cp ./static.conf.template ./static.conf
    /bin/systemctl stop isc-dhcp-server
    /bin/sleep 2
    /usr/bin/killall dhcpd
    /bin/sleep 2
    /bin/rm /var/run/dhcpd.pid
    /bin/sleep 2
    /bin/systemctl start isc-dhcp-server
fi
