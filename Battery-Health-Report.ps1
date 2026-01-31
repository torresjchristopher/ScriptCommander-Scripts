# Battery-Health-Report.ps1
$Path = "$env:USERPROFILE\Desktop\BatteryReport.html"
powercfg /batteryreport /output $Path
Write-Host "Battery report generated at: $Path" -ForegroundColor Green
Start-Process $Path
Read-Host "Press Enter to exit"
