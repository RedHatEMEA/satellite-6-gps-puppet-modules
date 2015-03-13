#!/bin/bash
# This file is centrally managed by puppet

/bin/egrep -v "^\+" /etc/passwd | /bin/awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $3<500 && $7!="/sbin/nologin") {print}' 
RET_STAT=$?
if [ $RET_STAT -eq 0 ]
then
  exit 1
else
  exit 0
fi
