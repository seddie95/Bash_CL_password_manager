#!/bin/bash

user="$1"
filename="$1/$2"

if [ "$#" -eq 0 ]; then
    echo "too few parameters"
elif [ "$#" -gt 4 ]; then
    echo "too many parameters"
elif ! [ -d "$1" ]; then
        echo "The user $1 does not exist!"

#updating the file if f is typed
elif [ -f "$filename" ] && [ "$3" = "f" ]; then
	echo "$4" > "$filename"
	echo updated "$filename successfully"

elif [ -f "$filename" ] && [ "$3" != "f" ]; then
        echo "The service $2 already exists!"
else
	./p.sh "$1"
		path="$(dirname "$filename")"
		# if the directory exists then add the data to the file
		if  [ -d "$path" ]; then
			echo "$3" > "$filename"
		#if the directory does not exist create it
		else
			mkdir -p "$path"
			echo "$3" > "$filename"
		fi
        	echo "Everything went Well"

        ./v.sh "$1"
fi













