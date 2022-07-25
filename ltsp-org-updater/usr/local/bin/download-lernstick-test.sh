#!/bin/sh
             mkdir -p ./iso/
	     cd ./iso
	     URL="https://releases.lernstick.ch"
	     NAME="lernstick_debian11_latest"
	     test -f $NAME.iso.md5 || touch $NAME.iso.md5
	     if wget -O $NAME.iso.md5.tmp $URL/$NAME.iso.md5 2>/dev/null;then
		 if ! diff $NAME.iso.md5 $NAME.iso.md5.tmp >/dev/null;then
		     if wget -c -O $NAME.iso.tmp $URL/$NAME.iso ;then
			 md5sum $NAME.iso.tmp
			 mv $NAME.iso.md5.tmp $NAME.iso.md5
			 mv $NAME.iso.tmp $NAME.iso
		     else
			 echo "error: could not downlaod $NAME.iso"
		     fi
		 else
		     rm $NAME.iso.md5.tmp
		     echo "info: $NAME.iso is up to date. do nothing"
		 fi
	     else
		 echo "error: could not download $NAME.iso.md5"
	     fi

exit
