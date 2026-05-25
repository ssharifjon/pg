# Static webpage generator for your files.

## Platform

Unix-like systems (tested on Debian 13 and OpenBSD 7.9).

## Usage:
copy `pg.sh` into your desired directory and execute it. It will generate .pg.html files; open them on your web browser.

## Cons:
- can be slow for big directories.

## Bugs:
- doesn't work as expected if there are files/directories that have spaces in their names.

## To clean up generated files, run:
```
$ ./clean.sh
```
## Note
If you want a nicer look, checkout branch `main`, if you additionally want to see file sizes, checkout branch `fancy`. However, they don't work with non-GNU version of `find`.

