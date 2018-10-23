# MOCP Notify

![Mocp_notify en acción](https://github.com/Tarrasquero/Mocp_notify/blob/master/screenshot.png?raw=true)

![Mocp notify ico](https://github.com/Tarrasquero/Mocp_notify/blob/master/Screenshot-ico.png)

## Dependencias:

 - mat 
 - imagemagick 
 - libnotify-bin

 
## Novedades:

- Redimensionado de imágenes a 100x100.
- No es necesario renombrar el `jpg` ni que se encuentre en la raiz de la carpeta `album` ni tan siquiera que solo haya un solo `jpg`.
- Soporta espacios en los nombres de la `imagenes` 
## Configuración para notificación de mocp:

    #apt-get install mat imagemagick libnotify-bin
 
Extraer `/usr/share/doc/moc/example/config.example.gz` en `~/.moc` con el nombre `config`.
Mover scripts: `mocp_notify.sh` y `Resize.sh` a `~/.moc/scripts`.
`mkdir $HOME/.moc/scripts ; mv mocp_notify.sh Resize.sh $HOME/.moc/scripts`
Otorgar permisos de ejecución:  `chmod +x mocp_notify.sh ; chmod +x Resize.sh`

Buscar la linea: `#OnSongChange=` que debería quedar parecida a esta: `OnSongChange= "$HOME/scripts/mocp_notify.sh %a %t %f %r"` 
