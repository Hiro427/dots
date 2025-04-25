#!/bin/env bash

API_KEY=$WEATHER_API 
LOCATION="New%20York"

RESPONSE=$(curl -s "https://api.weatherapi.com/v1/current.json?key=${API_KEY}&q=${LOCATION}&aqi=no")

NAME=$(echo "$RESPONSE" | jq -r '.location.name')

TEMPERATURE=$(echo "$RESPONSE" | jq -r '.current.temp_f' | cut -d'.' -f1-)

echo "$TEMPERATURE"
