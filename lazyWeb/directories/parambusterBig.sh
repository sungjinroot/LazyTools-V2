#!/bin/bash

PARAMS="/usr/share/seclists/Discovery/Web-Content/raft-small-words-lowercase.txt"

echo "FUZZ is automatically appended at the end" 
echo "Enter a URL to FUZZ parameters: (https://www.domain.com/)"

read TARGET

echo "Do you have cookies (yes | no): "

read ANSWER


if [ $ANSWER == "yes" ]; then
    echo "Enter cookie value (NAME=VALUE1; NAME2=VALUE2; NAME3=VALUE3): "
    
    read COOKIE

    sudo ffuf -u "$TARGET?FUZZ=id" -w $PARAMS -t 50 -fs 0 -b "$COOKIE"

    echo "Continuing a directory version... proceed? "

    sudo ffuf -u "$TARGET/?FUZZ=id" -w $PARAMS -t 50 -fs 0 -b "$COOKIE"
else
    sudo ffuf -u "$TARGET?FUZZ=id" -w $PARAMS -t 50 -fs 0

    echo "Continuing a directory version... proceed? "

    sudo ffuf -u "$TARGET/?FUZZ=id" -w $PARAMS -t 50 -fs 0
fi
