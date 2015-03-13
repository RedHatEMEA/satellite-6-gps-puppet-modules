#!/bin/bash
# This file is centrally managed by puppet
for user in `/bin/awk -F: '($3 < 500) {print $1 }' /etc/passwd`
do
  if [ $user != "root" ]
  then
    /usr/sbin/usermod -L $user
    if [ $user != "sync" ] && [ $user != "shutdown" ] && [ $user != "halt" ]
    then
      /usr/sbin/usermod -s /sbin/nologin $user
    fi
  fi
done
