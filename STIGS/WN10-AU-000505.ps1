<#
.SYNOPSIS
    This PowerShell script ensures the Security event log size must be configured to 1024000 KB or greater.

.NOTES
    Author          : Giancarlo Gatti
    LinkedIn        : https://www.linkedin.com/in/giancarlo-gatti-80948b2a5
    GitHub          : github.com/gattigcg1
    Date Created    : 2024-28-05
    Last Modified   : 2024-28-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000505).ps1 
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"

# Ensure the registry key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the MaxSize DWORD value to 0x000fa000 (1024000 decimal)
New-ItemProperty -Path $regPath -Name "MaxSize" -PropertyType DWord -Value 0x000fa000 -Force
