#!/bin/bash

PARAMS="/usr/share/seclists/Discovery/Web-Content/raft-small-words-lowercase.txt"

echo "FUZZ is automatically appended at the end"
echo "Enter a URL to FUZZ parameters (https://www.domain.com/):"
read TARGET

echo "Do you have cookies? (yes | no)"
read ANSWER

COOKIE=""
FILTER=""

if [ "$ANSWER" = "yes" ]; then
    echo "Enter cookie value (NAME=VALUE1; NAME2=VALUE2; NAME3=VALUE3):"
    read COOKIE
fi

echo "Do you want additional filters or flags? (-fs, -fc, etc.) (yes | no)"
read OPTION

if [ "$OPTION" = "yes" ]; then
    echo "Enter additional flags:"
    read FILTER
fi

# Parameter fuzzing
if [ -n "$COOKIE" ]; then
    sudo ffuf -u "${TARGET}?FUZZ=id" \
        -w "$PARAMS" \
        -t 50 \
        -b "$COOKIE" \
        $FILTER
else
    sudo ffuf -u "${TARGET}?FUZZ=id" \
        -w "$PARAMS" \
        -t 50 \
        $FILTER
fi

echo
read -p "Continue with directory fuzzing? (y/N): " PROCEED

if [[ "$PROCEED" =~ ^[Yy]$ ]]; then
    if [ -n "$COOKIE" ]; then
        sudo ffuf -u "${TARGET}/?FUZZ=id" \
            -w "$PARAMS" \
            -t 50 \
            -b "$COOKIE" \
            $FILTER
    else
        sudo ffuf -u "${TARGET}/?FUZZ=id" \
            -w "$PARAMS" \
            -t 50 \
            $FILTER
    fi
fi