#!/bin/bash

set -e

SOURCE="$HOME/ict_lab2/docs"
BACKUP_DIR="$HOME/ict_lab2/backup"
LOG_FILE="$HOME/ict_lab2/logs/backup.log"

if [ ! -d "$SOURCE" ]; then
    echo "ERROR: Source directory does not exist: $SOURCE"
    exit 1
fi

mkdir -p "$BACKUP_DIR"

DATE=$(date +%Y%m%d_%H%M%S)
ARCHIVE="$BACKUP_DIR/docs_$DATE.tar.gz"

tar -czf "$ARCHIVE" -C "$HOME/ict_lab2" docs

echo "$(date '+%Y-%m-%d %H:%M:%S') Backup created: $ARCHIVE" >> "$LOG_FILE"

find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -delete

echo "Backup completed successfully:"
echo "$ARCHIVE"
