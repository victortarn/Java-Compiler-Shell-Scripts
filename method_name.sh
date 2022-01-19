#!/bin/bash

if test "$#" -eq 0; then
    echo "Usage: method_name.sh java-file package-name"
    exit 0
elif test ! "$#" -eq 1; then
    echo 'Error: Illegal number of arguments' >/dev/stderr
    exit 1
else
    awk '/public/ && /static/ {print $4}' $1 | cut -f1 -d"("
    exit 0
fi