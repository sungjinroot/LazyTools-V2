#!/bin/bash

DOMAINS="/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt"

echo "Enter domain (FUZZ.domain.com): "

read TARGET

sudo ffuf -u "$TARGET" -w $DOMAINS -t 50
