# sec-firewall-status.ps1
Write-Host "--- Windows Firewall Audit ---" -ForegroundColor Cyan
Get-NetFirewallProfile | Select-Object Name, Enabled | Format-Table -AutoSize
if ((Get-NetFirewallProfile | Where-Object {$_.Enabled -eq $false})) {
    Write-Host "WARNING: One or more firewall profiles are DISABLED!" -ForegroundColor Red
} else {
    Write-Host "All firewall profiles are ACTIVE." -ForegroundColor Green
}
Read-Host "Press Enter to exit"
