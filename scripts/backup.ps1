$Source = "$HOME\ict_lab2\docs"
$BackupDir = "$HOME\ict_lab2\backup"
$LogFile = "$HOME\ict_lab2\logs\backup_windows.log"

if (-not (Test-Path $Source)) {
    Write-Error "Source directory does not exist: $Source"
    exit 1
}

if (-not (Test-Path $BackupDir)) {
    New-Item -ItemType Directory -Path $BackupDir | Out-Null
}

$Date = Get-Date -Format "yyyyMMdd_HHmmss"
$Archive = "$BackupDir\docs_$Date.zip"

Compress-Archive -Path "$Source\*" -DestinationPath $Archive

"$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') Backup created: $Archive" |
    Out-File -Append $LogFile

Get-ChildItem $BackupDir -Filter "*.zip" |
    Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-7) } |
    Remove-Item

Write-Host "Backup completed successfully:"
Write-Host $Archive
