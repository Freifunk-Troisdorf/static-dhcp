#!/bin/bash
data=`cat ./static.conf | sort | uniq -d`
if [ ${#data} -gt 1 ]; then
        echo 1;
        exit 0;
fi
echo 0;
exit 0;
