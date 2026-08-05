#!/usr/bin/zsh

# Fetch weather data with custom User-Agent and explicit location
city="Islamabad"
raw_weather=$(curl -s -A "curl/7.68.0" "wttr.in/${city}")

# Extract temperatures (your existing grep/sed logic)
obs_tmp=$(echo "$raw_weather" | grep -m 1 "°C" | grep -oE "[-+]?[0-9]+" | head -n 1)
fc_temp=$(echo "$raw_weather" | grep -A 10 "Tomorrow" | grep -oE "[-+]?[0-9]+" | head -n 1)

# Get date components
year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)

# Safeguard: Only log if both values were successfully extracted
if [[ -n "$obs_tmp" && -n "$fc_temp" ]]; then
    echo -e "${year}\t${month}\t${day}\t${obs_tmp}\t${fc_temp}" >> rx_poc.log
else
    echo "Error: Failed to extract weather data from wttr.in"
    exit 1
fi
