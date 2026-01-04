#!/bin/bash

echo "CIDR RANGE TOOL"
echo "Enter an IP address: "
read IP

sudo nmap $IP/24 -PE -sn -PA21,22,80,443 -T 4 -vv --min-parallelism=64 --open 2>/dev/null | grep "Nmap scan report for" | awk '{print $5}'
