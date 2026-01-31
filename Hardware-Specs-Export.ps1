# Hardware-Specs-Export.ps1
Write-Host "Exporting System Specs..." -ForegroundColor Cyan
$Specs = @{
    "Processor" = (Get-CimInstance Win32_Processor).Name
    "RAM" = "$([math]::round((Get-CimInstance Win32_PhysicalMemory | Measure-Object Capacity -Sum).Sum / 1GB, 0)) GB"
    "OS" = (Get-CimInstance Win32_OperatingSystem).Caption
}
$Specs | ConvertTo-Json | Out-File "SystemSpecs.json"
Write-Host "Saved to SystemSpecs.json" -ForegroundColor Green
Read-Host "Press Enter to exit"
