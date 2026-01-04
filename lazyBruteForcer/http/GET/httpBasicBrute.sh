#!/bin/sh

WORDLIST="/usr/share/wordlists/rockyou.txt"

echo "ENTER IP: "

read IP

echo "ENTER PORT: "

read PORT

echo "ENTER USERNAME: "

read USERNAME

echo "Enter Directory to brute (/login or /): "

read DIR

hydra -f -l $USERNAME -P $WORDLIST $IP -s $PORT http-get $DIR -vV -t 4 

