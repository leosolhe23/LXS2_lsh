#/bin/bash

## este script requiere tres parametros
## ./resumen.sh  <param1>  <param2> <param3>

# Definicion de variables

PARAMETROS=3
VERSION_BASH="4.3.11"

CONTADOR=1


# Evaluar si la distro es ubuntu y si la version de bash es 4.3.11

if [[ `echo  $BASH_VERSION | cut -d "(" -f1` == $VERSION_BASH  ||
	`lsb_release -i | awk '{print $3}'` == Ubuntu ]] 
then
	echo "Version de bash $VERSION_BASH correcta!"
else
	echo "Error:
	Si version de bash no es compatible con el script.
	Necesita la version $VERSION_BASH y esta instalada
 	la version $BASH_VERSION"
	exit 1
fi

# Para diferencias uso !=
if [[ $# != $PARAMETROS ]] 
then
	echo "Error:
	La forma de utilizar el script es la siguiente
        $0 <par1> <par2> <par3> 
	"
	exit 1
else
	echo " El numero de parametros es correcto, y fue $#"
 	if  [[ $2 == casa ]] 
	then
		echo "El parametro 2 es casa!"
	else
		echo "El parametro 2 NO es casa!"
	fi
fi

echo "Los parametros fueron "
echo $@



#Impresion de los parametros
for i in $*
do
	echo "Uno de los parametros del script es : $1 "

done 


for i in alto otro caso
do
	echo "Elemento del segundo for $i"
done

#Rando de numeros
for i in {1..10} 
do
	echo"El numero es $m "
done


exit 0

