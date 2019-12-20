#!/bin/bash
user=$1

if [ "$#" -eq 0 ]; then
    echo "too few parameters"
elif [ "$#" -gt 1 ]; then
    echo "too many parameters"
elif [ -d "$user" ]; then
	echo "the directory $user already exists"
else
	 mkdir "$user"
	echo "Everything went Well"

fi


