#!/bin/bash

# Function to check application status
check_application_status() {
    local url=$1
    local status_code=$(curl -sL -w "%{http_code}" "$url" -o /dev/null)
    if [ $status_code -eq 200 ]; then
        log_status "Application at $url is UP and running."
    else
        log_status "Application at $url is DOWN with status code $status_code."
    fi
}

# Function to log application status
log_status() {
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$timestamp - $1"
    # You can log to a file here if needed
}

# Main function to check application status
main() {
    local application_url="http://example.com"  # Replace with your application URL
    check_application_status "$application_url"
}

# Run the main function
main
