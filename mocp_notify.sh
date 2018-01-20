#!/bin/sh
#12/01/2018
#Creado por Tarrasquero. 
#Screenshot https://imagebin.ca/v/3nz5mRqmdvoZ
#IRC: Freenode. Channels: #debian-es; #devuan-mx; #archlinux-es.
#Puedes mejorarlo?. Házmelo saber: yopuebla@gmail.com
#Configuración en config
#OnSongChange = "$HOME/scripts/mocp_notify.sh %a %t %f"
SONG=$(mocp -Q %song)
ARTIST=$(mocp -Q %artist)
FILE=$(mocp -i|grep File:|cut -d '/' -f 6)
PWD=$HOME/Musica/
LAST=$(echo "$PWD/`mocp -i|grep File:|cut -d '/' -f 5`")
cd "$LAST"
IMG0=$(find *.jpg -type f)
cp "$LAST/$IMG0" "/tmp/cover.jpg"
IMG=/tmp/cover.jpg
X=$(mat --display "$IMG"|grep "Exif Image Width:"|cut -d ' ' -f 4)
Y=$(mat --display "$IMG"|grep "Exif Image Height:"|cut -d ' ' -f 4)
GEOMETRY=$(echo "$X"x"$Y")
i="100x100"

if [ $i != $GEOMETRY ]; then
    mogrify -resize 100x100! "$IMG"
fi    

if [ "$2" ]; then
    notify-send -i "$IMG" "$1:" "$2" 
else 
    notify-send --icon="$IMG" "$FILE" #Para musica sin metadatos
fi
exit
