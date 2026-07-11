#!/bin/bash

WORDLIST="/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt"

echo "Enter http://[IP]: "

read IP

echo "Any filters? yes | no"

read OPTION

if [ $OPTION == 'yes' ] 
then
    echo "Enter your desired filter: (-fc, etc...)"

    read FILTER

    echo "Enter (FUZZ.subdomain.com) target: "

    read TARGET

    ffuf -u $IP -w $WORDLIST -H "Host: $TARGET" -t 50 -fs 0 $FILTER
else


    echo "Enter (FUZZ.subdomain.com) target: "

    read TARGET

    ffuf -u $IP -w $WORDLIST -H "Host: $TARGET" -t 50 -fs 0
fi