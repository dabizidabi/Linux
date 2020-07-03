#!/bin/bash

DELAY=10

while [ "$INPUT" != 0 ]; do
	clear
	cat <<- _EOF_
		1. OS Type.
		2. Free disck space.
		3. Network config.
		4. Users in the system.
		0. Exit.
	_EOF_
	
	read -p "Choose the item beach - fucking ass: " INPUT
		
	if [[ $INPUT =~ ^[0-4]$ ]]; then
		if [ $INPUT = 1 ]; then
			cat /etc/os-release
			sleep $DELAY
		fi

		
		if [ $INPUT = 2 ]; then
			df -h
			sleep $DELAY
		fi
	
		if [ $INPUT = 3 ]; then
			ip a | grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
			sleep $DELAY
		fi
		
		if [ $INPUT = 4 ]; then
			cat /etc/passwd | cut -f 1 -d : | sort
			sleep $DELAY
		fi
	else
		echo "Write number of diapasone beach!"	
			sleep $DELAY
	fi
done


