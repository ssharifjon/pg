pg.sh - static webpage generator for your files.

usage:
    copy "pg.sh", "style.pg-css", "templh", and "templt" into a certain directory (e.g. "mydir") and run:
        $ ./pg.sh

It will generate html files. Open "mydir.pg-html" on your web browser.

cons:
    - can be slow for big directories.

bugs:
    - doesn't work as expected if there are files/directories that have spaces in their names.

To clean up generated files, run:
        $ ./clean.sh

