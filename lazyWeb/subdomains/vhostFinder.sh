#!/bin/bash

WORDLIST="/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt"

echo "Enter http://[IP]: "

read IP

echo "Enter (FUZZ.subdomain.com) target: "

read TARGET

ffuf -u $IP -w $WORDLIST -H "Host: $TARGET" -t 50 -fs 0
