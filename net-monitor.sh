#!/bin/bash

echo "Script started"
#server="" suggeted using array

#User input server name
	echo "Enter server addresses seperated by spaces: "
	read -a servers
#servers=("google.com" "invalid.website" "bing.com")

for server in "${servers[@]}"; do
	#Get the starting time
start_time=$(date +%s%3N)

	if ping -c 1 -q $server &> /dev/null; then
end_time=$(date +%s%3N)

response_time=$((end_time - start_time))
	echo "$(date '+%Y-%m-%d %H:%M:%S'),$server,UP, Response Time: ${response_time}ms"
else
	echo "$(date '+%Y %m %d %H:%M:%S'),$server,Down"
fi
done
