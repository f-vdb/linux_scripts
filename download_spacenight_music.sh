#!/bin/bash

# spacenight.sh
# Parses the "Space Night Up To Date" box on http://www.br.de/fernsehen/bayerisches-fernsehen/sendungen/spacenight/index.html
# and downloads all linked media files into a directory. Won't re-download existing files, so you could set up a daily cron job 
# or something like that.

if [ -n "$1" ]
then
        targetdir="$1"
else
        targetdir="."
fi
if [ ! -d "$targetdir" ]
then
        echo "The directory "$targetdir" does not exist!"
        exit 1
fi

echo "Downloading media files to $targetdir"
wget -O - "http://embed.scribblelive.com/Embed/v5.aspx?Id=225424&ThemeId=4497" 2>/dev/null \
| grep ThreadLiveBlog.Load \
| sed 's/^[^{]*//' \
| sed 's/[^}]*$//' \
| sed 's/{[^{]*"Caption":"\([^"]*\)"[^{}]*"Content":"\([^"]*\)"[^}]*},\{0,1\}/\1|\2§/g' \
| sed 's/{.*\[\(.*\)\].*/\1/' \
| sed 's/{[^}]*},\{0,1\}//g' \
| sed 's/§/\n/g' \
| while read line
do 
        name=$(echo $line | cut -d '|' -f 1 | sed -e "s/[^\]\[A-Za-z0-9~., _{}\(\)\'\-\+]//g" | sed 's/^ *//' | sed 's/ *$//')
        url=$(echo $line | cut -d '|' -f 2)
        if [ "$name" -a "$url" ]
        then
                mediaurl=$(wget -O - "$url" 2>/dev/null | sed 's/.*media:content url="\([^"]*\)".*/\1\n/g')
                if [ ! -e "$targetdir/$name.mp3" ]
                then
                        echo "Downloading $name.mp3 from \"<$mediaurl>\""
                        wget -O "$targetdir/$name.mp3" "$mediaurl"
                else
                        echo "The file \"$targetdir/$name.mp3\" already exists, won't re-download."
                fi
        fi
done

