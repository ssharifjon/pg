#!/bin/bash

dirs=$(find . -type d -printf "%P\n")
files=$(find . -type f -printf "%P\n")

curdir=$(basename $(pwd))
printf '<!DOCTYPE html>
<html>
	<body>
		<table>
' > ${curdir}.pg.html
printf "\t\t\t%s\n" "<tr><td><b>/</b></td></tr>" >> ${curdir}.pg.html
items=$(ls --group-directories-first)
for item in $items; do
	if [[ -d $item ]]; then
		printf "\t\t\t%s\n" "<tr><td><a href="${item}/${item}.pg.html"><b>$item</b></a></td></tr>" >> ${curdir}.pg.html
	else
		printf "\t\t\t%s\n" "<tr><td><a href="${item}">$item</a></td></tr>" >> ${curdir}.pg.html
	fi
done
printf '		</table>
	</body>
</html>' >> ${curdir}.pg.html

for item in $dirs; do
	itemname=$(basename $item)
	pardir=$(dirname $item)
	pardirname=$(basename $pardir)
	printf '<!DOCTYPE html>
<html>
	<body>
		<table>
' > ${item}/${itemname}.pg.html
	
	printf "\t\t\t%s\n" "<tr><td><b>/$item</b></td></tr>" >> ${item}/${itemname}.pg.html
	if [[ $pardirname = "." ]]; then
		printf "\t\t\t%s\n" "<tr><td><a href="../${curdir}.pg.html"><b>../</b></a></td></tr>" >> ${item}/${itemname}.pg.html
	else
		printf "\t\t\t%s\n" "<tr><td><a href="../${pardirname}.pg.html"><b>../</b></a></td></tr>" >> ${item}/${itemname}.pg.html
	fi
	printf "\t\t\t%s\n" "<tr><td><a href="${itemname}/${itemname}.pg.html"><b>$itemname</b></a></td></tr>" >> ${pardir}/${pardirname}.pg.html
done

for item in $files; do
	itemname=$(basename $item)
	pardir=$(dirname $item)
	pardirname=$(basename $pardir)
	printf "\t\t\t%s\n" "<tr><td><a href="$itemname">$itemname</a></td></tr>" >> ${pardir}/${pardirname}.pg.html
done

for item in $dirs; do
	itemname=$(basename $item)
	printf '		</table>
	</body>
</html>' >> ${item}/${itemname}.pg.html
done
