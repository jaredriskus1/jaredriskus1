 <#
.SYNOPSIS
    This PowerShell script ensures that the setting to allow Microsoft accounts to be optional for modern style apps is enabled.

.NOTES
    Author          : Jared Riskus
    LinkedIn        : linkedin.com/in/jared-riskus-981a33220/
    GitHub          : https://github.com/jaredriskus1
    Date Created    : 2024-09-09
    Last Modified   : 2024-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000170
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000170/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000170.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set MSAOptional to 1
New-ItemProperty -Path $registryPath `
    -Name "MSAOptional" `
    -Value 1 `
    -PropertyType DWord `
    -Force | Out-Null

Write-Output "Remediation complete: MSAOptional set to 1." 
