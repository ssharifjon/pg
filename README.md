# Static webpage generator for your files.

### Usage:
copy `pg.sh`, `style.pg.css`, `templh`, and `templt` into your desired directory and run:
```
$ ./pg.sh
```
It will generate .pg.html files; open them on your web browser.

### Cons:
- can be slow for big directories.

### Bugs:
- doesn't work as expected if there are files/directories that have spaces in their names.

### To clean up generated files, run:
```
$ ./clean.sh
```
### Note
if you want a simpler version of the script without external files, and without displaying of the file sizes, checkout branch ```main```.

