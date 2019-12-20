
#!/bin/bash
if ! [ -p "server.pipe" ]; then
	mkfifo server.pipe
fi


while true; do
read id command user service payload <server.pipe
case "$command" in
init)

if [ "$user" = "" ]; then
	echo "Too few parameters" > "$id"

elif [ "$service" != "" ]; then
	echo "Too many parameters" > "$id"
else
	./init.sh "$user" > "$id" &
fi
;;
insert)

if [ "$user" = "" ]; then
	echo "too few parameters" > "$id"

else
	./insert.sh "$user" "$service" "$payload" > "$id" &

fi
;;

show)

if [ "$user" = "" ]; then
	echo "Too few parameters" > "$id"
else
	./show.sh "$user" "$service" > "$id" &
fi
;;

update)
if [ "$user" = "" ]; then
	echo "Too few parameters" > "$id"
else
	./insert.sh "$user" "$service" "f" "$payload" > "$id" &
fi
;;

rm)
if [ "$user" = "" ]; then
	echo "Too few parameters" > "$id"
else
	./rm.sh "$user" "$service" > "$id" &

fi
;;

ls)
if [ "$user" = "" ]; then
	echo "Too few parameters" > "$id"
else
#	echo "hello" > "$id"
	./ls.sh "$user" > "$id" &
fi
;;

shutdown)
echo "server shutdown successfully" > "$id"
rm server.pipe
exit 0
;;

*)
	echo "Error: bad request" > "$id"
        exit 1
	;;
	esac
done


