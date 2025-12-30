<#
Author: Kapr Idriss Conteh
GitHub: https://github.com/kconteh1
Created: 2025
License: MIT License

Description:
This script prepares a Windows system for IT administrative work by:
- Checking PowerShell requirements
- Creating standard IT directories
- Installing commonly used PowerShell modules
- Configuring a basic PowerShell profile
- Producing a clear summary report

The script is intentionally safe and beginner-friendly.
No destructive actions are performed.
#>

#region Initial Setup

Write-Host "Starting First-Day IT Toolkit Setup..." -ForegroundColor Cyan

# Create a results object to store actions taken
$Results = [System.Collections.Generic.List[string]]::new()

#endregion

#region PowerShell Version Check

$RequiredVersion = 5.1
$CurrentVersion  = $PSVersionTable.PSVersion.Major + `
                   ($PSVersionTable.PSVersion.Minor / 10)

if ($CurrentVersion -lt $RequiredVersion) {
    Write-Warning "PowerShell version is lower than recommended."
    $Results.Add("PowerShell version below recommended minimum.")
} else {
    Write-Host "PowerShell version check passed." -ForegroundColor Green
    $Results.Add("PowerShell version verified.")
}

#endregion

#region Execution Policy Check (Read-Only)

$ExecutionPolicy = Get-ExecutionPolicy
Write-Host "Current Execution Policy: $ExecutionPolicy"
$Results.Add("Execution policy checked: $ExecutionPolicy")

#endregion

#region Create Standard IT Folder Structure

$BasePath = "$env:USERPROFILE\IT"

$Folders = @(
    "Scripts",
    "Logs",
    "Backups",
    "Modules",
    "Temp"
)

foreach ($Folder in $Folders) {
    $FullPath = Join-Path $BasePath $Folder

    if (-not (Test-Path $FullPath)) {
        New-Item -ItemType Directory -Path $FullPath | Out-Null
        Write-Host "Created folder: $FullPath" -ForegroundColor Green
        $Results.Add("Created folder: $FullPath")
    }
    else {
        Write-Host "Folder already exists: $FullPath"
        $Results.Add("Folder already existed: $FullPath")
    }
}

#endregion

#region Install Common PowerShell Modules

$Modules = @(
    "PSReadLine",
    "Pester"
)

foreach ($Module in $Modules) {
    if (-not (Get-Module -ListAvailable -Name $Module)) {
        try {
            Install-Module -Name $Module -Scope CurrentUser -Force -ErrorAction Stop
            Write-Host "Installed module: $Module" -ForegroundColor Green
            $Results.Add("Installed module: $Module")
        }
        catch {
            Write-Warning "Failed to install module: $Module"
            $Results.Add("Failed to install module: $Module")
        }
    }
    else {
        Write-Host "Module already installed: $Module"
        $Results.Add("Module already installed: $Module")
    }
}

#endregion

#region Configure PowerShell Profile

if (-not (Test-Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force | Out-Null
    Write-Host "Created PowerShell profile." -ForegroundColor Green
    $Results.Add("PowerShell profile created.")
}

$ProfileContent = @"
# PowerShell Profile
# Author: Kapr Idriss Conteh

Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -PredictionSource History

function Go-IT {
    Set-Location "$env:USERPROFILE\IT"
}
"@

Add-Content -Path $PROFILE -Value $ProfileContent
Write-Host "Updated PowerShell profile." -ForegroundColor Green
$Results.Add("PowerShell profile updated.")

#endregion

#region Summary Report

Write-Host "`nSetup Summary" -ForegroundColor Cyan
Write-Host "-----------------------------"

foreach ($Item in $Results) {
    Write-Host "- $Item"
}

Write-Host "`nFirst-Day IT Toolkit setup completed." -ForegroundColor Cyan
Write-Host "Maintained by Kapr Idriss Conteh (GitHub)" -ForegroundColor DarkGray

#endregion
