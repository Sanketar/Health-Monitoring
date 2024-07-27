#!/bin/bash

SOURCE_DIR="/path/to/source"
BACKUP_DIR="/path/to/backup"
LOG_FILE="backup.log"
REMOTE_SERVER="user@remote_server:/path/to/backup"

log_message() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') $1" | tee -a $LOG_FILE
}

perform_backup() {
    TIMESTAMP=$(date +'%Y%m%d%H%M%S')
    BACKUP_PATH="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"
    
    if tar -czf $BACKUP_PATH $SOURCE_DIR; then
        log_message "Local backup successful: $BACKUP_PATH"
        
        if scp $BACKUP_PATH $REMOTE_SERVER; then
            log_message "Remote backup successful"
        else
            log_message "Remote backup failed"
        fi
    else
        log_message "Local backup failed"
    fi
}

perform_backup
