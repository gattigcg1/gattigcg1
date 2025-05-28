<#
.SYNOPSIS
    This PowerShell script ensures that the password manager function in the Edge browser must be disabled.

.NOTES
    Author          : Giancarlo Gatti
    LinkedIn        : https://www.linkedin.com/in/giancarlo-gatti-80948b2a5
    GitHub          : github.com/gattigcg1
    Date Created    : 2025-28-05
    Last Modified   : 2025-28-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000245

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000245).ps1 
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main"

# Ensure the registry key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the FormSuggest Passwords value to "no" (string)
Set-ItemProperty -Path $regPath -Name "FormSuggest Passwords" -Value "no" -Type String
