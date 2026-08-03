import csv

# Initialize variables to keep track of the error metrics
total_error = 0
record_count = 0

# Print a formatted table header for our output
print(f"{'Date':<15} | {'Observed':<10} | {'Forecast':<10} | {'Error (Abs)'}")
print("-" * 55)

# Open the log file
with open('rx_poc.log', 'r') as file:
    # Configure the reader to expect tabs instead of commas
    reader = csv.DictReader(file, delimiter='\t')
    
    for row in reader:
        # Extract the variables using the exact column header names
        date_str = f"{row['year']}-{row['month']}-{row['day']}"
        obs = int(row['obs_tmp'])
        fc = int(row[' fc_temp'])
        
        # Calculate how far off the forecast was (absolute value)
        error = abs(obs - fc)
        
        # Add to our running totals for the final calculation
        total_error += error
        record_count += 1
        
        # Print the daily breakdown
        print(f"{date_str:<15} | {obs:<10} | {fc:<10} | {error}°C")

# Calculate and display the overall accuracy metric
if record_count > 0:
    avg_error = total_error / record_count
    print("-" * 55)
    print(f"Total days analyzed: {record_count}")
    print(f"Average Forecast Error: {avg_error:.2f}°C")
