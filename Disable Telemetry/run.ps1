# Registry Paths
$Paths = @(
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection"
)

Write-Host "[i] Disable telemetry..." -ForegroundColor Cyan

# Ensure all paths exist
foreach ($Path in $Paths) {
    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }
}

# Telemetry
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" `
    -Name "AllowTelemetry" -Value 0 -Type DWord -Force

# Activity Feed / Timeline
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed"    -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities"  -Value 0 -Type DWord -Force

# Advertising ID
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0 -Type DWord -Force

# Suggested Content
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338393Enabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353694Enabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353696Enabled" -Value 0 -Type DWord -Force
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled"    -Value 0 -Type DWord -Force