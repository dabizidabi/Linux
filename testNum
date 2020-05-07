#!/bin/bash 

testNum () {
	if [[ $1 =~ ^-?[0-9]+[.,][0-9]+ ]]; then
		echo "$1 its float"
	else
		echo "$1 its integer"
	fi
}

echo "write Number"
read number
testNum $number
