#!/bin/bash
#
# this script shows the weather forecast for a city using wttr.in curl interface
#
# dependencies: curl

ROFI="${ROFI:-rofi}"
FORECAST_DAYS="${FORECAST_DAYS:-2}" # 0 current weather, 1 today, 2 today & tomorrow, empty 3days

weather_help="Type the name of a place and press <b>Enter</b> to show its weather forecast"

weather=$(curl -s wttr.in/"$city"?lang=ru\&ATFn$FORECAST_DAYS)

while city=$($ROFI -dmenu -i -mesg "$weather_help&#x0a;$weather" -p "Place" -theme-str "window{height:100%;}listview{enabled:false;}mainbox{orientation:vertical;}imagebox{background-image:url('~/.wallpaper',width);}"); do
    city=$(echo $city | tr " " "+")
    weather=$(curl -s wttr.in/"$city"?lang=ru\&ATFn$FORECAST_DAYS)
done
