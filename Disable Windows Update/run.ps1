Add-Log -Message "A system restart is required for all changes to take effect." -Level "Info"

Add-Log -Message "Applying Windows Update policies..." -Level "Info"

# Windows Update Policies
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | Out-Null

Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Type DWord -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUOptions" -Type DWord -Value 1

# Delivery Optimization
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Force | Out-Null

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name "DODownloadMode" -Type DWord -Value 0

# Hide Windows Update Page
Add-Log -Message "Hiding Windows Update settings page..." -Level "Info"

Set-ItemProperty `
    -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
    -Name "SettingsPageVisibility" `
    -Value "hide:windowsupdate"

# Disable Services
$Services = @(
    "BITS",
    "wuauserv",
    "UsoSvc"
)

foreach ($Service in $Services) {

    Add-Log -Message "Disabling service: $Service" -Level "Info"

    Stop-Service -Name $Service -Force -ErrorAction SilentlyContinue
    Set-Service -Name $Service -StartupType Disabled
}

# Clear SoftwareDistribution
Add-Log -Message "Clearing SoftwareDistribution cache..." -Level "Info"

Remove-Item "C:\Windows\SoftwareDistribution\*" -Recurse -Force -ErrorAction SilentlyContinue

# Disable Scheduled Tasks
Add-Log -Message "Disabling update-related scheduled tasks..." -Level "Info"

$Tasks = @(
    "\Microsoft\Windows\InstallService\*",
    "\Microsoft\Windows\UpdateOrchestrator\*",
    "\Microsoft\Windows\UpdateAssistant\*",
    "\Microsoft\Windows\WaaSMedic\*",
    "\Microsoft\Windows\WindowsUpdate\*",
    "\Microsoft\WindowsUpdate\*"
)

foreach ($Task in $Tasks) {

    Get-ScheduledTask -TaskPath $Task -ErrorAction SilentlyContinue |
        Disable-ScheduledTask -ErrorAction SilentlyContinue
}

Add-Log -Message "Windows Update has been disabled successfully." -Level "Info"