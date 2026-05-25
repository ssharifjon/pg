#!/bin/sh

items=$(find .)

for item in $items; do
	name=$(basename $item)
	pardir=$(dirname $item)
	pname=$(basename $pardir)
	if [ -d $item ]; then
		if [ $item = "." ]; then
			printf "%s\n" "<!DOCTYPE html>" "/.<br>" > ${item}/${name}.pg.html 
		else
			printf "%s\n" "<!DOCTYPE html>" "/$item<br>" "<b><a href=../${pname}.pg.html>../</a></b><br>" > ${item}/${name}.pg.html 
			printf "%s\n" "<b><a href=${name}/${name}.pg.html>$name</a></b><br>" >> ${pardir}/${pname}.pg.html
		fi	
	else
		printf "%s\n" "<a href=$name>$name</a><br>" >> ${pardir}/${pname}.pg.html
	fi
done
