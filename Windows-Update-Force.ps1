# Windows-Update-Force.ps1
Write-Host "Checking for Windows Updates..." -ForegroundColor Cyan
$UpdateSession = New-Object -ComObject Microsoft.Update.Session
$UpdateSearcher = $UpdateSession.CreateUpdateSearcher()
$SearchResult = $UpdateSearcher.Search("IsInstalled=0")
Write-Host "Found $($SearchResult.Updates.Count) pending updates." -ForegroundColor Green
Read-Host "Press Enter to exit"
