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
