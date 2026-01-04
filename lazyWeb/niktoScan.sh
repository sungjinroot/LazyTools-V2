#!/bin/bash

echo "Enter IP/DOMAIN you wish to scan: "

read TARGET 

nikto -h $TARGET