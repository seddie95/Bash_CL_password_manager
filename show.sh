#!/bin/bash
#check to see if file or directory exist
if [ "$#" -lt 2 ]; then
    echo "too few parameters"

elif [ "$#" -gt 2 ]; then
    echo "too many parameters"

elif ! [ -d "$1" ]; then
        echo "The user $1 does not exist!"

elif ! [ -f "$1/$2" ]; then
        echo "The service $2 does not exist!"
else
# echo the contents of the file
	cat "$1/$2"
fi
