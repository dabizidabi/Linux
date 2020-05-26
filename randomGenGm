#!/bin/bash

Biggest=100
input=0
count=0
number=$(( $RANDOM % $Biggest + 1))

while [[ $input -ne $number ]] ; do
	echo -n "Write your number in diapasone 1 to $Biggest: "
	read input
	if [[ $input -gt $number ]]; then
		echo "Number is smaller $input"
	elif [[ $input -lt $number ]]; then
		echo "Number is bigger $input"
	fi
	count=$(( $count + 1 ))
done
echo "You Guessed $input in $count guesses."

exit 0
	
