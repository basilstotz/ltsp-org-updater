#!/bin/sh


# Reading kernel command line
for _PARAMETER in $(cat /proc/cmdline)
do
	case "${_PARAMETER}" in
		live-config.hotspot=*|hotspot=*)
			LIVE_HOTSPOT="${_PARAMETER#*hotspot=}"
			;;
	esac
done

# uncomment for tests only
LIVE_HOTSPOT="escuela,escuela0815"

#leave if not configured
if test -n "$LIVE_HOTSPOT"; then

    SSID=$(echo "$LIVE_HOTSPOT"|cut -d"," -f1)
    PSK=$(echo "$LIVE_HOTSPOT"|cut -d"," -f2)

    if nm-online -s -q; then
       if nmcli radio wifi on; then
	   CHANNEL=$(echo -e "1\n6\n11" | shuf -n1 - )
	   nmcli dev wifi hotspot ssid $SSID band bg channel $CHANNEL password $PSK 
       fi
    fi
    
fi

exit
