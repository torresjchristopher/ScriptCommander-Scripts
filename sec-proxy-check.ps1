# sec-proxy-check.ps1
Write-Host "--- System Proxy Audit ---" -ForegroundColor Cyan
$Proxy = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
if ($Proxy.ProxyEnable -eq 1) {
    Write-Host "PROXY ENABLED: $($Proxy.ProxyServer)" -ForegroundColor Red
} else {
    Write-Host "No system proxy detected." -ForegroundColor Green
}
Read-Host "Press Enter to exit"
