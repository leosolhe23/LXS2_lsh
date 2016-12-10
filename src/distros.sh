#/bin/bash

### Variables globales
DISTRO=$1


### Funciones

informaciones ()


{}


case $DISTRO in 
	ubuntu)
	echo "Distro ubuntu Soportada"
	last | head -l 5
	if [[ $# == 2 ]]
        then 
		echo "El # de parametros es 2"
	else 
		echo "El # de parametros no es 2, es $#"
 	fi
	;;
	centos)
	echo "Distro ubuntu Soportada"
	last | head -l 5
	if [[ $# == 2 ]] 
        then 
		echo "El # de parametros es 2"
	else 
		echo "El # de parametros no es 2, es $#"
 	fi
	;;
        
        debian)
	echo "Distro ubuntu Soportada"
	last | head -l 5
	if [[ $# == 2 ]] 
        then 
		echo "El # de parametros es 2"
	else 
		echo "El # de parametros no es 2, es $#"
 	fi
	;;
        *)
		echo "Distro NO soportada" 
esac
