# Automated-Zip-Backup.ps1
$Source = "$env:USERPROFILE\Documents"
$Target = "$env:USERPROFILE\Desktop\Backup_$(Get-Date -Format 'yyyyMMdd').zip"
Compress-Archive -Path $Source -DestinationPath $Target -Force
Write-Host "Backup Complete: $Target" -ForegroundColor Green
Read-Host "Press Enter to exit"
