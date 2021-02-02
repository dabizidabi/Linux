#!/bin/bash
#Author:
#Create date:
#Description:
#Modify:

hosts=/home/user/hosts

for ip in $(cat $hosts)
do
        ping -c 2 $ip &>/dev/null
                if [ $? -eq 0 ]
                then
                        echo OK
                else
                        echo Not Ok
                fi
done
