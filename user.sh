#!/bin/sh

addusers(){
    echo $1
    if test -n "$1" && test -f $1;then
         cat $1
    else
	zenity --notify
    fi
}

delusers(){
    if test -f $1;then
         cat $1
    else
	zenity --info
    fi
}


while true; do
     what=$(zenity --list --radiolist \
	    --title="Was willst du tun?" \
	    --column="Auswahl" --column="Tätigkeit" \
	 FALSE Importieren  \
	 FALSE Löschen  \
	 FALSE Passwort )

     case $what in
	 Importieren)
	     addusers $(zenity --file-selection --file-filter *.csv)
	     ;;
	 Löschen)
	     delusers $(zenity --file-selection --file-filter *.csv)
	     ;;
	 Passwort)
	     data=$(zenity --forms --add-entry "Benutzername" --add-password "Neues Passwort")
	     echo $data
	      # echo $dfsdfsdf| chpasswd
	     ;;
	 *)
	     exit 0
	     ;;
     esac

     zenity --info
done
