#!/bin/bash
#
#Usage: has_package.sh java-file package-name

if test "$#" -eq 0; then
    echo "Usage: has_package.sh java-file package-name"
    exit 0
elif test ! "$#" -eq 2; then
    echo 'Error: Illegal number of arguments' >/dev/stderr
    exit 1 
elif [[ $2 =~ [^a-z0-9_.] ]] || [[ $2 == [0-9_.]* ]] || [[ $2 =~ ".." ]]; then
    echo "$2 is not a conventional Java package name" >/dev/stderr
    exit 2
fi

if [ -e "$2/$1" ]; then
    echo "$1 is in package $2"
    exit 0
else 
    echo "$1 not found in package $2" >/dev/stderr
    exit 3
fi