#!/bin/bash
#easy prove
INT=$1
MAX=50
MIN=1

if [[ $INT =~ ^-?[0-9]+$ ]]; then
        if [[ $INT -le $MAX && $INT -ge $MIN ]]; then
                echo "$INT is in diapasone 0-50"
        elif [[ $INT = 0 ]]; then
                echo "INT is zero"
        elif [[ $INT =~ ^-?0+$ ]]; then
                echo "INT zeerrrrooo"
        else
                echo "INT isnt in diapasone"
        fi
else
        echo "INT is no integer" 
fi

