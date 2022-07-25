#!/bin/sh

NAME="ltsp-org-updater"
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
Depends: curl 
Description: Setup and maintain a LTSP server on debian (and maybe ubuntu)
 Setup and maintain a LTSP server on ubuntu/debian (and maybe ubuntu) 
EOF

cat <<EOF > $NAME/DEBIAN/copyright
Copyright: 2021 Basil Stotz <stotz@amxa.ch>
License: GPL-3+
This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version. 
.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.
.
You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
EOF

dpkg-deb -b $NAME .


exit 0



