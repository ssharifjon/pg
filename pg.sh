#!/bin/bash

curdir=$(basename $(pwd))
printf '<!DOCTYPE html>
' > ${curdir}.pg.html
printf "\t\t\t%s\n" "<b>/</b><br>" >> ${curdir}.pg.html
items=$(ls --group-directories-first)
for item in $items; do
	if [[ -d $item ]]; then
		printf "\t\t\t%s\n" "<a href="${item}/${item}.pg.html"><b>$item</b></a><br>" >> ${curdir}.pg.html
	else
		printf "\t\t\t%s\n" "<a href="${item}">$item</a><br>" >> ${curdir}.pg.html
	fi
done

dirs=$(find . -type d -printf "%P\n")
for item in $dirs; do
	itemname=$(basename $item)
	pardir=$(dirname $item)
	pardirname=$(basename $pardir)
	printf '<!DOCTYPE html>
' > ${item}/${itemname}.pg.html
	printf "\t\t\t%s\n" "<b>/$item</b><br>" >> ${item}/${itemname}.pg.html
	if [[ $pardirname = "." ]]; then
		printf "\t\t\t%s\n" "<a href="../${curdir}.pg.html"><b>../</b></a><br>" >> ${item}/${itemname}.pg.html
	else
		printf "\t\t\t%s\n" "<a href="../${pardirname}.pg.html"><b>../</b></a><br>" >> ${item}/${itemname}.pg.html
	fi
	printf "\t\t\t%s\n" "<a href="${itemname}/${itemname}.pg.html"><b>$itemname</b></a><br>" >> ${pardir}/${pardirname}.pg.html
done

files=$(find . -type f -printf "%P\n") 
for item in $files; do
	itemname=$(basename $item)
	pardir=$(dirname $item)
	pardirname=$(basename $pardir)
	printf "\t\t\t%s\n" "<a href="$itemname">$itemname</a><br>" >> ${pardir}/${pardirname}.pg.html
done
