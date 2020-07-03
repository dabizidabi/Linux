#!/bin/bash

cat /etc/passwd | sort | 
	while read LINE
	do
 		login=`echo "$LINE" | cut -f 1 -d :`
	       	home=`echo "$LINE" | cut -f 6 -d :`
		echo -e "${login}\t${home}"
	done	
