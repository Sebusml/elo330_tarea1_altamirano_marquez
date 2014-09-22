#! /bin/bash

if [ "$#" -gt "2" ]; then
	echo "Ingrese numero correcto de variables"
	exit 0
fi

case $# in
	0 )
		dir=$(pwd) 
		find | grep "[ñáéíóúÑÁÉÍÓÚ ]" ;;
	1 )
		dir=$1
		if test -d $dir; then 
		  find $dir | grep "[ñáéíóúÑÁÉÍÓÚ ]" 
		  exit
		fi
		echo "El directorio no es correcto";;
	2 )
		dir=$1 
		if ! test -d $dir; then 
		  echo "El directorio no es correcto"
		  exit
		fi
		if [ "$2" -eq "1" ]; then
			find $dir | grep "[ñáéíóúÑÁÉÍÓÚ ]"
		elif [ "$2" -eq "2" ]; then
			$(pwd)/sed_recursivo.sh `pwd` $dir 
		else
			echo "Ingrese un valor de n correcto"
		fi ;;
esac
