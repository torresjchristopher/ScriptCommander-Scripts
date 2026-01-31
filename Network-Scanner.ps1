# Network-Scanner.ps1
Write-Host "--- Scanning Local Network ---" -ForegroundColor Cyan
$Gateway = (Get-NetRoute | Where-Object {$_.DestinationPrefix -eq '0.0.0.0/0'}).NextHop
$Prefix = $Gateway.Substring(0, $Gateway.LastIndexOf('.') + 1)
1..254 | ForEach-Object {
    $IP = "$Prefix$_"
    if (Test-Connection $IP -Count 1 -Quiet) {
        $HostName = try { [System.Net.Dns]::GetHostEntry($IP).HostName } catch { "Unknown" }
        Write-Host "Found: $IP ($HostName)" -ForegroundColor Green
    }
}
Read-Host "Scan Complete. Press Enter to exit"
