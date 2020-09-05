#!/usr/bin/ksh
##################################################################
#                         ITESM CQ                               #
# Objetivo : Mostrar la IP desde donde se esta conectando una    #
#   cuenta                                                       #
# Ejemplo:                                                       #
#            $ NombreCuenta                                      #
##################################################################




# Validar numero de param = 1

if [ $# -gt 0 ]
then
    while [ $# -gt 0  ]
    do

    #validar si es una cuenta valida
    Linea=`egrep  $1 /etc/passwd`
    ###### Validando
    echo $1

            if [ $? -eq 0 ]
                then
                    infoconex=`who | egrep $1`
                            #Revisar si el usuario esta conectado
                        if [ $? -eq 0 ]
                        then
                            IP=`echo $infoconex | tr -s '[ ]' '[#*]' | cut -f5 -d# | tr -d '()'`
                            name=`echo $infoconex | tr -s '[ ]' '[#*]' | cut -f1 -d# | tr -d '()'`
                            echo -e "\n INFO: La cuenta \" `echo $name` \" se esta conectando desde -> `echo $IP` <- "
                        fi


                else
                    echo -e "\n ERROR: La cuenta \"$1\" no existe en el sistema. \a\n"
                fi

    shift 1
    done

else
    echo -e "\n ERROR: El Script \" `basename $0` \" debe recibir al menos parametro de entrada \a\n"
fi