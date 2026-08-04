#!/bin/bash

# 1. Extract

today=$(date +%Y%m%d)
weather_report="raw_data_${today}.txt"

curl -s "wttr.in/Casablanca?T" > $weather_report

# 2. Transform

year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)

grep "°C" $weather_report > temperatures.txt

obs_tmp=$(head -1 temperatures.txt | grep -Eo -e '-?[0-9]+' | head -1)
fc_temp=$(head -3 temperatures.txt | tail -1 | grep -Eo -e '-?[0-9]+' | sed -n '3p')

# Load

record="${year}\t${month}\t${day}\t${obs_tmp}\t${fc_temp}"

echo -e $record >> rx_poc.log

rm temperatures.txt

# 1. Navigate to your project folder
# Cron runs in a minimal background environment, so it must be told exactly where to go
cd /mnt/c/users/qures/projects/linux/weather_etl

# 2. Stage the newly updated log file
git add rx_poc.log

# 3. Commint the changes
git commit -m "date: Automated daily weather log update"

# 4. Push to Github repo
git push
