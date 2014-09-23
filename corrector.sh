#! /bin/bash
x=$1
y=$2
bad=$(ls |grep "[$x]" )                       #Hace un string con todos los nombres
if [ "$bad" == "" ];then                      #de archivos conflictivos.
  exit
fi
fix=$(ls |grep "[$x]" | sed "y:[$x]:[$y]:")  #Cambia caracteres no deseados por los
                                             #indicados por el usuario.
lines=$(echo "$bad" | awk 'END { print NR }') #Ve cuantos archivos tienen caractes 
rep=1                                         #no deseados.
if [ "$lines" -eq "1" ]; then
	if [ -e "$fix" ]; then                      #Ver mas abajo la explicacion.
	    while [ -e "${fix}_${rep}" ];
        do 
        rep=$(expr "$rep" + 1)
      done
      fix="${fix}_${rep}"  
  fi
  rep=1
  mv "$bad" "$fix"
fi

if [ "$lines" -gt "1" ]; then
  for j in $(seq 1 1 $lines)                  #Un for-loop normal.
  do    
      f=$(echo "$fix" | awk -v j=$j 'NR==j')  #Obtiene las lineas del string.
      i=$(echo "$bad" | awk -v j=$j 'NR==j') 
      
      if [ -e "$f" ]; then                    #Verifica si ya existe el archivo con el
	      while [ -e "${f}_${rep}" ];           #nombre correcto, el while verifica  
          do                                  #si existe el nombre con el _[numero].
          rep=$(expr "$rep" + 1)
        done
        f="${f}_${rep}"
      fi
      rep=1
      mv "$i" "$f"                            #Cambia el nombre del archivo
  done
fi
