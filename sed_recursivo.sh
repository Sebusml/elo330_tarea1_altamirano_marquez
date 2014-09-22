#! /bin/bash
cd "$2"
for i in *
do
   if test -d "$i"; then
    $1/sed_recursivo.sh "$1" "$(pwd)/$i"
   fi
done

$1/corrector.sh ñ n
$1/corrector.sh Ñ N
$1/corrector.sh á a
$1/corrector.sh Á A
$1/corrector.sh é e
$1/corrector.sh É E 
$1/corrector.sh í i 
$1/corrector.sh Í I
$1/corrector.sh ó o
$1/corrector.sh Ó O
$1/corrector.sh ú u
$1/corrector.sh Ú U
$1/corrector.sh " " "_"