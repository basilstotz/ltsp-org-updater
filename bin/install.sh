#!/bin/sh

if test -z "$(which ltsp)";then
    add-apt-repository ppa:ltsp
    apt update
    apt install --install-recommends \
        ltsp ltsp-binaries dnsmasq nfs-kernel-server\
        openssh-server squashfs-tools ethtool net-tools epoptes
    ltsp dnsmasq
    ltsp image /
    ltsp ipxe
    ltsp nfs
    ltsp initrd
fi

sed -e "s/%%hostname%%/$(hostname)/g" -i ./tree/usr/local/bin/ltsp-updater 
cp -r ./tree/* /

exit 0



