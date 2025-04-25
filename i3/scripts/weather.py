#!/bin/env python3
import requests
import os

API_KEY = os.getenv("WEATHER_API")
LOCATION = "New%20York"


data = requests.get(f"https://api.weatherapi.com/v1/current.json?key={API_KEY}&q={LOCATION}&aqi=no")

json = data.json()

location = json["location"].get("name")
temperature = json["current"].get("temp_f")
temp = round(float(temperature))
print(f"{location} {temp}F")



