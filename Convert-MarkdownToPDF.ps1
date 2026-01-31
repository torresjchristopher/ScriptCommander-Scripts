# Convert-MarkdownToPDF.ps1
# Description: Interactive script to convert Markdown files to PDF using Python.

$ErrorActionPreference = "Stop"

function Show-FilePicker {
    Add-Type -AssemblyName System.Windows.Forms
    $FilePicker = New-Object System.Windows.Forms.OpenFileDialog
    $FilePicker.Filter = "Markdown Files (*.md)|*.md|All Files (*.*)|*.*"
    $FilePicker.Title = "Select a Markdown file to convert"
    $Show = $FilePicker.ShowDialog()
    if ($Show -eq "OK") {
        return $FilePicker.FileName
    }
    return $null
}

Write-Host "--- Markdown to PDF Converter ---" -ForegroundColor Cyan

# Check for Python
if (!(Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "Error: Python is not installed or not in PATH." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit
}

# Select File
$InputFile = Show-FilePicker
if (!$InputFile) {
    Write-Host "No file selected. Exiting." -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit
}

Write-Host "Selected: $InputFile"

# Get script directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$ConverterScript = Join-Path $ScriptDir "markdown_converter.py"

# Run conversion
Write-Host "Converting..." -ForegroundColor Green
python "$ConverterScript" "$InputFile"

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nConversion complete!" -ForegroundColor Green
} else {
    Write-Host "`nConversion failed." -ForegroundColor Red
}

Read-Host "`nPress Enter to close"
