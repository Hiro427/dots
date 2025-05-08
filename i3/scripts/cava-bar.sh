#!/usr/bin/env bash

bar="▁▂▃▄▅▆▇█"
dict="s/;//g;"

# creating "dictionary" to replace char with bar
i=0
while [ $i -lt ${#bar} ]
do
    dict="${dict}s/$i/${bar:$i:1}/g;"
    i=$((i=i+1))
done

# write cava config
config_file="/tmp/polybar_cava_config"
echo "
[general]
bars = 6

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
" > $config_file

# read stdout from cava
# cava -p $config_file | while read -r line; do
#     echo $line | sed $dict
# done


cava -p $config_file | while read -r line; do
    # Check if the line contains any non-zero characters (or non-space if Cava outputs spaces)
    if [[ "$(playerctl metadata)" == "No players found" ]]; then
        # If it contains non-zero values, process and print
        echo ""
    else
        # If it's all zeros (flat), print an empty string
        echo "$line" | sed "$dict"
    fi
done
