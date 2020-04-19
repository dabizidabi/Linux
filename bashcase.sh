#!/bin/bash

case $1 in
        -t) date
                ;;
        -a) ls -l
                ;;
        -b) ll
                ;;
esac
