#!/bin/bash

CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80
LOG_FILE="system_health.log"

log_message() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') $1" | tee -a $LOG_FILE
}

check_cpu() {
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        log_message "High CPU usage detected: $CPU_USAGE%"
    fi
    echo "CPU Usage: $CPU_USAGE%"
}

check_memory() {
    MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    if (( $(echo "$MEMORY_USAGE > $MEMORY_THRESHOLD" | bc -l) )); then
        log_message "High memory usage detected: $MEMORY_USAGE%"
    fi
    echo "Memory Usage: $MEMORY_USAGE%"
}

check_disk() {
    DISK_USAGE=$(df / | grep / | awk '{ print $5}' | sed 's/%//g')
    if [ $DISK_USAGE -gt $DISK_THRESHOLD ]; then
        log_message "High disk usage detected: $DISK_USAGE%"
    fi
    echo "Disk Usage: $DISK_USAGE%"
}

check_processes() {
    ps aux --sort=-%cpu | awk 'NR<=10{print $0}' | tee -a $LOG_FILE
}

main() {
    check_cpu
    check_memory
    check_disk
    check_processes
}

main
