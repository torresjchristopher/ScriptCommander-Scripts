# Process-Monitor.ps1
Write-Host "--- Top Memory Consumers ---" -ForegroundColor Red
Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First 10 Name, @{Name="Mem(MB)";Expression={[math]::round($_.WorkingSet64/1MB,2)}} | Format-Table -AutoSize
Read-Host "Press Enter to exit"
