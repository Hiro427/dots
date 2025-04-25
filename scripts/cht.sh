#!/bin/bash

#
# topic=$1
#
# query=${2:}
#
# curl -s "cht.sh/$topic/$query" | bat 

topic=$1
shift # Remove the topic

# Join remaining args with %20
query=$(printf "%s%%20" "$@")
query=${query%%%20}  # Remove the trailing %20

curl -s "cht.sh/$topic/$query" | bat

