# sec-bluetooth-audit.ps1
Write-Host "--- Bluetooth Device Audit ---" -ForegroundColor Cyan
Get-PnpDevice -Class Bluetooth | Select-Object FriendlyName, Status | Format-Table -AutoSize
Read-Host "Verify no unknown devices are paired. Press Enter to exit"
