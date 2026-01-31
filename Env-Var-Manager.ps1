# Env-Var-Manager.ps1
Write-Host "--- User Path Environment Variables ---" -ForegroundColor Cyan
$Paths = [Environment]::GetEnvironmentVariable("Path", "User") -split ";"
$Paths | ForEach-Object { Write-Host "- $_" -ForegroundColor Gray }
Read-Host "Press Enter to exit"
