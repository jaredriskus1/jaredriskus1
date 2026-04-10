 <#
.SYNOPSIS
    This PowerShell script ensures that printing over HTTP is prevented.

.NOTES
    Author          : Jared Riskus
    LinkedIn        : linkedin.com/in/jared-riskus-981a33220/
    GitHub          : https://github.com/jaredriskus1
    Date Created    : 2026-04-09
    Last Modified   : 2026-04-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000110
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000110/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIGS/WN11-CC-000110.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set DisableHTTPPrinting to 1 (enabled / HTTP printing disabled)
New-ItemProperty -Path $registryPath `
    -Name "DisableHTTPPrinting" `
    -Value 1 `
    -PropertyType DWord `
    -Force | Out-Null

Write-Output "Remediation complete: DisableHTTPPrinting set to 1." 

