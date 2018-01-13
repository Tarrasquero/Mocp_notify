#!/bin/sh
#12/01/2018
#Creado por Tarrasquero. 
#Screenshot https://imagebin.ca/v/3nz5mRqmdvoZ
#IRC: Freenode. Channels: #debian-es; #devuan-mx; #archlinux-es.
#Puedes mejorarlo?. Házmelo saber: yopuebla@gmail.com
#Configuración en config
#OnSongChange = "/home/$USER/configuracion/notify_mocp.sh %t %a"
PWD=$HOME/Musica
LAST=$(echo "$PWD/`mocp -i|grep File:|cut -d '/' -f 5`")
cd "$LAST"
IMG=`find *.jpg -type f`
SONGTITLE=$(mocp -Q %song)
ARTIST=$(mocp -Q %artist)
FILE=$(echo `mocp -i|grep File:|cut -d '/' -f 6`)
#ESTADO=$(mocp -Q %state) 


if [ "$SONGTITLE" ]; then
    notify-send --icon="$LAST/$IMG" "$ARTIST:" "$SONGTITLE"
    else
    notify-send --icon="$LAST/$IMG" "$FILE" #Para musica sin metadatos
fi

exit
