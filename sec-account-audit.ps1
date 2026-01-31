# sec-account-audit.ps1
Write-Host "--- Local Account Audit ---" -ForegroundColor Cyan
Get-LocalUser | Select-Object Name, Enabled, LastLogon | Format-Table -AutoSize
Read-Host "Check for unauthorized accounts. Press Enter to exit"
