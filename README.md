# System and Application Health Monitoring Scripts

This repository contains Bash scripts for monitoring system health metrics and checking the status of an application.

## System Health Monitoring Script (system_health_monitor.sh)

## Overview
The system_health_monitor.sh script monitors various system metrics on a Linux system:

* CPU Usage: Checks if CPU usage exceeds a specified threshold.
* Memory Usage: Monitors memory usage and alerts if it surpasses a predefined threshold.
* Disk Usage: Evaluates disk space usage for each partition and logs alerts if thresholds are exceeded.
* Running Processes: Counts the number of running processes and alerts if it exceeds a set threshold.

## Usage
1. Adjust thresholds for CPU, memory, and disk usage as needed within the script.
2. Run the script using ./system_health_monitor.sh to initiate system health monitoring.


```
./system_health_monitor.sh
```

## Application Health Checker Script (application_health_checker.sh)

## Overview
The application_health_checker.sh script checks the status of a specified application:

* Sends an HTTP request to the application URL.
* Retrieves the HTTP status code to determine if the application is running (UP) or down (DOWN).
* Logs the application status with timestamps.

## Usage
1. Replace "http://example.com" with your actual application URL in the script.
2. Execute the script using ./application_health_checker.sh to check the application status.

```
./application_health_checker.sh
```

