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
LAST=$(echo "$PWD`mocp -i|grep File:|cut -d '/' -f 2-5`")
cover="cover.jpg"
cd "$LAST"
IMG0=$(ls|grep -i *.jpg)
IMG=$(echo '"$LAST/$cover"'
Bits=$(du $IMG0|awk '{print $1)')

if [ ! $Bits ]; then
    
    $HOME/.moc/scripts/Resice.sh

fi    

if [ $cover != $IMG0 ]; then

    notify-send --icon="$HOME/.moc/scripts/icon-moc.png" "$1:" "$2" #Para musica sin cover

elif [ ! "$2" ] || [ ! "$IMG0" ]; then

    notify-send --icon="$HOME/.moc/scripts/icon-moc.png" "$3" #Para musica sin metadatos y sin cover 

elif [ ! "$2" ]; then

    notify-send --icon="$IMG" "$3"

elif [ "$2" ]; then

    notify-send --icon="$IMG" "$1:" "$2"

fi
exit
