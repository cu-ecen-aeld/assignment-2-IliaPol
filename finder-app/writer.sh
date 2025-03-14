#!/bin/bash



if [ $# != 2 ]
then
	echo "Invalid Number of Argumetns. Should be 2"
	exit 1
fi

writefile=$1
writestr=$2

directory=$(dirname "$writefile")


if [ ! -d "$directory" ]
then
	mkdir -p "$directory"
fi

if [ $? != 0 ]
then
	echo "failed to create directory"
	exit 1
fi
	
echo "$writestr" > "$writefile"
