# File-Content-Searcher.ps1
$Query = Read-Host "Enter search term"
Write-Host "Searching..." -ForegroundColor Cyan
Select-String -Path "*.*" -Pattern $Query -Recursive | Select-Object Path, LineNumber, Line | Format-List
Read-Host "Press Enter to exit"
