#!/bin/bash
. ./func.sh
foreKeyColor=$(chooseColor 1);
backKeyColor=$(chooseColor 2);
foreValColor=$(chooseColor 3);
backValColor=$(chooseColor 4);
data
echo ""
echo "Column 1 background = $(isPrintDefault ${isDefaultFlag[0]})(${colorStringArray[$backKeyColor - 1]})"
echo "Column 1 font color = $(isPrintDefault ${isDefaultFlag[1]})(${colorStringArray[$foreKeyColor - 1]})"
echo "Column 2 background = $(isPrintDefault ${isDefaultFlag[2]})(${colorStringArray[$backValColor - 1]})"
echo "Column 2 font color = $(isPrintDefault ${isDefaultFlag[3]})(${colorStringArray[$foreValColor - 1]})"
