#!/bin/bash

echo "Script started"

log_file="log.csv"

# Corrected line: Removed the extra double quote
echo "Timestamp,Server,Status,Response Time" > "$log_file"

# User input server names
echo "Enter server addresses separated by spaces: "
read -a servers

for server in "${servers[@]}"; do
    if ping_output=$(ping -c 1 "$server" 2>/dev/null); then
        # Extract response time using awk
        response_time=$(echo "$ping_output" | awk -F'time=' '/time=/ {print $2}' | awk '{print $1}')
        
        # If response_time is empty, set it to "N/A"
        [[ -z "$response_time" ]] && response_time="N/A"

        echo "$(date '+%Y-%m-%d %H:%M:%S'),$server,UP,${response_time}ms" >> "$log_file"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S'),$server,Down,N/A" >> "$log_file"
    fi
done

echo "Script Completed. Results saved to $log_file"
