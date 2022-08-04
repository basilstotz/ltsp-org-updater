#!/bin/bash

addusers(){
    echo $1
    if test -n "$1" && test -f $1;then
	chars=true
	uniq=true
	tcheck=true
        while IFS=, read uid pwd type; do
	    #echo $uid $pwd $type
	    pat="[^a-zA-Z\.]"
	    if [[ "${uid}" =~ $pat ]] ; then
		echo "error: '$uid' is INVALID"
		chars=false
            fi
	    if  getent passwd| grep -q $uid;then
		echo "warning: '$uid' exists"
		uniq=false
	    fi
	    case $type in
		student|teacher|admin)
		    echo -n ""
		    ;;
		*)
		    tcheck=false
		    echo "error: '$uid' has wrong user type '$type'"
		    ;;
	    esac	    
	done < $1

	if $tcheck && $chars;then
	    if ! $uniq; then
		zenity --question --width=450 --text "Einige Beunutzer sind breits vorhanden. Trotzdem weiterfahren?" || return 
	    fi
	    #do it
	    while IFS=, read uid pwd type; do
	       if ! getent passwd| grep -q $uid;then
		   echo useradd --groups $type --create-home --shell /usr/bin/bash --password $pwd --user-group $uid
	       fi
	    done < $1
	else
	    zenity --info --text "Es sind Fehlre in den Daten. Beende ..."
	    return 1
	fi
    else
	zenity --notify --text "Die Datei wurde nicht gefundn"
	return 1
    fi
}

delusers(){
    if test -f $1;then
	 exist=true
         while IFS=, read uid pwd type; do
	    if  ! getent passwd| grep -q $uid;then
		echo "warning: '$uid' does not exitst"
		exist=false
	    fi
         done < $1
	 if ! $exist; then
	    zenity --question --text "Einige Beunutzer sind nicht vorhanden. Trotzdem weiterfahren?" || return 
	 fi
	 
         #do it
         while IFS=, read uid pwd type; do
	    if  getent passwd| grep -q $uid;then
		echo userdel --remove $uid
	    fi 
         done < $1

    else
	zenity --info --text="Datei nicht gefunden."
    fi
}

export_users(){
    echo uid,name
    while IFS=  read line ; do
	  num=$(echo $line|cut -d: -f3)
	  uid=$(echo $line|cut -d: -f1)
	  NAME=$(echo $line|cut -d: -f5)
	  echo $num
	  if test $num -gt 1000;then
	      echo "$uid,$NAME"
	  fi
    done < /etc/passwd
	  
}


change_pwd(){
	      # echo $dfsdfsdf| chpasswd
    uid=$(echo $1|cut -d\| -f1)
    pwd=$(echo $1|cut -d\| -f2)
    if getent passwd|grep -q $uid;then
        echo "echo \"$uid:$pwd\"|chpasswd"
    else
	zenity --info
    fi
}


while true; do
    what=$(zenity --list --radiolist \
	    --height=270 \
	    --title="Nano Benutzer Verwaltung" \
	    --text="Wähle einen Punkt aus:" \
	    --column="" --column="Benutzer ..." \
	 FALSE Anlegen \
	 FALSE Passwort \
	 FALSE Entfernen \
	 FALSE Importieren  \
	 FALSE Exportieren \
	 FALSE Dezimieren )

    case $what in
	Anlegen)
	    ;;
	 Passwort)
	     data=$(zenity --forms --add-entry "Benutzername" --add-password "Neues Passwort")
	     echo $data
	     change_pwd $data
	     ;;
	 Entfernen)
	     ;;
	 Importieren)
	     addusers $(zenity --file-selection --filename $HOME/git/ltsp-org-updater/ --file-filter *.csv)
	     ;;
	 Exportieren)
	     file=$(zenity --file-selection --save --filename $HOME/git/ltsp-org-updater/ --file-filter *.csv)
	     
	     test -n "$file" && export_users > $file
	     ;;
	 Dezimieren)
	     delusers $(zenity --file-selection --file-filter *.csv)
             ;;	 
	 *)
	     exit 0
	     ;;
     esac

     zenity --info
done
