# Mocp_notify <h1>
* Dependencias: mat, imagemagick, libnotify-bin.

* Novedades: Redimensionado de imagenes a 100x100 
* Configuración para notificación de mocp: 
1. apt-get install mat imagemagick libnotify-bin 1
1. Extraer /usr/share/doc/moc/example/config.example.gz a ~/.moc con el nombre "config". 2
2. Buscar la linea: "#OnSongChange =" que debería quedar parecida a esta "OnSongChange = "$HOME/scripts/mocp_notify.sh %a %t %f"
_**Bugs**: Lástima que en los albumes de varios cds la imagen a mostrar tiene que estar en la raiz del album en si.
La raiz del album puede contener solo un jpg para mostrar en la notificación._

