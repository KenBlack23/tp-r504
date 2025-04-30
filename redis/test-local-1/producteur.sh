n=1000
delay=3
while :
do
	nb=$(redis-cli --raw LLen  myQ)
	echo "Envoi d'un burst de 1000 valeurs..."
	for ((i=0; i<n; i++))
	do
		VALUE=$RANDOM
        redis-cli LPUSH myQ "$VALUE" > /dev/null 
	done
done
