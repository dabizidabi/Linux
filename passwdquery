#!/bin/bash

FILE=/etc/passwd

read -p "Enter username: " user_name

info=$(grep "^$user_name": $FILE)

if [ -n "$info" ]; then
	IFS=":" read user pw uid gid name home shell <<< "$info"
	echo "USER = $user"
	echo "PW = $pw"
	echo "UID = $uid"
	echo "GID = $gid"
	echo "NAME = $name"
	echo "HOME = $home"
	echo "SHELL = $shell"
else
	echo ""$user_name" is not avaliable"
fi
