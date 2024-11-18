#!/bin/bash

cat /etc/hosts | while read ip dom
do
	if [ $ip = "#" ]
	then
		break

	fi
	output=`nslookup $dom 8.8.8.8 | grep Address | awk '{print $2}' | tail -n 2 | head -n 1`
	if [[ $output != $ip ]]
	then
		echo "Bogus IP for $dom in /etc/hosts!"
	fi
done
