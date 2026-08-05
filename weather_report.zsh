#!/usr/bin/zsh

# Define the date variable for the filename
today=$(date +%Y%m%d)
weather_report="raw_data_${today}.txt"

# 1. Extract (Added User-Agent to prevent GitHub Actions blocks)
curl -s -A "curl/7.68.0" "wttr.in/Casablanca?T" > $weather_report

# 2. Transform
year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)

grep "°C" $weather_report > temperatures.txt

obs_tmp=$(head -1 temperatures.txt | grep -Eo -e '-?[0-9]+' | head -1)
fc_temp=$(head -3 temperatures.txt | tail -1 | grep -Eo -e '-?[0-9]+' | sed -n '3p')

# 3. Load (With a safeguard condition)
if [[ -n "$obs_tmp" && -n "$fc_temp" ]]; then
    record="${year}\t${month}\t${day}\t${obs_tmp}\t${fc_temp}"
    echo -e $record >> rx_poc.log
else
    echo "Error: Weather data could not be parsed."
    exit 1
fi

# Clean up temporary files
rm temperatures.txt $weather_report
