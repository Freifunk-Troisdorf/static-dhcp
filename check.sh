#!/bin/bash
data=`cat ./static.conf | sort | uniq -d`
if [ ${#data} -gt 1 ]; then
        exit 1;
fi
exit 0;
