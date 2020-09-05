#!/usr/bin/ksh
############################################
# Script que permite copiar el contenido de un       #
# archivo sin utilzar el comando                                #
############################################

echo -e El Script $0 realizara una copia del archivo $1  a el archivo $2

# Validar argumentos de entrada

if [ $# -ge 2 ]
then
        cat $1 > $2

else
        echo -e "\n El SCRIPT $0 debe recibir 2 parametros de entrada"
fi