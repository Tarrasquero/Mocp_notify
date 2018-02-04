#!/bin/sh
#12/01/2018
#Creado por Tarrasquero. 
#IRC: Freenode. Channels: #debian-es; #devuan-mx.
#Puedes mejorarlo?. Házmelo saber: yopuebla@gmail.com
#Configuración en config
#OnSongChange = "$HOME/.moc/scripts/mocp_notify.sh %a %t %f %r"
#SONG=$(mocp -Q %song)
#ARTIST=$(mocp -Q %artist)
#FILE=$(mocp -i|grep File:|cut -d '/' -f 6)
cover="cover.jpg"
LAST=$(echo "/`mocp -i|grep File:|cut -d '/' -f 2-5`")
cd "$LAST"
IMG0=$(ls|grep -i cover.jpg)
X=$(mat --display "$IMG0"|grep "Exif Image Width:"|cut -d ' ' -f 4)

if [ "$X" -ge "100" ]; then
    
    $HOME/.moc/scripts/Resice.sh

fi

if [ "$IMG0" ]; then
    
    IMG=$(echo "$LAST/$cover")

else

    IMG=$(echo "$HOME/.moc/scripts/icon-moc.png")

fi


if [ "$2" ]; then

    notify-send -i "$IMG" "$1:" "$2\n$4"

else

    notify-send -i "$IMG" "$3"

fi
exit
