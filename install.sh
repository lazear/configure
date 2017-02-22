#!/bin/bash
INSTALL=~/bin

chmod +755 configure

if [ ! -d $INSTALL ]; then
	mkdir -p $INSTALL
fi
cp -uv configure $INSTALL/

for path in $(manpath | tr ":" "\n"); do
	if [ -d $path/man1 ]; then
		cp -uv configure.1 $path/man1
		break;
	fi
done


