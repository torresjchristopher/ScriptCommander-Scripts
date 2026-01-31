# Desktop-Organizer.ps1
$Path = "$env:USERPROFILE\Desktop"
$Mapping = @{
    "Images" = @(".jpg", ".png", ".gif", ".webp")
    "PDFs"   = @(".pdf")
    "Docs"   = @(".docx", ".txt", ".csv")
}

foreach ($Folder in $Mapping.Keys) {
    $Target = Join-Path $Path $Folder
    if (!(Test-Path $Target)) { New-Item $Target -ItemType Directory }
    foreach ($Ext in $Mapping[$Folder]) {
        Get-ChildItem -Path $Path -Filter "*$Ext" | Move-Item -Destination $Target -ErrorAction SilentlyContinue
    }
}
Write-Host "Desktop Organized!" -ForegroundColor Green
Read-Host "Press Enter to exit"
