#!/usr/bin/ksh
######################################################################
#                             ITESM - CQ                             #
# Objetivo: Comprender el uso del ciclo for y uso de parametros de   #
#        posicion del ksh.                                           #
# Script que envia un mensaje a los usuarios conectados. El script   #
# puede ser de mucha ayuda para los administradores de un sistema    #
# UNIX, escialmente cuando se desea notificar a los usuarios que el  #
# sistema se dara de baja por razones de mantenimiento.              #
# Autor : Oscar Hnandez.                                             #
#                                                                    #
# Ejemplo de ejecucion:  $ ES12 ListaCuentas  Mensaje                #
######################################################################

# Validar los argumentos ??
if test $# -eq 2
then
  if test -f $1  -a  -f $2
  then
    # Procesar cada cuenta.
    for Cuenta in `cat $1`
    do
      Res=`egrep $Cuenta /etc/passwd`
      if test $? -eq 0
      then
        Res2=`who | egrep $Cuenta`
        if test $? -eq 0
        then
          write 2> /dev/null $Cuenta < $2
        else
          echo -e "\nLa cuenta $Cuenta no esta conectada."
        fi
      else
        echo -e "\nERROR: La cuenta $Cuenta no existe en el sistema"
      fi
    done
  else
    if test -f $1
    then
      if test ! \( -f $2 \)
      then
        echo -e "\nERROR: El archivo $2 no existe!!"
      fi
    else
     echo -e "\nERROR: El archivo $1 no existe!!"
    fi
  fi
else
  echo -e "\nERROR: El script debe recibir  dos argumentos.\a"
fi