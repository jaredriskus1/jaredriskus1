 <#
.SYNOPSIS
    This PowerShell script ensures that downloading print driver packages over HTTP will be prevented.

.NOTES
    Author          : Jared Riskus
    LinkedIn        : linkedin.com/in/jared-riskus-981a33220/
    GitHub          : https://github.com/jaredriskus1
    Date Created    : 2026-04-13
    Last Modified   : 2026-04-13
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000100
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000100/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000100.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set DisableWebPnPDownload to 1 (prevent downloading printer drivers from the web)
New-ItemProperty -Path $registryPath `
    -Name "DisableWebPnPDownload" `
    -Value 1 `
    -PropertyType DWord `
    -Force | Out-Null

Write-Output "Remediation complete: DisableWebPnPDownload set to 1." 

