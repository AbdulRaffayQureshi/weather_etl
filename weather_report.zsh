#!/bin/bash#!/bin/bash

# Define the date variable for the filename
today=$(date +%Y%m%d)
weather_report="raw_data_${today}.txt"

# 1. Extract (Using standard browser User-Agent to prevent cloud blocks)
curl -s -A "Mozilla/5.0" "wttr.in/Islamabad?T" > $weather_report

# 2. Transform
year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)

# Save lines containing °C
grep "°C" $weather_report > temperatures.txt

# Extract the FIRST temperature found in the file (observed temp)
obs_tmp=$(grep -Eo -e '[-+]?[0-9]+' temperatures.txt | head -n 1)

# Extract the LAST temperature found in the file (forecast temp)
fc_temp=$(grep -Eo -e '[-+]?[0-9]+' temperatures.txt | tail -n 1)

# 3. Load (With safeguard check)
if [[ -n "$obs_tmp" && -n "$fc_temp" ]]; then
    record="${year}\t${month}\t${day}\t${obs_tmp}\t${fc_temp}"
    echo -e $record >> rx_poc.log
else
    echo "Error: Weather data could not be parsed."
    exit 1
fi

# Clean up temporary files
rm -f temperatures.txt $weather_report

# Define the date variable for the filename
today=$(date +%Y%m%d)
weather_report="raw_data_${today}.txt"

# 1. Extract (Using standard browser User-Agent to prevent cloud blocks)
curl -s -A "Mozilla/5.0" "wttr.in/Islamabad?T" > $weather_report

# 2. Transform
year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)

# Save lines containing °C
grep "°C" $weather_report > temperatures.txt

# Extract the FIRST temperature found in the file (observed temp)
obs_tmp=$(grep -Eo -e '[-+]?[0-9]+' temperatures.txt | head -n 1)

# Extract the LAST temperature found in the file (forecast temp)
fc_temp=$(grep -Eo -e '[-+]?[0-9]+' temperatures.txt | tail -n 1)

# 3. Load (With safeguard check)
if [[ -n "$obs_tmp" && -n "$fc_temp" ]]; then
    record="${year}\t${month}\t${day}\t${obs_tmp}\t${fc_temp}"
    echo -e $record >> rx_poc.log
else
    echo "Error: Weather data could not be parsed."
    exit 1
fi

# Clean up temporary files
rm -f temperatures.txt $weather_report
