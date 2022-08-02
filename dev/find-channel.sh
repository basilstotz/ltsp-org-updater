#!/bin/sh


find_channel(){
ONE=-1
TWO=-1

uhu=$(nmcli -t -f SIGNAL,CHAN dev wifi list |sed -e"s/:/ /g"|sort -g -r |  while read -r SIGNAL CHANNEL; do
    #echo -1
    if test $CHANNEL -lt 12;then
	#echo $SIGNAL $CHANNEL
        if test $ONE -eq -1; then
	    ONE=$CHANNEL;
	    echo $(( CHANNEL / 4 )) 
	else    
	    if ! test $CHANNEL -eq $ONE; then
		if test $TWO -eq -1; then
		    TWO=$CHANNEL;
		    echo $(( CHANNEL / 4 ))
		fi
	    fi
        fi
    fi
done)

num=$(shuf -i 0-2 -n1)
while echo "$uhu" | grep  -q "$num"; do
    num=$(shuf -i 0-2 -n1)
    #echo -n "$num "
done

case $num in
    0)
	echo 1
	;;
    1)
	echo 6
	;;
    2)
	echo 11
	;;
    *)
	echo 11
	;;
esac
}


find_channel


    





