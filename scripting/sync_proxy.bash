#!/bin/bash
# Author: Mykola Zoshchuk
# Create date: 03/02/2021
# Description: Synchronization squid lists files and restart squid on itgate-b and itgate-c
# Modify: 03/02/2021

printf "\e[40;0;32mStarting synchronization\e[40;0;37m\n"
rsync -avh  /opt/squid/etc/lists/* 172.16.1.8:/opt/squid/etc/lists/
        if [ $? -eq 0 ]
        then
        printf "\e[40;0;32mSynchronization successful\e[40;0;37m\n"
        else
        printf "\e[40;0;31mSynchronization failed\e[40;0;37m\n"
        fi

while [ "$INPUT" != n ]
do
read -p "Want restart squids? (y/n): " INPUT
        if [ $INPUT = y ]
        then
        /opt/squid/etc/lists/squid-restart.bash
        exit 0
        else
        echo 'Write "y" or "n"'
        fi
done
printf "\e[40;0;32mOK\e[40;0;37m\n"
