# MOCP Notify

![Mocp_notify en acción](https://github.com/Tarrasquero/Mocp_notify/blob/master/screenshot.png?raw=true)

![Mocp notify ico](https://github.com/Tarrasquero/Mocp_notify/blob/master/Screenshot-ico.png)

## Dependencias:

 - mat 
 - imagemagick 
 - libnotify-bin
 - ~~Es necesario que la `imagen` tenga por nombre `cover.jpg`~~
 
## Novedades:

- Redimensionado de imágenes a 100x100.
- No es necesario renombrar el `jpg` ni que se encuentre en la raiz de la carpeta `album` ni tan siquiera que solo haya un solo `jpg`.
- Soporta espacios en los nombres de la `imagenes` 
## Configuración para notificación de mocp:

    #apt-get install mat imagemagick libnotify-bin
 
Extraer `/usr/share/doc/moc/example/config.example.gz` en `~/.moc` con el nombre `config`.  

Otorgar permisos de ejecución:  `chmod +x mocp_notify.sh`

Buscar la linea: `#OnSongChange=` que debería quedar parecida a esta: `OnSongChange= "$HOME/scripts/mocp_notify.sh %a %t %f %r"` 

## Bugs:

~~Lástima que en los álbumes de varios CDs la imagen a mostrar tiene que estar en la raíz del álbum en si~~ ~~y ser renombrada a cover.jpg.~~ ~~La raíz del álbum puede contener solo un `.jpg` para mostrar en la notificación.~~
