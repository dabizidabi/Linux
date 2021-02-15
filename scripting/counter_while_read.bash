#!/bin/bash

#Author: Mykola Zoshchuk
#Create date: 15/02/2021
#Description: Test script with counter variable
#Modify: 15/02/2021

counter=0

while [ $counter -lt 50 ]
do
        let counter=counter+1
        name=$(nl names.txt | grep -w $counter | awk '{print $2}')
        lastname=$(nl names.txt | grep -w $counter | awk '{print $3}')
        echo "$name,$lastname"
done
