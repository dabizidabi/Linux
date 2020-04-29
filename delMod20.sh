#!/bin/bash

for ((i = 0; i <= 20; i = i + 1)); do
	dem=$((i % 5))
	if (( dem == 0 )); then
		printf "<%d> " "$i" 
	else
		printf "%d " "$i"
	fi
done
printf "\n"
