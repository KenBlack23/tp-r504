#!/bin/bash

myQ="message_queue"
SEUIL_ALERTE=30000  # exemple : seuil à partir duquel un traitement spécial est déclenché

while :
do
	ls=$(redis-cli --raw llen myQ)

    if [ $ls -gt 0 ]
	then
			value=$(redis-cli --raw rpop myQ)
#			echo "Valeur reçue : $value"
			ls=$(redis-cli --raw llen myQ)
#			echo "ls=$ls"
			if ! [ "$value" = "" ]
			then
				if [ $value -gt $SEUIL_ALERTE ]
        		then
					echo "⚠️  Valeur $VALUE dépasse le seuil $SEUIL_ALERTE ! Traitement spécial..."
    		        sleep 4
				fi
    		fi
	else 
		exit 0
	fi
done


