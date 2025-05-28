# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"

# Ensure the registry key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the MaxSize DWORD value to 0x000fa000 (1024000 decimal)
New-ItemProperty -Path $regPath -Name "MaxSize" -PropertyType DWord -Value 0x000fa000 -Force
