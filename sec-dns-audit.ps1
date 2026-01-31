# sec-dns-audit.ps1
Write-Host "--- DNS Configuration Audit ---" -ForegroundColor Cyan
$DNS = Get-DnsClientServerAddress | Where-Object {$_.ServerAddresses -ne $null}
foreach ($entry in $DNS) {
    Write-Host "Interface: $($entry.InterfaceAlias)" -ForegroundColor White
    Write-Host "Servers: $($entry.ServerAddresses -join ', ')" -ForegroundColor Yellow
}
Write-Host "`nVerify these servers match your trusted provider (e.g., 8.8.8.8 or 1.1.1.1)." -ForegroundColor Gray
Read-Host "Press Enter to exit"
