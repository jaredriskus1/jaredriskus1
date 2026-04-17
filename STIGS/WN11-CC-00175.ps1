 <#
.SYNOPSIS
    This PowerShell script ensures that the Application Compatibility Program Inventory is prevented from collecting data and sending the information to Microsoft.

.NOTES
    Author          : Jared Riskus
    LinkedIn        : linkedin.com/in/jared-riskus-981a33220/
    GitHub          : https://github.com/jaredriskus1
    Date Created    : 2026-04-16
    Last Modified   : 2026-04-16
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000175
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000175/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000175.ps1 
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat"
$valueName = "DisableInventory"
$valueData = 1

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $registryPath `
    -Name $valueName `
    -Value $valueData `
    -PropertyType DWord `
    -Force | Out-Null

Write-Output "Remediation complete: $valueName set to $valueData." 
