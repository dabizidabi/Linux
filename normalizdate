#!/bin/bash

MounthToDate ()
{
case $1 in
	1 ) mounth="Jan" ;;
	2 ) mounth="Feb" ;;
	3 ) mounth="Mar" ;;
	4 ) mounth="Apr" ;;
	5 ) mounth="May" ;;
	6 ) mounth="Jun" ;;
	7 ) mounth="Jul" ;;
	8 ) mounth="Aug" ;;
	9 ) mounth="Sep" ;;
	10 ) mounth="Oct" ;;
	11 ) mounth="Nov" ;;
	12 ) mounth="Dec" ;;
	* ) echo "Uknown mount value $1" >&2
		exit 1
esac
}

if [ $# -ne 3 ]; then
	echo "Use Mounth Day Year\n
	for example: 4 25 2020" >&2
	exit 1
fi

if [[ $1 =~ [0-9][0-9]? ]]; then
	MounthToDate $1
else 
	mounth="$(echo $1 | cut -c1 | tr '[:lower:]' '[:upper:]')"
	mounth="$mounth$(echo $1 | cut -c2-3 | tr '[:upper:]' '[:lower:]')"
fi

echo $mounth $2 $3

exit 0

