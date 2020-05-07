#!/bin/bash

removelog="/var/log/remove.log"

if [ $# -eq 0 ]; then
	echo "Usage: $0 [-s] for delete files" >&2
	exit 1
fi

if [ "$1" = "-s"  ]; then
	shift
else
	echo "$(date): ${USER}: $@" >> $removelog
fi

/bin/rm $@

exit 0 
