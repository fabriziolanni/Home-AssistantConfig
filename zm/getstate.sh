#!/bin/bash
zmdbuser=cat /etc/zm/zm.conf | grep ZM_DB_USER | awk -F= '{print $2}' | tr -d ' '
zmdbpass=cat /etc/zm/zm.conf | grep ZM_DB_PASS | awk -F= '{print $2}' | tr -d ' '
runstate=mysql -N -B -u$zmdbuser -p$zmdbpass zm -e "select Name from States where isActive=1 LIMIT 1;"
echo $runstate