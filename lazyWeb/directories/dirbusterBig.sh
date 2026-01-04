#!/bin/bash

COMMON="/usr/share/wordlists/dirb/common.txt"

DIR="/usr/share/seclists/Discovery/Web-Content/DirBuster-2007_directory-list-2.3-big.txt"
RAFT="/usr/share/seclists/Discovery/Web-Content/raft-large-directories.txt"

echo "Enter website with keyword FUZZ (https://domain.com/FUZZ)"

read DOMAIN

echo "Do you have cookies (yes | no): "

read ANSWER

if [ $ANSWER == "yes" ]; then
    echo "Enter cookie value (NAME=VALUE1; NAME2=VALUE2; NAME3=VALUE3): "
    
    read COOKIE

    sudo ffuf -u $DOMAIN -w $COMMON -t 50 -e .php,.txt,.html,.zip -b "$COOKIE"

    sudo ffuf -u $DOMAIN -w $COMMON -t 50 -e .php,.txt,.html,.zip

    echo "Continue to big.txt?"

    read SKIP

    sudo ffuf -u $DOMAIN -w $DIR -t 50 -e .php,.txt,.html,.zip -b "$COOKIE"

    echo "Continue to use raft wordlist?"

    read SKIP2

    sudo ffuf -u $DOMAIN -w $RAFT -t 50 -e .php,.txt,.html,.zip -b "$COOKIE"

else
    sudo ffuf -u $DOMAIN -w $COMMON -t 50 -e .php,.txt,.html,.zip


    echo "Continue to big.txt?"

    read SKIP

    sudo ffuf -u $DOMAIN -w $DIR -t 50 -e .php,.txt,.html,.zip 


    echo "Continue to use raft wordlist?"

    read SKIP2

    sudo ffuf -u $DOMAIN -w $RAFT -t 50 -e .php,.txt,.html,.zip
fi


