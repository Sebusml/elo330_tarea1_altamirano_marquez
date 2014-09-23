#! /bin/bash
if [ "$#" -gt "2" ]; then                     #Comprueba cantidad de argumentos
	echo "Ingrese numero correcto de variables"
	exit 0
fi
# Ve los casos solicidados en la tarea.
case $# in
  #Imprime por terminal rutas de archivos conflictivos
	0 )
		dir=$(pwd) 
		find | grep "[ñáéíóúÑÁÉÍÓÚ ]" ;;
	#Imprime por terminal rutas de archivos conflictivos en ruta
	#especificada.	
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
		#Hace lo mismo que en 1
		if [ "$2" -eq "1" ]; then
			find $dir | grep "[ñáéíóúÑÁÉÍÓÚ ]"
		#Modifica los archivos con nombres conflictivos
		elif [ "$2" -eq "2" ]; then
			$(pwd)/fn2u_recursivo.sh `pwd` $dir 
		else
			echo "Ingrese un valor de n correcto"
		fi ;;
esac
