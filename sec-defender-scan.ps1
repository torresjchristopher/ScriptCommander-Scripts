# sec-defender-scan.ps1
Write-Host "Starting Quick Windows Defender Scan..." -ForegroundColor Cyan
Start-MpScan -ScanType QuickScan
Write-Host "Scan completed." -ForegroundColor Green
Read-Host "Press Enter to exit"
