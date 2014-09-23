#! /bin/bash
# Funcion recursiva para poder acceder a sub-carpetas.
cd "$2"
for i in *
do
   if test -d "$i"; then
    $1/fn2u_recursivo.sh "$1" "$(pwd)/$i"  #Se pasa como argumento el directorio
   fi                                     #del script y el de la carpeta encontrada.
done
#Se llama a la funcion que corrige los archivos
#con caracteres conflictivos.
$1/corrector.sh "ñáéíóúÑÁÉÍÓÚ " "naeiouNAEIOU_"
