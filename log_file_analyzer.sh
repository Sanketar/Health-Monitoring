#!/bin/bash

LOG_FILE_PATH="/path/to/log/file"
LOG_FILE_ANALYSIS="log_file_analysis.txt"

analyze_log() {
    echo "Total 404 errors:" > $LOG_FILE_ANALYSIS
    grep " 404 " $LOG_FILE_PATH | wc -l >> $LOG_FILE_ANALYSIS

    echo "Most requested pages:" >> $LOG_FILE_ANALYSIS
    awk '{print $7}' $LOG_FILE_PATH | sort | uniq -c | sort -nr | head -5 >> $LOG_FILE_ANALYSIS

    echo "Most active IP addresses:" >> $LOG_FILE_ANALYSIS
    awk '{print $1}' $LOG_FILE_PATH | sort | uniq -c | sort -nr | head -5 >> $LOG_FILE_ANALYSIS
}

analyze_log
