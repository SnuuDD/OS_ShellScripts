#!/usr/bin/ksh
##################################################################
#                         ITESM CQ                               #
# Objetivo : Mostrar el uso de argumentos para la gestion del    #
#   sistema UNIX                                                 #
# Ejemplo:                                                       #
#            $ P11_1703455 NombreCuenta                          #
##################################################################

#Este Script trabaja con dos archivos Temporales, ArchivoTempOwO y TempOwO2, que crea al inicio y borra al final


# Validar numero de param = 1

if [ $# -gt 0 ]
then
    # Validando que la cuenta Existe
        while [ $# -gt 0 ]
        do
        Linea=`egrep  $1 /etc/passwd`
            if [ $? -eq 0 ]
            then
                    ps -u $1 > ArchivoTempOwO
                    CuentaLineas=`wc -l ArchivoTempOwO | tr -s '[ ]' '[#*]' | cut -f1 -d# `
                    if [ $CuentaLineas -gt 1 ]
                    then
                            ps -u $1 | awk '{ print $4 }' | egrep -iv 'CMD' > TempOwO2
                            uniq -c TempOwO2 > ArchivoTempOwO
                            echo -e "\"`egrep  $1 /etc/passwd | cut -f5 -d:`\" is executing:"
                            cat ArchivoTempOwO | awk '{ print $1 " instance(s) of " $2 }'
                            echo -e "\n"

                    else
                    echo -e "\"`egrep  $1 /etc/passwd | cut -f5 -d:`\" is not connected at the moment.!!!\n"
                    fi

                    rm ArchivoTempOwO 2> /dev/null
                    rm TempOwO2 2> /dev/null

            else
                echo -e "The UNIX account \"$1\" does not exist in the system!!! \n"
            fi
    shift 1
    done
else
     echo -e "\nThe script \"`basename $0`\" must get at least one UNIX account to process!!!. \a\n"
fi