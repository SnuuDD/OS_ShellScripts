#!/usr/bin/ksh
##################################################################
#               Itesm CQ                                         #
# Objetivo : Mostrar el uso de argumentos de entrada             #
# Ejemplo:                                                       #
#            $ copiar A_Fuente A_Destino                         #
##################################################################


# Validar que se reciban dos argumentos


if [ $# -eq 2 ] # -eq Igual a:
then
        #Validar que A_Fuente exista
        Res=`ls 2>/dev/null -l $1`
        if [ $? -eq 0 ]
        then
          # Validar si el destino se puede crear
          Res=`touch 2>/dev/null $2`
                if [ $? -eq 0 ]
                then
                   # Validar si hay espacio para crear el archivo
                   cat 2>/dev/null $1 > $2

                        if [ $? -eq 0 ]
                        then
                                echo -e "\nEl Archivo $1 se pudo copiar exitosamente al archivo $2. \a"
                        else
                                echo -e "\nERROR: El Archivo no se pudo copiar \a"
                        fi

                else
                   echo -e "\nERROR: El Archivo $1 no existe en el sistema."
                fi

        else
          echo -e "\nERROR: El Archivo $1 no existe en el sistema. \a"
        fi
else
        echo -e "\nERROR: El Script  \"$0\" debe de recibir DOS argumentos. \a"  #Se menciona que se usaran caracteres escapeados
fi