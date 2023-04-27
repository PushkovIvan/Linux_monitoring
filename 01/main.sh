#!/bin/bash
re='^[0-9]+$'
if ! [[ $1 =~ $re ]];
then 
    echo "$1"
else
    echo "Wrong input"
fi
