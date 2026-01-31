# sec-shadow-copy-audit.ps1
Write-Host "--- Volume Shadow Copy Audit ---" -ForegroundColor Cyan
Get-VssShadowStorage | Format-Table -AutoSize
Write-Host "Used for system restore and backups." -ForegroundColor Gray
Read-Host "Press Enter to exit"
