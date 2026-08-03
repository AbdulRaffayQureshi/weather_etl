# 🌦️ Automated Weather ETL Pipeline

![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Cron](https://img.shields.io/badge/cron-Automation-success?style=for-the-badge)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

> **A complete end-to-end Data Engineering and Analysis pipeline built entirely in the Linux terminal.**

## 📖 The Story
This project started as a raw data extraction challenge and evolved into an automated pipeline. The goal? To dynamically scrape daily weather forecasts, parse out the noise, store the data efficiently, and mathematically analyze how accurate the weather predictions actually are. 

Instead of relying on heavy frameworks, this project was built from scratch using pure Linux philosophy: piping small, specialized terminal tools together to create a powerful automated system.

## ⚙️ Architecture & Workflow

The pipeline is broken down into four distinct phases:

1. **📥 Extract (`curl`)**: Reaches out to the `wttr.in` API to pull raw, unformatted ASCII weather data.
2. **✂️ Transform (`grep`, `head`, `sed`)**: Slices through the raw text and uses Regular Expressions (Regex) to isolate the exact current observed temperature and tomorrow's noon forecast.
3. **💾 Load (`cron`, `>>`)**: Appends the cleaned data into a tab-separated log file (`rx_poc.log`). A background `cron` job automates this to run daily at 12:00 PM.
4. **📊 Analyze (`python3`)**: A Python script ingests the historical log file, handles the data structures, and calculates the absolute error between predicted and observed temperatures.

## 🚀 How to Run It

### 1. Manual Execution
To manually trigger the ETL shell script and append a new row of data to the log:
```bash
./weather_report.zsh
