#!/bin/sh

if test -z "$(which ltsp)";then
    add-apt-repository ppa:ltsp
    apt update
    apt-get install cowsay lolcat
    apt-get install --install-recommends \
        ltsp ltsp-binaries dnsmasq nfs-kernel-server\
        openssh-server squashfs-tools ethtool net-tools epoptes
fi

ltsp dnsmasq
ltsp image /
ltsp ipxe
ltsp nfs
ltsp initrd

cp -r ./tree/* /
sed -e "s/%%hostname%%/$(hostname)/g" -i /usr/local/bin/ltsp-updater 
chmod +x /usr/local/bin/ltsp-updater

exit 0



