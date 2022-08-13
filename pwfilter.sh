#!/bin/sh

DEST="$1"

test -n "$DEST" || DEST=login

MIN_UID=1000
MAX_UID=60000

MIN_GID=1000
MAX_GID=60000

list=":"

#passwd
while  read line; do
    uid=$(echo $line|cut -d: -f3)
    if test $uid -ge $MIN_UID -a $uid -le $MAX_UID; then
	user=$(echo $line|cut -d: -f1)
	list="$list$user:"
    else
	echo $line > $DEST/passwd 
    fi	
done < /etc/passwd


echo $list


#shadow
test=":"
while  read line; do
    user=$(echo $line|cut -d: -f1)
    if echo $list|grep -q ":$user:" ; then
	test="$test$user:"
    else
	echo $line > $DEST/shadow
    fi	
done < /etc/shadow


echo $test


list=":"
#group
while  read line; do
    gid=$(echo $line|cut -d: -f3)
    if test $gid -ge $MIN_GID -a $gid -le $MAX_GID; then
	group=$(echo $line|cut -d: -f1)
	list="$list$group:"
    else
	echo $line > $DEST/group
    fi	
done < /etc/group



echo $list


#gshadow
test=":"
while  read line; do
    group=$(echo $line|cut -d: -f1)
    if echo $list|grep -q ":$group:" ; then
	test="$test$group:"
    else
	echo $line
    fi	
done < /etc/gshadow > $DEST/gshadow


echo $test

