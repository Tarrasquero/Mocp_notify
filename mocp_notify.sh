#!/bin/sh
#12/01/2018
#Creado por Tarrasquero. 
#IRC: Freenode. Channels: #debian-es; #devuan-mx.
#Puedes mejorarlo?. Házmelo saber: yopuebla@gmail.com
#Configuración en config
#OnSongChange = "$HOME/scripts/mocp_notify.sh %a %t %f"
#SONG=$(mocp -Q %song)
#ARTIST=$(mocp -Q %artist)
#FILE=$(mocp -i|grep File:|cut -d '/' -f 6)
PWD=$HOME/Musica/
LAST=$(echo "$PWD`mocp -i|grep File:|cut -d '/' -f 5`")
cd "$LAST"
IMG0=$(ls|grep -i *.jpg)
IMG="/tmp/cover.jpg"
cover="cover.jpg"
cp "$LAST/$IMG0" "/tmp/cover.jpg"
Bits=$(du $IMG0|awk '{print $1)')

if [ ! $Bits ]; then
    
    $HOME/scripts/Resice.sh

fi    

if [ $cover != $IMG0 ]; then

    notify-send --icon="/home/jorge/configuracion/icon-moc.png" "$1:" "$2" #Para musica sin cover

elif [ ! "$2" ] || [ ! "$IMG0" ]; then

    notify-send --icon="/home/jorge/configuracion/icon-moc.png" "$3" #Para musica sin metadatos y sin cover 

elif [ ! "$2" ]; then

    notify-send --icon="$IMG" "$3"

elif [ "$2" ]; then

    notify-send --icon="$IMG" "$1:" "$2"

fi
exit
