#!/bin/bash

filesdir=$1
searchstr=$2

# Check if the number of arguments is less than 2
if [ $# -lt 2 ]
then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

if [ ! -d ${filesdir} ]
then
    echo "$filesdir is not a directory"
    exit 1
fi

# Find the number of files in the directory and all subdirectories
numfiles=$(find $filesdir -type f | wc -l)

# Find the number of matching lines in the files
nummatchinglines=$(grep -r $searchstr $filesdir | wc -l)

if [ $nummatchinglines -eq 0 ]
then
    echo "No matches found"
    exit 0
fi

echo "The number of files are $numfiles and the number of matching lines are $nummatchinglines"
exit 0
END