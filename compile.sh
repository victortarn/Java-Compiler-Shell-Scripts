#!/bin/bash

if test "$#" -gt 1; then
    echo 'Error: Illegal number of arguments' >/dev/stderr
    exit 1    
elif [ ! -f "$1" ] && [ ! -z "$1" ]; then
    echo "$1 does not exist" >/dev/stderr
    exit 2
fi

error=$(fake_javac.sh $1 2>&1 >/dev/stderr)

if test "$?" -eq 0; then
    echo "$1 compiled successfully"
    exit 0
elif test "$#" -eq 0; then
    echo "$error"
    exit 2
else
    echo "$1 did not compile" >/dev/stderr
    echo "$error"
    exit 3
fi