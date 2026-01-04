#!/bin/bash

echo "Enter port for reverse shell: "

read PORT

sudo rlwrap nc -lnvp $PORT
