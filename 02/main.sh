#!/bin/bash
. ./func.sh
data
echo "Save info on file?"
echo "Push Y or y, if you want"
read button
if [ $button = "Y" ]; then
tmp=$(date "+%d_%m_%y_%H_%M_%S".status)
touch $tmp; data > $tmp
elif [ $button = "y" ]; then
tmp=$(date "+%d_%m_%y_%H_%M_%S".status)
touch $tmp; data > $tmp
else
echo "You don't push Y or y"
fi