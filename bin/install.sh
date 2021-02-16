#!/bin/sh

test -n "$(which ltsp)" && exit 0

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

cp -r ./tree/* /

exit 0



