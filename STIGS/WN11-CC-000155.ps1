 <#
.SYNOPSIS
    This PowerShell script ensures that solicited remote assistance is not allowed. 

.NOTES
    Author          : Jared Riskus
    LinkedIn        : linkedin.com/in/jared-riskus-981a33220/
    GitHub          : github.com/jaredriskus1
    Date Created    : 2026-04-09
    Last Modified   : 2026-04-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000155
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000155/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000155.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set fAllowToGetHelp to 0 (disable Remote Assistance)
New-ItemProperty -Path $registryPath `
    -Name "fAllowToGetHelp" `
    -Value 0 `
    -PropertyType DWord `
    -Force | Out-Null

Write-Output "Remediation complete: fAllowToGetHelp set to 0." 

