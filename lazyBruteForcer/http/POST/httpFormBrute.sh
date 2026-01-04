#!/bin/sh

WORDLIST="/usr/share/wordlists/rockyou.txt"

echo "ENTER IP: "

read IP

echo "ENTER PORT: "

read PORT

echo "ENTER USERNAME: "

read USERNAME

echo "Enter Directory to login panel only: "

read DIR

echo "Enter parameters (user=^USER^&pass=^PASS^): "

read PARAMS

echo "Enter error message: "

read MESSAGE

hydra -f -l $USERNAME -P $WORDLIST $IP -s $PORT http-post-form "$DIR:$PARAMS:F=$MESSAGE" -vV -t 4 

