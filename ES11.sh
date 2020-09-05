#!/usr/bin/ksh
##################################################################
#                         ITESM CQ                               #
# Objetivo : Mostrar el uso de argumentos para la gestion del    #
#   sistema UNIX                                                 #
# Ejemplo:                                                       #
#            $ ES11 Lista cuenta unix Hora:Minutos TTole         #
##################################################################




# Validar numero de param = 13if test $# -eq 3
if test $# -eq 3
then

    #REVISAR SI EL PRIMER ARGUMENTO ES UN ARCHIVO
    if test -f $1
    then
    who | tr -s '[ ]' '[#*]' > Foto
        #PROCESAR ARCHIVOS CON SUPUESTAS CUENTAS

        #iniciando FOR
        for Cuenta in `cat $1`
        do

            Res=`egrep $Cuenta /etc/passwd`
            if test $? -eq 0
            then
            #SI EL ALUMNO ESTA CONECTADO Y EXTRAER LA HORA DE CONEXION XDXD
            Linea=`egrep $Cuenta`

            if test $? -eq 0
            then
                #REVISAR LA HORA EN LA QUE SE CONECTO
                HConx=`echo $2 | cut -f1 -d:`
                MConx=`echo $2 | cut -f2 -d:`
                HIni=`echo $Linea | cut -f4 -d# | cut -f1 -d:`
                MIni=`echo $Linea | cut -f4 -d# | cut -f2 -d:`
                # Validar ConeXDXDxion
                if test $HConx -eq $Hini
                    Tol=`expr $MConx + $3`
                then
                    if test $MIni -le $Tol
                    then
                        echo -e "\nEl alumno `echo $Res | cut -f5 -d:` tiene Asistencia OwO"
                    else
                        echo -e "\nEl alumno `egrep $Cuenta /etc/passwd | cut -f5 -d:` tiene falta Dx"
                    fi

                else
                    echo -e "\nEl alumno `egrep $Cuenta /etc/passwd | cut -f5 -d:` no esta en el horario registrado."
                fi



            else
                echo -e "\nEl alumno `egrep $Cuenta /etc/passwd | cut -f5 -d:` no esta en clase."
            fi

            else
                echo -e "\nERROR: La cuenta $Cuenta no existe en el sistema."
            fi

        done


    else
        echo -e "\n ERROR: El Script \"$1 \" no existe en el sistema \a\n"
    fi

else
    echo -e "\n ERROR: El Script \" `basename $0` \" debe recibir 3 parametros de entrada \a\n"
fi