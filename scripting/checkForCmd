#!/bin/bash

int_path ()
{
	cmd=$1
	ourpath=$2 
       	result=1
	IFS=":"

	for directory in $ourpath 
      	do
		if [ -x $directory/$cmd ]; then
			result=0
		fi
	done

	return $result
}

checkForCmdInPath ()
{
	var=$1

	if [ "$var" != " " ]; then
		if [ "${var:0:1}" = "/" ]; then
			if [ ! -x "$var"  ]; then
				return 1
			fi
		elif  ! int_path $var "$PATH" ; then
			return 2
		fi
	fi
}

if [ $# -ne 1 ]; then
	echo "Write $0 and name of program" >&2
	exit 1
fi

checkForCmdInPath $1
case $? in
	0 ) echo "$1 found in PATH" ;;
	1 ) echo "$1 file not found or it's not executable file" ;;
	2 ) echo "$2 not found in PATH" ;;
esac

exit 0
