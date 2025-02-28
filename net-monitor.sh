#!/bin/bash

echo "Script started"
#server="" suggeted using array
servers=("google.com" "invalid.website" "bing.com")
for server in "${servers[@]}"; do
	if ping -c 1 -q $server &> /dev/null; then
		echo "$(date '+%Y-%m-%d %H:%M:%S') | $server | UP"
	else
		echo "$(date '+%Y %m %d %H:%M:%S') | $server | Down"
	fi
done
