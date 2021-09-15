#!/bin/sh
# Author: Mykola Zoshchuk
# Create date: 15/09/2021
# Description: This scrip will delete all app files (exec*, wktemp*, open-uri*) in /tmp directory if disk usage > 85%
# Modify: 15/09/2021


CURRENT_USAGE=$(df -H | grep '/dev/vda*' | awk '{print $5}' | cut -d'%' -f1)
ALERT_ON=85

if [ "$CURRENT_USAGE" -ge "$ALERT_ON" ]; then
   echo "`date` deleting app files" >> /var/log/app_delete_files.log
   find /tmp -maxdepth 1 -mmin +15 -type f \( -name 'exec*' -o -name 'wktemp*' -o -name 'open-uri*' \) -exec rm -f {} \;
   if [ $? -eq 0]; then
      echo "Error can't detele files" >> /var/log/app_delete_files.log
      exit 1
   fi
fi
