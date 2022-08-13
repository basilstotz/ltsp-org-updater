#!/bin/sh

sed -e "s/^UID_MIN.*$/UID_MIN 10000/g" -i login.defs
sed -e "s/^GID_MIN.*$/GID_MIN 10000/g" -i login.defs

