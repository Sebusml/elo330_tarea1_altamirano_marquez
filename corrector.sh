#! /bin/bash
x=$1
y=$2
bad=$(ls |grep "$x" )
if [ "$bad" == "" ];then
  exit
fi
fix=$(ls |grep "$x" | sed "s:$x:$y:g")
lines=$(echo "$bad" | awk 'END { print NR }')

if [ "$lines" -eq "1" ]; then
	if [ -e "$fix" ]; then
		fix="${bad}_1"
    fi
  mv "$bad" "$fix"
fi

rep=1

if [ "$lines" -gt "1" ]; then
  for j in $(seq 1 1 $lines) 
  do    
      f=$(echo "$fix" | awk -v j=$j 'NR==j')  #obtiene la
      i=$(echo "$bad" | awk -v j=$j 'NR==j')
      if [ -e "$f" ]; then
      	#f=$(echo "$f\_$rep")
      	f="${f}_${rep}"
      	rep=$(expr "$rep" + 1)
      fi

      mv "$i" "$f"  #cambia el nombre del archivo
  done
fi
