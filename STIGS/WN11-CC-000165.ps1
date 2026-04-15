  <#
.SYNOPSIS
    This PowerShell script ensures that unauthenticated RPC clients will be restricted from connecting to the RPC server.

.NOTES
    Author          : Jared Riskus
    LinkedIn        : linkedin.com/in/jared-riskus-981a33220/
    GitHub          : https://github.com/jaredriskus1
    Date Created    : 2026-04-15
    Last Modified   : 2026-04-15
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000165
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000165/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000165.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc"

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set RestrictRemoteClients to 1
New-ItemProperty -Path $registryPath `
    -Name "RestrictRemoteClients" `
    -Value 1 `
    -PropertyType DWord `
    -Force | Out-Null

Write-Output "Remediation complete: RestrictRemoteClients set to 1."
 
