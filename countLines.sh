#!/bin/sh

# zaehlt die zeilen aller *.cpp und *.h dateien
# -o verbindet mehere find befehle
# mit -prune kann man dinge ausschließen
# z.B. wc -f `find -iname ".git" -prune -o -iname "*.py"

wc -l `find -iname "*.cpp" -o -iname "*.h"`


