# ICT6001 Laboratory Work 2

Laboratory work on Linux Bash, Windows PowerShell, file management,
log analysis, access rights, integrity verification and automation.

## Scripts

### backup.sh
Linux Bash backup script. It creates timestamped archives, writes
backup information to a log file and removes backups older than 7 days.

### backup.ps1
Windows PowerShell equivalent using Compress-Archive.

## Run on Linux

chmod +x scripts/backup.sh
./scripts/backup.sh

## Run on Windows PowerShell

.\scripts\backup.ps1
