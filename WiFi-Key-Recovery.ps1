# WiFi-Key-Recovery.ps1
Write-Host "--- Saved WiFi Passwords ---" -ForegroundColor Cyan
$Profiles = netsh wlan show profiles | Select-String "\:(.+)$" | ForEach-Object { $_.Matches.Groups[1].Value.Trim() }
foreach ($Profile in $Profiles) {
    $Pass = netsh wlan show profile name="$Profile" key=clear | Select-String "Key Content\s+\:(.+)$" | ForEach-Object { $_.Matches.Groups[1].Value.Trim() }
    Write-Host "Network: $Profile" -ForegroundColor White
    Write-Host "Password: $Pass" -ForegroundColor Green
    Write-Host "----------------"
}
Read-Host "Press Enter to exit"
