#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "too few parameters"
elif [ "$#" -gt 2 ]; then
    echo "too many parameters"
elif ! [ -d "$1" ]; then
	echo "The user  $1 does not exist!"
else
	./p.sh "$1"
	if ! [ -f "$1/$2" ]; then
		echo " The service $2 does not exist!"
	else
		rm "$1/$2"
		echo "Everything went Well"
	fi

fi
./v.sh "$1"
