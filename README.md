# Static webpage generator for your files.

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
If you want a nicer look, and displaying of the file sizes, checkout branch `fancy`. If you want to use it with non-GNU version of find, checkout branch `ksh`.

