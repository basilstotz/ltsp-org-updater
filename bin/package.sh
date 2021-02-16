#!/bin/sh

NAME="ltsp-updater"
VERSION=$(date +%s)

test -d $NAME/DEBIAN || mkdir -p $NAME/DEBIAN
cat <<EOF > $NAME/DEBIAN/control
Source: $NAME
Section: unknown
Priority: extra
Maintainer: Basil Stotz <stotz@amxa.ch>
Package: $NAME
Version: $VERSION 
Architecture: amd64
Depends: debconf
Description: Setup and maintain a LTSP server on ubuntu
 Setup and maintain a LTSP server on ubuntu
EOF
dpkg-deb -b $NAME .


exit 0



