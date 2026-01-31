# sec-startup-check.ps1
Write-Host "--- Startup Persistence Audit ---" -ForegroundColor Cyan
$StartupItems = Get-CimInstance Win32_StartupCommand | Select-Object Name, Command, Location
foreach ($item in $StartupItems) {
    Write-Host "Name: $($item.Name)" -ForegroundColor White
    Write-Host "Command: $($item.Command)" -ForegroundColor Gray
    Write-Host "----------------"
}
Read-Host "Check for unknown programs. Press Enter to exit"
