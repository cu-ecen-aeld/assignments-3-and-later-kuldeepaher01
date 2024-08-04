#!/bin/bash

if [ $# -lt 2 ]
then
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

dirname=$(dirname $writefile)
if [ ! -d $dirname ]
then
    mkdir -p $dirname
    if [ $? -ne 0 ]
    then
        echo "Error creating directory $dirname"
        exit 1
    fi
fi
echo "$writestr" > $writefile

if [ $? -ne 0 ]
then
    echo "Error creating file $writefile"
    exit 1
fi

exit 0
END