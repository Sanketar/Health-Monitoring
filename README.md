# Bash Scripts for System Health Monitoring, Backup, and Log Analysis

This guide provides simple steps to use three Bash scripts for monitoring system health, automating backups, and analyzing web server logs.

## System Health Monitoring Script (system_health_monitor.sh)

## Description
This script monitors the health of a Linux system. It checks CPU usage, memory usage, disk space, and running processes. If any of these metrics exceed predefined thresholds (e.g., CPU usage > 80%), it sends an alert to the console or a log file.


### Steps to Use:

### 1. Create the Script File:
* Open a terminal.
* Create a new file named system_health_monitor.sh :
```
vi system_health.sh
```

### 2. Copy and paste the system_health_monitor.sh script file:

### 3. Make the Script Executable:
```
chmod +x system_health.sh
```

### 4. Install bc if Not Already Installed:
```
sudo apt-get install bc
```

### 5. Run the script using ./system_health_monitor.sh to initiate system health monitoring.
```
./system_health_monitor.sh
```

##  Automated Backup Solution ( automated_backup_solution.sh )

## Description
This script automates the backup of a specified directory to a remote server or a cloud storage solution. It provides a report on the success or failure of the backup operation.

### Steps to Use:

### 1. Create the Script File:
* Open a terminal.
* Create a new file named automated_backup_solution.sh :
```
vi automated_backup_solution.sh
```
### 2. Copy and paste the automated_backup_solution.sh script file:

### 3. Make the Script Executable:
```
chmod +x automated_backup_solution.sh
```

### 4. Run the script using ./system_health_monitor.sh to initiate system health monitoring.
```
./automated_backup_solution.sh.sh
```

## Log File Analyzer ( log_file_analyzer.sh )

## Description
This script analyzes web server logs (e.g., Apache, Nginx) for common patterns such as the number of 404 errors, the most requested pages, or IP addresses with the most requests. It outputs a summarized report.

### Steps to Use:

### 1. Create the Script File:
* Open a terminal.
* Create a new file named log_file_analyzer.sh :
```
vi log_file_analyzer.sh

```
### 2. Copy and paste the log_file_analyzer.sh script file:

### 3. Make the Script Executable:
```
chmod +x log_file_analyzer.sh

```
### 4. Run the script using ./log_file_analyzer.sh to initiate system health monitoring.
```
./log_file_analyzer.sh.sh
```

-------------
This README file provides a simple explanation of how to create, set up, and run each script for system monitoring, backups, and log analysis. Make sure to adjust the paths and any specific details according to your setup.
