#!/bin/bash

curdir=$(basename $(pwd))
cat templh > ${curdir}.pg.html
printf "\t\t\t%s\n" "<tr><th>/</th></tr>" >> ${curdir}.pg.html
items=$(ls --group-directories-first)
for item in $items; do
	if [[ -d $item ]]; then
		printf "\t\t\t%s\n" "<tr><td class="dir"><a href="${item}/${item}.pg.html">$item</a></td><td class="size">-</td></tr>" >> ${curdir}.pg.html
	else
		size=$(du -h $item | cut -f1)
		printf "\t\t\t%s\n" "<tr><td class="file"><a href="${item}">$item</a></td><td class="size">$size</td></tr>" >> ${curdir}.pg.html
	fi
done
cat templt >> ${curdir}.pg.html

dirs=$(find . -type d -printf "%P\n")
for item in $dirs; do
	itemname=$(basename $item)
	pardir=$(dirname $item)
	pardirname=$(basename $pardir)
	ln -f style.pg-css ${item}/style.pg-css
	cat templh > ${item}/${itemname}.pg.html
	
	printf "\t\t\t%s\n" "<tr><th>/$item</th></tr>" >> ${item}/${itemname}.pg.html
	if [[ $pardirname = "." ]]; then
		printf "\t\t\t%s\n" "<tr><td class="dir"><a href="../${curdir}.pg.html">../</a></td><td class="size">-</td></tr>" >> ${item}/${itemname}.pg.html
	else
		printf "\t\t\t%s\n" "<tr><td class="dir"><a href="../${pardirname}.pg.html">../</a></td><td class="size">-</td></tr>" >> ${item}/${itemname}.pg.html
	fi


	printf "\t\t\t%s\n" "<tr><td class="dir"><a href="${itemname}/${itemname}.pg.html">$itemname</a></td><td class="size">-</td></tr>" >> ${pardir}/${pardirname}.pg.html
done

files=$(find . -type f -printf "%P\n")
for item in $files; do
	itemname=$(basename $item)
	pardir=$(dirname $item)
	pardirname=$(basename $pardir)
	size=$(du -h $item | cut -f1)
	printf "\t\t\t%s\n" "<tr><td class="file"><a href="$itemname">$itemname</a></td><td class="size">$size</td></tr>" >> ${pardir}/${pardirname}.pg.html
done

for item in $dirs; do
	itemname=$(basename $item)
	cat templt >> ${item}/${itemname}.pg.html
done
