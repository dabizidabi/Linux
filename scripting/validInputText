#!/bin/bash

validTextInput ()
{
	if [[ $1 =~ ^[A-Za-z]+$ ]]; then
		return
       	else
 		false	
	fi
}

/bin/echo "Input some text: "
read input

if ! validTextInput "$input" ; then
	echo "Input only letters" >&2
	exit 1
else
	echo "Input is valid"
fi

exit 0
