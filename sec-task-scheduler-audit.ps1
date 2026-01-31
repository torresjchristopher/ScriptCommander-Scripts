# sec-task-scheduler-audit.ps1
Write-Host "--- Non-Microsoft Scheduled Tasks ---" -ForegroundColor Cyan
Get-ScheduledTask | Where-Object {$_.Author -notlike "*Microsoft*"} | Select-Object TaskName, TaskPath, State | Format-Table -AutoSize
Read-Host "Persistence check complete. Press Enter to exit"
