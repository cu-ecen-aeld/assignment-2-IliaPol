#!/bin/bash



if [ $# != 2 ]
then
	echo "Invalid Number of Argumetns. Should be 2"
	exit 1
fi

filesdir=$1
searchstr=$2


if [ -d "$filesdir" ]
then
	number_of_files=$(find "$filesdir" -type f | wc -l)
	number_of_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)
	echo "The number of files are $number_of_files and the number of matching lines are $number_of_lines"
	exit 0
else
	echo "$filesdir doesn't directory"
	exit 1
fi


