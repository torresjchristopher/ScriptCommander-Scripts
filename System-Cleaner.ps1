# System-Cleaner.ps1
Write-Host "--- Starting System Cleanup ---" -ForegroundColor Cyan
$TempFolders = @("$env:TEMP\*", "C:\Windows\Temp\*", "C:\Windows\Prefetch\*")
foreach ($Folder in $TempFolders) {
    Write-Host "Cleaning: $Folder" -ForegroundColor Gray
    Remove-Item $Folder -Recurse -Force -ErrorAction SilentlyContinue
}
Write-Host "Cleanup Complete!" -ForegroundColor Green
Read-Host "Press Enter to exit"
