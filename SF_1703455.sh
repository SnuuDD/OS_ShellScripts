    #!/usr/bin/ksh
    ##################################################################
    #                         ITESM CQ                               #
    # Objetivo : Mostrar el uso de argumentos para la gestion del    #
    #   sistema UNIX                                                 #
    # Ejemplo:                                                       #
    #            $ SF_1703455 Lista  "Fecha Dia"                     #
    ##################################################################

    #Este Script trabaja con tres archivos Temporales, TiempoTemporal, MinurtosTemporal y HorasTemporal, que crea al inicio y borra al final


    # Validar numero de param = 2

    if [ $# -gt 1 ]
    then
        # Validando que la cuenta Existe
            for line in `cat $1`
            do
            last | egrep $line | egrep "$2" > Temporal
                if [ $? -eq 0 ]
                then
                    
                    cat Temporal | awk '{ print $11 }' |  tr -s '[:]' '[ ]' > TiempoTemporal
                    cat TiempoTemporal | awk '{ print $1 }' > HorasTemporal
                    cat TiempoTemporal | awk '{ print $2 }' > MinutosTemporal
                        HorasT=0
                        MinutosT=0
                        for line in `cat HorasTemporal`
                        do
                            temp=$line
                            HorasT=`expr $HorasT+$temp`
                        done
                        for line in `cat MinutosTemporal`
                        do
                            temp=$line
                            MinutosT=`expr $MinutosT+$temp`
                        done
                        temp2=`expr $MinutosT/60`
                        HorasT=`expr $HorasT+$temp2`
                    
                        echo -e "En  \"$2\" \"`egrep  $line /etc/passwd | cut -f5 -d:`\"  ha acumulado $HorasT horas y $MinutosT minutos en el sistema \n"
                        rm TiempoTemporal
                        rm MinutosTemporal
                        rm HorasTemporal
                else

                    echo -e "La cuenta \"$line\"no esta en el sistema \n"
                fi
        shift 1
        done
    else
        echo -e "Error: El script debe recibir dos parámetros de posición \a\n"
    fi