 <#
.SYNOPSIS
    This PowerShell script ensures that users are prompted for a password once they resume for sleep(on battery).

.NOTES
    Author          : Jared Riskus
    LinkedIn        : linkedin.com/in/jared-riskus-981a33220/
    GitHub          : https://github.com/jaredriskus1
    Date Created    : 2026-04-14
    Last Modified   : 2026-04-14
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000145
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000145/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000145.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set DCSettingIndex to 1
New-ItemProperty -Path $registryPath `
    -Name "DCSettingIndex" `
    -Value 1 `
    -PropertyType DWord `
    -Force | Out-Null

Write-Output "Remediation complete: DCSettingIndex set to 1." 

