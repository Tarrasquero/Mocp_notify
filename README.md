# Scripts
Dependencias: mat, libnotify-bin.
Novedades: Redimensionado de imagenes a 100x100
Configuración para notificación de mocp: 
# apt-get install mat libnotify-bin
Extraer /usr/share/doc/moc/example/config.example.gz a ~/.moc con el nombre "config".
Buscar la linea: "#OnSongChange =" que debería quedar parecida a esta "OnSongChange = "$HOME/scripts/mocp_notify.sh %a %t"
Bug: Lástima que en los albumes de varios cds la imagen a mostrar tiene que estar en la raiz del album en si.
La raiz del album puede contener solo un jpg para mostrar en la notificación.

