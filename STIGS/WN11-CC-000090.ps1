 <#
.SYNOPSIS
    This PowerShell script ensures that Group Policy objects will be reprocessed even if they have not been changed.

.NOTES
    Author          : Jared Riskus
    LinkedIn        : linkedin.com/in/jared-riskus-981a33220/
    GitHub          : https://github.com/jaredriskus1
    Date Created    : 2026-04-13
    Last Modified   : 2026-04-13
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000090
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000090/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000090.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set NoGPOListChanges to 0
New-ItemProperty -Path $registryPath `
    -Name "NoGPOListChanges" `
    -Value 0 `
    -PropertyType DWord `
    -Force | Out-Null

Write-Output "Remediation complete: NoGPOListChanges set to 0." 
