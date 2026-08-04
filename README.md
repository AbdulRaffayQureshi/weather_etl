# 🌦️ Automated Weather ETL Pipeline

![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

> **A complete end-to-end Data Engineering and Analysis pipeline built in the Linux terminal and automated in the cloud.**

## 📖 The Story
This project started as a raw data extraction challenge and evolved into a fully automated cloud pipeline. The goal? To dynamically scrape daily weather forecasts, parse out the noise, store the data efficiently, and mathematically analyze how accurate the weather predictions actually are. 

Instead of relying on heavy frameworks, this project was built from scratch using pure Linux philosophy: piping small, specialized terminal tools together to create a powerful automated system.

## ⚙️ Architecture & Workflow

The pipeline is broken down into four distinct phases:

1. **📥 Extract (`curl`)**: Reaches out to the `wttr.in` API to pull raw, unformatted ASCII weather data.
2. **✂️ Transform (`grep`, `head`, `sed`)**: Slices through the raw text and uses Regular Expressions (Regex) to isolate the exact current observed temperature and tomorrow's noon forecast.
3. **☁️ Automate & Load (GitHub Actions)**: A cloud CI/CD workflow runs daily at 12:00 PM on a temporary Ubuntu runner. It executes the extraction script, appends the data to `rx_poc.log`, and automatically commits and pushes the updates back to this repository.
4. **📊 Analyze (`python3`)**: A Python script ingests the historical log file, handles the data structures, and calculates the absolute error between predicted and observed temperatures.

## 🚀 How to Run It

### 1. Cloud Execution (Automated)
This repository is configured with a GitHub Actions workflow (`pipeline.yml`). It runs autonomously every day, but can also be triggered manually by navigating to the **Actions** tab in GitHub and clicking **Run workflow**.

### 2. Local Manual Execution
To manually trigger the ETL shell script locally and append a new row of data to the log:
```bash
./weather_report.zsh
