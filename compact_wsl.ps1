# compact_wsl.ps1
# Description: Shuts down WSL and compacts Docker/Podman virtual disks to save space.

$ErrorActionPreference = "Stop"

# Check for Administrator privileges
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Error "This script must be run as Administrator."
    exit 1
}

# --- CONFIGURATION ---
$SearchPaths = @(
    "$env:LOCALAPPDATA\Docker\wsl\disk\docker_data.vhdx",
    "$env:LOCALAPPDATA\Containers\wsl\data\ext4.vhdx",
    "$env:USERPROFILE\.local\share\containers\storage\volumes\*\*.vhdx"
)

Write-Host "--- WSL Disk Compactor ---" -ForegroundColor Cyan
Write-Host "Scanning for virtual disks..."

# Find existing files
$FoundFiles = $SearchPaths | Where-Object { Test-Path $_ }

if ($FoundFiles.Count -eq 0) {
    Write-Warning "No standard Docker or Podman disk files found."
    Read-Host "Press Enter to exit..."
    exit
}

# List files
for ($i=0; $i -lt $FoundFiles.Count; $i++) {
    $sizeGB = "{0:N2}" -f ((Get-Item $FoundFiles[$i]).Length / 1GB)
    Write-Host "[$i] Found: $($FoundFiles[$i])" -ForegroundColor Green
    Write-Host "    Current Size: $sizeGB GB"
}

Write-Host "`nWARNING: This will shut down ALL WSL instances (Docker, Podman, Ubuntu, etc)." -ForegroundColor Red
$confirm = Read-Host "Do you want to proceed? (y/n)"
if ($confirm -ne 'y') { exit }

Write-Host "Shutting down WSL..." -ForegroundColor Yellow
wsl --shutdown

foreach ($file in $FoundFiles) {
    Write-Host "Compacting: $file" -ForegroundColor Cyan
    
    # Create temporary diskpart script
    $DiskPartScript = "$env:TEMP\compact_diskpart_$((Get-Date).Ticks).txt"
    "select vdisk file=`"$file`"" | Out-File -FilePath $DiskPartScript -Encoding ASCII
    "compact vdisk" | Out-File -FilePath $DiskPartScript -Encoding ASCII -Append
    "detach vdisk" | Out-File -FilePath $DiskPartScript -Encoding ASCII -Append

    # Run diskpart
    diskpart /s $DiskPartScript
    
    # Cleanup
    Remove-Item $DiskPartScript -ErrorAction SilentlyContinue
    
    $newSize = "{0:N2}" -f ((Get-Item $file).Length / 1GB)
    Write-Host "Finished. New Size: $newSize GB" -ForegroundColor Green
}

Write-Host "`nAll operations complete."
Read-Host "Press Enter to close..."
