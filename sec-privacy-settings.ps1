# sec-privacy-settings.ps1
Write-Host "--- Hardening Windows Privacy ---" -ForegroundColor Cyan
# Disable Telemetry
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0
# Disable Advertising ID
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0
Write-Host "Privacy hardening applied. Restart recommended." -ForegroundColor Green
Read-Host "Press Enter to exit"
