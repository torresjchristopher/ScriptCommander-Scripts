# sec-log-audit.ps1
Write-Host "--- Failed Login Attempt Audit (Last 24h) ---" -ForegroundColor Cyan
Get-EventLog -LogName Security -InstanceId 4625 -After (Get-Date).AddDays(-1) -ErrorAction SilentlyContinue | Select-Object TimeGenerated, Message | Format-List
Write-Host "If many attempts are listed, you may be under a brute-force attack." -ForegroundColor Yellow
Read-Host "Press Enter to exit"
