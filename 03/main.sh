#!/bin/bash
. ./func.sh
if [ $# -ne 4 ]; then
echo "Incorrect number of args, need 4."
exit;
fi
if [ $1 -eq $2 ] || [ $3 -eq $4 ]; then
echo "Error: background and front colors are similar. Try again."
exit;
fi

data $1 $2 $3 $4