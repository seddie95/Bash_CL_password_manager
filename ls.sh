#!/bin/bash
if [ "$#" -eq 0 ]; then
	echo "Too few parameters"

elif [ "$#" -gt 2 ]; then
        echo "Too many parameters"

elif ! [ -d "$1" ]; then
	echo "user $1 does not exist"

elif [ "$#" -eq 1 ]; then
       tree  "$1"
else
	if ! [ -d "$1/$2" ]; then
		echo "Directory $1/$2 does not exist"
	else
		 tree "$1/$2"

	fi
fi
