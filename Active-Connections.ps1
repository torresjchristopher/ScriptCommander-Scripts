# Active-Connections.ps1
Get-NetTCPConnection -State Established | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort | Format-Table
Read-Host "Press Enter"
