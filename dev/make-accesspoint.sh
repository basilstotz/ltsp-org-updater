#!/bin/sh


Cmdline ()
{
	# Reading kernel command line
	for _PARAMETER in $(cat /proc/cmdline)
	do
		case "${_PARAMETER}" in
			live-config.hotspot=*|hotspot=*)
				LIVE_HOTSPOT="${_PARAMETER#*hotspot=}"
				;;
		esac
	done
}


find_channel(){
ONE=-1
TWO=-1

uhu=$(nmcli -t -f SIGNAL,CHAN dev wifi list |sed -e"s/:/ /g"|sort -g -r |  while read -r SIGNAL CHANNEL; do
    #echo -1
    if test $CHANNEL -lt 12;then
	#echo $SIGNAL $CHANNEL
	CHANNEL=$(( CHANNEL / 4 )) 
        if test $ONE -eq -1; then
	    ONE=$CHANNEL
	    echo $CHANNEL
	else    
	    if ! test $CHANNEL -eq $ONE; then
		if test $TWO -eq -1; then
		    TWO=$CHANNEL
		    echo $CHANNEL
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

#main

Cmdline

# uncomment for tests only
LIVE_HOTSPOT="escuela,escuela0815"

#leave if not configured
test -n "$LIVE_HOTSPOT" || exit 0


#CON_NAME="Hotspot"
SSID=$(echo "$LIVE_HOTSPOT"|cut -d"," -f1)
PSK=$(echo "$LIVE_HOTSPOT"|cut -d"," -f2)
#IFNAME=$(nmcli device|grep "^wifi$"|cut -d" " -f1)

#echo $IFNAME

exit

#if test -n "$IFNAME";then
    if nm-online -s -q; then
       #nmcli con down $CONN_NAME
       if nmcli radio wifi on; then

	   #CHANNEL=$(find_channel)
	   CHANNEL=$(echo -e "1\n6\n11" | shuf -n1 - )
	   #nmcli con del $CON_NAME       
	   nmcli dev wifi hotspot ssid $SSID band bg channel $CHANNEL password $PSK 

	   #nmcli con add type wifi ifname $IFNAME con-name $CON_NAME autoconnect no ssid $SSID channel $CHANNEL
	   #nmcli con modify $CON_NAME 802-11-wireless.mode ap 802-11-wireless.band bg ipv4.method shared
	   #nmcli con modify $CON_NAME wifi-sec.key-mgmt wpa-psk
	   #nmcli con modify $CON_NAME wifi-sec.psk $PSK
	   #nmcli con up $CON_NAME
       fi
    fi
#fi

exit
