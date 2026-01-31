# Uptime-Checker.ps1
$U = (Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
Write-Host "Uptime: $($U.Days)d $($U.Hours)h $($U.Minutes)m" -ForegroundColor Green
Read-Host "Press Enter"
