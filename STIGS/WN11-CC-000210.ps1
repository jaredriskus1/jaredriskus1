 <#
.SYNOPSIS
    This PowerShell script ensures that the Microsoft Defender SmartScreen for Explorer is enabled.

.NOTES
    Author          : Jared Riskus
    LinkedIn        : linkedin.com/in/jared-riskus-981a33220/
    GitHub          : https://github.com/jaredriskus1
    Date Created    : 2026-04-20
    Last Modified   : 2026-04-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000210
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000210/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000210.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set EnableSmartScreen (DWORD = 1)
New-ItemProperty -Path $registryPath `
    -Name "EnableSmartScreen" `
    -Value 1 `
    -PropertyType DWord `
    -Force | Out-Null

# Set ShellSmartScreenLevel (String = "Block")
New-ItemProperty -Path $registryPath `
    -Name "ShellSmartScreenLevel" `
    -Value "Block" `
    -PropertyType String `
    -Force | Out-Null

Write-Output "Remediation complete: SmartScreen enabled and set to Block." 
