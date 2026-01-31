# sec-usb-history.ps1
Write-Host "--- USB Connection History ---" -ForegroundColor Cyan
$USBPath = "HKLM:\SYSTEM\CurrentControlSet\Enum\USBSTOR"
Get-ChildItem -Path $USBPath | ForEach-Object {
    $Name = $_.PSChildName
    Write-Host "Device: $Name" -ForegroundColor White
}
Read-Host "Press Enter to exit"
