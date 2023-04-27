#!/bin/bash
function data {
echo "HOSTNAME = $(hostname)"
echo "TIMEZONE = UTC $(date +"%z")"
echo "USER = $(whoami)"
echo "OS = $(cat /etc/os-release | head -1 | cut -c14-140 | sed 's/\"//g')"
echo "DATE = $(date | awk '{print $3 " " $2  " " $7  " "  $4}')"
tmp=$(printf "%.0f" $(cat /proc/uptime | awk '{print $1}'))
echo "UPTIME = $(($tmp / 3600))[hour]  $(($tmp % 3600 / 60))[min] $(($tmp % 60))[sec]"
echo "UPTIME_SEC = $tmp"
echo "IP = $(echo $(hostname -I) | awk '{print $2}')"
echo "MASK = $(ifconfig | grep "mask" | head -1 | awk '{print $ 4}')"
echo "GATEWAY = $(ip route | grep "default" | awk '{print $4}')"
total=$(cat /proc/meminfo | head -1 | awk '{print $2}')
echo "RAM TOTAL= $(bc <<< "scale=3; $total / 1000000") GB"
free=$(cat /proc/meminfo | sed -n '2p' | awk '{print $2}')
echo "RAM USED = $(bc <<< "scale=3; $(($total - $free)) / 1000000") GB" #?
echo "RAM_FREE = $(bc <<< "scale=3; $free / 1000000") GB" #?
echo "SPACE_ROOT = $(bc <<< "scale=2; $(df . | awk '{print $2}' | sed -n '2p') / 1000") MB"
echo "SPACE_ROOT_USED = $(bc <<< "scale=2; $(df . | awk '{print $3}' | sed -n '2p') / 1000") MB"
echo "SPACE_ROOT_FREE = $(bc <<< "scale=2; $(df . | awk '{print $4}' | sed -n '2p') / 1000") MB"
}