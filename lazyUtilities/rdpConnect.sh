#!/bin/bash

read -p "ENTER IP: " IP

read -p "ENTER PORT (default is 3389): " PORT
PORT=${PORT:-3389}  # Use 3389 if no port is entered

read -p "ENTER USERNAME: " UNAME

read -p "ENTER PASSWORD: " PASSWORD
echo ""

echo -e "\nConnecting to $IP:$PORT as $UNAME..."

xfreerdp3 /v:$IP:$PORT /u:$UNAME /p:$PASSWORD /cert:ignore /clipboard +fonts +compression /size:1600x900

