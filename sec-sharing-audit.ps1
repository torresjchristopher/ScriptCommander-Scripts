# sec-sharing-audit.ps1
Write-Host "--- Active Network Shares ---" -ForegroundColor Cyan
Get-SmbShare | Where-Object {$_.Name -notlike "*$"} | Select-Object Name, Path, Description | Format-Table -AutoSize
Read-Host "Verify only intended folders are shared. Press Enter to exit"
