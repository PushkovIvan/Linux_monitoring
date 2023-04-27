#!/bin/bash
function setColor()
{
    local color;
 if [ $2 = "FOREGROUND" ]; then
    case $1 in
        "1" )     color='\033[39m';;
        "2" )     color='\033[31m';;
        "3" )     color='\033[32m';;
        "4" )     color='\033[34m';;
        "5" )     color='\033[35m';;
        "6" )     color='\033[30m';;
    *) color='\033[0m';;
    esac
else
    case $1 in
        "1" )     color='\033[49m';;
        "2" )     color='\033[41m';;
        "3" )     color='\033[42m';;
        "4" )     color='\033[44m';;
        "5" )     color='\033[45m';;
        "6" )     color='\033[40m';;
    *) color='\033[0m';;
    esac
fi
echo $color
}

function data {
keyColor="$(setColor $2 FOREGROUND)$(setColor $1 BACKGROUND)"
valColor="$(setColor $4 FOREGROUND)$(setColor $3 BACKGROUND)"
defColor="\033[0m"
echo -e "${keyColor}HOSTNAME =${valColor}$(hostname)${defColor}"
echo -e "${keyColor}TIMEZONE =${valColor}  UTC $(date +"%z")${defColor}"
echo -e "${keyColor}USER =${valColor} $(whoami)${defColor}"
echo -e "${keyColor}OS =${valColor} $(cat /etc/os-release | head -1 | cut -c14-140 | sed 's/\"//g')${defColor}"
echo -e "${keyColor}DATE =${valColor} $(date | awk '{print $3 " " $2  " " $7  " "  $4}')${defColor}"
tmp=$(printf "%.0f" $(cat /proc/uptime | awk '{print $1}'))
echo -e "${keyColor}UPTIME =${valColor} $(($tmp / 3600))[hour]  $(($tmp % 3600 / 60))[min] $(($tmp % 60))[sec]${defColor}"
echo -e "${keyColor}UPTIME_SEC =${valColor} $tmp${defColor}"
echo -e "${keyColor}IP =${valColor} $(echo $(hostname -I) | awk '{print $2}')${defColor}"
echo -e "${keyColor}MASK =${valColor} $(ifconfig | grep "mask" | head -1 | awk '{print $ 4}')${defColor}"
echo -e  "${keyColor}GATEWAY =${valColor} $(ip route | grep "default" | awk '{print $4}')${defColor}"
total=$(cat /proc/meminfo | head -1 | awk '{print $2}')
echo -e "${keyColor}RAM TOTAL=${valColor} $(bc <<< "scale=3; $total / 1000000") GB${defColor}"
free=$(cat /proc/meminfo | sed -n '2p' | awk '{print $2}')
echo -e "${keyColor}RAM USED =${valColor} $(bc <<< "scale=3; $(($total - $free)) / 1000000") GB${defColor}" #?
echo -e "${keyColor}RAM_FREE =${valColor}  $(bc <<< "scale=3; $free / 1000000") GB${defColor}" #?
echo -e "${keyColor}SPACE_ROOT =${valColor}  $(bc <<< "scale=2; $(df . | awk '{print $2}' | sed -n '2p') / 1000") MB${defColor}"
echo -e "${keyColor}SPACE_ROOT_USED =${valColor} $(bc <<< "scale=2; $(df . | awk '{print $3}' | sed -n '2p') / 1000") MB${defColor}"
echo -e "${keyColor}SPACE_ROOT_FREE =${valColor} $(bc <<< "scale=2; $(df . | awk '{print $4}' | sed -n '2p') / 1000") MB${defColor}"
}

