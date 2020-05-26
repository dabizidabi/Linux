#!/bin/bash -x
# Подсчет количества команд: простой сценарий для подсчета количества выполняемых
# команд в каталогах из списка PATH
IFS=":"
count=0 ; nonex=0
for directory in $PATH ; do
	if [ -d "$directory" ] ; then
		for files in "$directory"/* ; do
			if [ -x "$files" ] ; then
				count="$(( $count + 1 ))"
			else
				nonex="$(( $nonex + 1 ))"
			fi
		done
	fi
done

echo "$count commands, and $nonex entries that weren't executable"
exit 0
