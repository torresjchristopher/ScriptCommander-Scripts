# Disk-Health-Report.ps1
Write-Host "--- Disk Health Status ---" -ForegroundColor Cyan
Get-PhysicalDisk | Select-Object FriendlyName, MediaType, HealthStatus, OperationalStatus | Format-Table -AutoSize
Get-Volume | Where-Object {$_.DriveLetter} | Select-Object DriveLetter, FileSystemLabel, @{Name="FreeSpace(GB)";Expression={[math]::round($_.SizeRemaining/1GB,2)}}, @{Name="TotalSize(GB)";Expression={[math]::round($_.Size/1GB,2)}} | Format-Table -AutoSize
Read-Host "Press Enter to exit"
