##################################################################
#                         ITESM CQ                               #
# Objetivo : Mostrar las ip de los alumnos en un determinado mes #
#   sistema UNIX                                                 #
# Ejemplo:                                                       #
#            $ A10_1703455 ListaCuentas  Mes                     #
##################################################################
# Nota, este Script genera dos archivos temporales que autimaticamente borral al final



# Validar numero de param = 2
if test $# -eq 2
then

    #REVISAR SI EL PRIMER ARGUMENTO ES UN ARCHIVO
    if test -f $1
    then
        #PROCESAR ARCHIVOS CON SUPUESTAS CUENTAS

        #iniciando FOR
        for Cuenta in `cat $1`
        do
            Res=`egrep $Cuenta /etc/passwd`
            if test $? -eq 0
            then
            #EXTRAER Conexiones del archivo por cuenta
            last | egrep $Cuenta | egrep $2 > ArchivoTempOWO

                if test $? -eq 0
                then
                  cat ArchivoTempOWO |  tr -s '[ ]' '[#*]' | cut -f3 -d# > ArchivoSalidaOWO
                  echo -e "\n`egrep $Cuenta /etc/passwd | cut -f5 -d:` se ha conectado en $2 desde:"
                  uniq ArchivoSalidaOWO
                  rm ArchivoSalidaOWO
                  rm ArchivoTempOWO

                else
                    echo -e "\n`egrep $Cuenta /etc/passwd | cut -f5 -d:` no se ha conectado al servidor en el mes de $2"
                fi

            else
                echo -e "\nERROR: La cuenta $Cuenta no existe en el sistema."
            fi

        done


    else
        echo -e "\n ERROR: El Script \"$1 \" no existe en el sistema \a\n"
    fi

else
    echo -e "\n Error: El script debe recibir dos parámetros de posición! \a\n"
fi