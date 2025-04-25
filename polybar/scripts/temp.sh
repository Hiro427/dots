#!/bin/bash

# Check if sensors command is available
if ! command -v sensors &>/dev/null; then
    echo "N/A"
    exit 1
fi

# Extract temperature values using sensors
temps=$(sensors | grep -E 'temp[0-9]+' | awk '{print $2}' | tr -d '+°C')

# Check if any temperatures were found
if [ -z "$temps" ]; then
    echo "N/A"
    exit 1
fi

# Calculate the average temperature
total=0
count=0

for temp in $temps; do
    total=$(echo "$total + $temp" | bc)
    count=$((count + 1))
done

# Get the average temperature as an integer
average=$(echo "$total / $count" | bc)

# Print the average temperature for Polybar
echo "${average}°C"

