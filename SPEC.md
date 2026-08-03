# Project Specification: Automated Weather ETL Pipeline

## Objective
Extract daily weather data for Casablanca, Morocco, transform it to get current and forecasted temperatures, and load it into a tabular log file.

## Data Pipeline
1. Extract: Scrape raw ASCII weather data from `wttr.in/Casablanca?T`
2. Transform:
   - Current Date (YYYY, MM, DD)
   - Observed Temperature at noon (today)
   - Forecasted Temperature at noon (tomorrow)
3. Load: Append a tab-separated record to `rx_poc.log`

## Output Schema (rx_poc.log)
year | month | day | obs_tmp | fc_temp
