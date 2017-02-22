#!/bin/bash
INSTALL=~/bin
MANPATH=""

chmod +755 configure

if [ ! -d $INSTALL ]; then
	mkdir -p $INSTALL
fi

if [ -d "/usr/local/share/man/man1" ]; then
	MANPATH="/usr/local/share/man/man1"
else
	MANPATH=$(manpath | sed -e 's/:.*$//g')
fi

cp configure $INSTALL/
cp configure.1 $MANPATH/