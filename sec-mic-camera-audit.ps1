# sec-mic-camera-audit.ps1
Write-Host "--- Privacy Settings Audit ---" -ForegroundColor Cyan
$Keys = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone"
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam"
)
foreach ($key in $Keys) {
    $Type = Split-Path $key -Leaf
    $Value = Get-ItemProperty -Path $key -Name "Value" -ErrorAction SilentlyContinue
    $Status = if ($Value.Value -eq "Allow") { "ENABLED" } else { "DISABLED" }
    Write-Host "$Type Access: $Status" -ForegroundColor ($Status -eq "ENABLED" ? "Yellow" : "Green")
}
Read-Host "Press Enter to exit"
