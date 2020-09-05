#!/usr/bin/ksh
##################################################################
#                         ITESM CQ                               #
# Objetivo : Mostrar el uso de argumentos para la gestion del    #
#   sistema UNIX y validar si una cuenta excede el tiempo conex  #
# Ejemplo:                                                       #
#            $ P09_1703455 a1703455 10                           #
##################################################################



if test $# -eq 2
then

    
    
        Cuenta=`egrep $1 /etc/passwd`

            if test $? -eq 0
            then
            Time=`who -u | tr -s '[ ]' '[#*]' | egrep a1703455 | cut -f5 -d# | head -1 | cut -f2 -d:`
            
                 if [ "$Time" != "." ]
                 then


                                if [ $Time -gt 0 -a $Time -lt 60 ]
                                then
                                    
                                     if [ $Time -gt $2 ]
                                    then
                                        
                                        echo -e "\nThe UNIX account \"`echo $1`\" exceeds the allowed downtime!!!"
                                        

                                    else
                                        echo -e "\nThe UNIX account \"`echo $1`\" DOES NOT exceed downtime!!!!"
                                    fi



                                else
                                    echo -e "\nThe numeric value inserted must be in the range of [1,59] !"
                                fi

                 else
                     echo -e "\nThe UNIX account \"`echo $1`\" is not connected at the moment!!"
                 fi

            

            else
                echo -e "\nThe UNIX account \"`echo $1`\" does not exist in the system!!"
            fi


else
    echo -e "\nThe script \"`basename $0`\" must receive two arguments!! \a\n"
fi

