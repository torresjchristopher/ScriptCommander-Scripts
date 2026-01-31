# sec-defender-updates.ps1
Write-Host "Updating Defender Signatures..." -ForegroundColor Cyan
Update-MpSignature
Write-Host "Signatures are up to date." -ForegroundColor Green
Read-Host "Press Enter to exit"
