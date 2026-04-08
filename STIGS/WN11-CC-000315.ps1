 <#
.SYNOPSIS
    This PowerShell script ensures that the Windows Installer feature "Always install with elevated privileges" is disabled.

.NOTES
    Author          : Jared Riskus
    LinkedIn        : linkedin.com/in/jared-riskus-981a33220/
    GitHub          : github.com/jaredriskus1
    Date Created    : 2026-04-07
    Last Modified   : 2026-04-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000315.ps1 
#>

# Ensure the registry path exists
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"

if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set AlwaysInstallElevated to 0 (disabled)
New-ItemProperty -Path $registryPath `
    -Name "AlwaysInstallElevated" `
    -Value 0 `
    -PropertyType DWord `
    -Force | Out-Null

Write-Output "Remediation complete: AlwaysInstallElevated set to 0."
 
