<#
.SYNOPSIS
    This PowerShell script ensures that the Remote Desktop Services must be configured with the client connection encryption set to the required level.

.NOTES
    Author          : Giancarlo Gatti
    LinkedIn        : https://www.linkedin.com/in/giancarlo-gatti-80948b2a5
    GitHub          : github.com/gattigcg1
    Date Created    : 2025-29-05
    Last Modified   : 2025-29-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000290

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000290).ps1 
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"

# Ensure the registry key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the MinEncryptionLevel DWORD value to 0x3 (3 decimal)
New-ItemProperty -Path $regPath -Name "MinEncryptionLevel" -PropertyType DWord -Value 0x3 -Force
