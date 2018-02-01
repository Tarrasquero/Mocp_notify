#!/bin/sh
#12/01/2018
#Creado por Tarrasquero. 
#IRC: Freenode. Channels: #debian-es; #devuan-mx.
#Puedes mejorarlo?. Házmelo saber: yopuebla@gmail.com
#Configuración en config
#OnSongChange = "$HOME/.moc/scripts/mocp_notify.sh %a %t %f"
#SONG=$(mocp -Q %song)
#ARTIST=$(mocp -Q %artist)
#FILE=$(mocp -i|grep File:|cut -d '/' -f 6)
PWD=$HOME/Musica/
cover="cover.jpg"
LAST=$(echo "/`mocp -i|grep File:|cut -d '/' -f 2-5`")
cd "$LAST"
IMG0=$(ls|grep -i cover.jpg)
Bits=$(du $IMG0|awk '{print $1}')

if [ "$IMG0" ]; then
    
    IMG=$(echo "$LAST/$cover")

else

    IMG=$(echo "/home/jorge/.moc/scripts/icon-moc.png")

fi
if [ $Bits -gt "100" ]; then
    
    $HOME/.moc/scripts/Resice.sh

fi


elif [ != $2 ] || [ != "$IMG0" ]; then

    notify-send -i "$IMG" "$3" #Para musica sin metadatos o/y sin cover 

elif [ "$2" ]; then

    notify-send -i "$IMG" "$1:" "$2\n$4"

fi
exit
