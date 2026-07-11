#!/bin/bash

DOMAINS="/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt"

echo "Enter domain (FUZZ.domain.com): "

read TARGET

echo "Any filters? yes | no"

read OPTION

if [ $OPTION == 'yes' ] 
then
    echo "Enter your desired filter: (-fc, etc...)"

    read FILTER

    sudo ffuf -u "$TARGET" -w $DOMAINS -t 50 $FILTER
else

    sudo ffuf -u "$TARGET" -w $DOMAINS -t 50
fi