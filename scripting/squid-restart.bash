#!/bin/bash
# Author: Mykola Zoshchuk
# Create date: 03/02/2021
# Description: Restart squids in itgate-b and itgate-c
# Modify: 03/02/2021

kill -9 $(head -1 /opt/squid/var/run/squid.pid)
        if [ $? -eq 0 ]
        then
        printf "\e[40;0;32mSquid in $HOSTNAME stopped\e[40;0;37m\n"
        printf "Starting squid...\n"
        sleep 1
        /opt/squid/sbin/squid
                if [ $? -eq 0 ]
                then
                printf "\e[40;0;32mOK, squid in $HOSTNAME running now\e[40;0;37m\n"
                sleep 1
                printf "\e[40;0;32mSquid PID is $(cat /opt/squid/var/run/squid.pid)\e[40;0;37m\n"
                else
                printf "\e[40;0;31mSquid in $HOSTNAME NOT running\e[40;0;37m\n"
                exit 1
                fi
        else
        printf "\e[40;0;31mSquid in $HOSTNAME not stopped\e[40;0;37m\n"
        exit 1
        fi

ssh 172.16.1.8 '/opt/squid/etc/lists/squid_restart_itgate-c.bash'
