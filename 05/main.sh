#!/bin/bash
re='.*/$'
export start=$(date +%s%N)

if [[ $# != 1 ]]
then
    echo "Error, only one argument"
    exit 1
fi

if [[ -d "$1" ]]
then
    if [[ $1 =~ $re ]]
    then
        chmod +x func.sh
        bash func.sh $1
    else
        echo -e "\033[101m$1\e[0m - must end with a '/'"
        exit 1 
    fi
else 
    echo "Error, file not exists"
    exit 1
fi