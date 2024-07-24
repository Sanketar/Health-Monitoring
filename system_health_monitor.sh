#!/bin/bash

# Function to check CPU usage
check_cpu_usage() {
    local threshold=$1
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    if [ $(echo "$cpu_usage > $threshold" | bc) -eq 1 ]; then
        log_alert "CPU usage is $cpu_usage% which exceeds $threshold% threshold."
    fi
}

# Function to check memory usage
check_memory_usage() {
    local threshold=$1
    local memory_usage=$(free | awk '/Mem/{printf "%.2f", $3/$2 * 100}')
    if [ $(echo "$memory_usage > $threshold" | bc) -eq 1 ]; then
        log_alert "Memory usage is $memory_usage% which exceeds $threshold% threshold."
    fi
}

# Function to check disk usage
check_disk_usage() {
    local threshold=$1
    local partitions=$(df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $5 " " $6}')
    while read -r partition; do
        local usage=$(echo "$partition" | awk '{print $1}' | sed 's/%//')
        local mount_point=$(echo "$partition" | awk '{print $2}')
        if [ $usage -gt $threshold ]; then
            log_alert "Disk $mount_point usage is $usage% which exceeds $threshold% threshold."
        fi
    done <<< "$partitions"
}

# Function to check running processes
check_running_processes() {
    local threshold=100  # Adjust as needed
    local process_count=$(ps aux | wc -l)
    if [ $process_count -gt $threshold ]; then
        log_alert "Number of running processes is $process_count which exceeds $threshold."
    fi
}

# Function to log alerts to console or file
log_alert() {
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$timestamp - ALERT: $1"
    # You can log to a file here if needed
}

# Main function to run health checks
main() {
    local cpu_threshold=80  # CPU threshold percentage
    local memory_threshold=80  # Memory threshold percentage
    local disk_threshold=80  # Disk usage threshold percentage

    check_cpu_usage "$cpu_threshold"
    check_memory_usage "$memory_threshold"
    check_disk_usage "$disk_threshold"
    check_running_processes
}

# Run the main function
main
