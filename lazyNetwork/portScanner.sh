#!/bin/bash

echo "Enter IP address: "
read IP

sudo nmap -sS -sV -sC -vv -T4 --min-parallelism=64 -Pn -p- -O $IP