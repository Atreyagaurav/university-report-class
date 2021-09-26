#!/bin/sh
printf "Waiting for changes in the file: %s\n" "sample-report.tex"

inotifywait -q -m -e close_write sample-report.tex|
while read -r filename event; do
    pdflatex --synctex=1 sample-report.tex
    printf "Compilation complete.\nWaiting for changes in the file: %s\n" sample-report.tex
done
