# sec-file-integrity-check.ps1
Write-Host "--- System File Integrity Check ---" -ForegroundColor Cyan
sfc /verifyonly
Write-Host "Integrity check complete. See logs for details." -ForegroundColor Green
Read-Host "Press Enter to exit"
