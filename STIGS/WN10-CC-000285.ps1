<#
.SYNOPSIS
    This PowerShell script ensures that the Remote Desktop Session Host must require secure RPC communications. 

.NOTES
    Author          : Giancarlo Gatti
    LinkedIn        : https://www.linkedin.com/in/giancarlo-gatti-80948b2a5
    GitHub          : github.com/gattigcg1
    Date Created    : 2025-29-05
    Last Modified   : 2025-29-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000285

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000285).ps1 
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\"

# Ensure the registry key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the fEncryptRPCTraffic DWORD value to 0x1 (1 decimal)
New-ItemProperty -Path $regPath -Name "fEncryptRPCTraffic" -PropertyType DWord -Value 0x1 -Force
