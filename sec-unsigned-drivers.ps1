# sec-unsigned-drivers.ps1
Write-Host "--- Checking for Unsigned Drivers ---" -ForegroundColor Cyan
Get-WmiObject Win32_PnPSignedDriver | Where-Object {$_.IsSigned -ne $true} | Select-Object DeviceName, Manufacturer | Format-Table -AutoSize
Read-Host "Unsigned drivers can be a security risk. Press Enter to exit"
