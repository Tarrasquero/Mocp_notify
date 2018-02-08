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
LAST=$(echo "/`mocp -i|grep File:|cut -d '/' -f 2-5`")
cd "$LAST"
I=$(ls|grep -i -e *.jpg)
if [ -f "$I" ]; then
    IMG0=$(find . -name '*.jpg'|shuf -n1|xargs -0) #$(ls|grep -i -e *.jpg)  #$(ls|grep -i -e *.jpg -e *.png -e *.jpeg)
else
    IMG0=$(find . -name '*.jpg' |cut -c2-|shuf -n1|xargs -0)   
fi
 
X=$(mat --display "$IMG0"|grep "Exif Image Width:"|cut -d ' ' -f 4)

if [ "$X" != "100" ]; then
    $HOME/.moc/scripts/Resice.sh
fi

for cover in "$IMG0"; do

if [ "$IMG0" ]; then
    IMG=$(echo "$LAST/$cover")
else
    IMG=$(echo "$HOME/.moc/scripts/icon-moc.png")
fi

done

if [ "$2" ]; then
    notify-send -i "$IMG" "$1:" "$2\n$4"
else
    notify-send -i "$IMG" "$3"
fi
exit
