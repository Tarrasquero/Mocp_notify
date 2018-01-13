#!/bin/bash
#12/01/2018
#Creado por Tarrasquero.
#IRC: Freenode. Channels: #debian-es; #devuan-mx; #archlinux-es.
#Puedes mejorarlo?. Házmelo saber: yopuebla@gmail.com
#Screenshot: https://imagebin.ca/v/3o3UAdOpAO63
#Muestra el menu general
clear
function _menuPrincipal(){
    echo "################################################################"  
    echo "|*Bienvenido*                                                  |"
    echo "|1) Para Hacer cambios en el sistema elija esta opcion         |"
    echo "|2) Para Buscar o listar Paquetes upgradables elija esta opcion|"
    echo "|3) Salir                                                      |"
    echo "################################################################"
    echo -n "Indica una opcion:"
}
function _submenu1(){
    echo "######################################"
    echo "|*Es Necesario Identificarse*        |"
    echo "|1) Para Instalar un Paquete         |"
    echo "|2) Para Actualizar la base de Datos |"
    echo "|3) Para Actualizar Paquetes         |"
    echo "|4) Para Actualizar el Sistema       |"
    echo "|5) Para Hacer Limpieza              |"
    echo "|6) Eliminar Paquetes                |"
    echo "|7) Salir                            |"
    echo "######################################"
    echo -n "Indica una opcion:"
}

function _submenu2(){
    echo "################################"
    echo "|1) Buscar Paquetes            |"
    echo "|2) Listar Paquetes upgradables|"
    echo "|3) Salir                      |"
    echo "################################"
    echo -n "Indica una opcion:"
}
opc=0
until [ $opc -eq 3 ]
do
case $opc in
1)
opc1=0
until [ $opc1 -eq 7 ]
do
case $opc1 in
1)
echo "Password:"
read -s szPassword
echo "Paquete:"
read Paquete
echo $szPassword | sudo -S sh -c "echo $szPassword | apt-get install $Paquete"
_submenu1
;;
2)
echo "Password:"
read -s szPassword
echo $szPassword | sudo -S sh -c "echo $szPassword | apt-get update"
_submenu1
;;
3)
echo "Password:"
read -s szPassword
echo $szPassword | sudo -S sh -c "echo $szPassword | apt-get upgrade"
_submenu1
;;
4)
echo "Password:"
read -s szPassword
echo $szPassword | sudo -S sh -c "echo $szPassword | apt-get dist-upgrade"
_submenu1
;;
5)
echo "Password:"
read -s szPassword
echo $szPassword | sudo -S sh -c "echo $szPassword | apt-get autoremove && sudo apt-get autoclean"
_submenu1
;;
6)
echo "Password:"
read -s szPassword
echo "Paquete"
read Paquete
echo $szPassword | sudo -S sh -c "echo $szPassword | apt-get purge $Paquete"
;;
*)
_submenu1
;;
esac
read opc1
done
_menuPrincipal
;;
2)
opc2=0
until [ $opc2 -eq 3 ]
do
case $opc2 in
1)
echo -n "Introduzca el paquete:"
read paquete
apt-cache search $paquete
_submenu2
;;
2)
apt list --upgradable
_submenu2
;;
*)
_submenu2
;;
esac
read opc2
done
_menuPrincipal
;;
3)
break
_menuPrincipal
;;
*)
_menuPrincipal
;;
esac
read opc
done
