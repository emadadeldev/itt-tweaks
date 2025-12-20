Write-Host "[i] Disable telemetry" -ForegroundColor Cyan

# -------- Registry Paths --------
$Paths = @(
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo",
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
)

# Create paths if missing
foreach ($Path in $Paths) {
    New-Item -Path $Path -Force | Out-Null
}

# -------- Telemetry --------
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" `
    -Name "AllowTelemetry" -Value 0 -Type DWord -Force

# -------- Activity Feed / Timeline --------
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" `
    -Name "EnableActivityFeed" -Value 0 -Type DWord -Force

Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" `
    -Name "PublishUserActivities" -Value 0 -Type DWord -Force

Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" `
    -Name "UploadUserActivities" -Value 0 -Type DWord -Force

# -------- Advertising ID --------
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" `
    -Name "Enabled" -Value 0 -Type DWord -Force

# Policy-level (grayed out in Settings)
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" `
    -Name "DisabledByGroupPolicy" -Value 1 -Type DWord -Force

# -------- Suggested / Subscribed Content --------
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "SubscribedContent-338388Enabled" -Value 0 -Type DWord -Force

Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "SubscribedContent-338393Enabled" -Value 0 -Type DWord -Force

Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "SubscribedContent-353694Enabled" -Value 0 -Type DWord -Force

Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "SubscribedContent-353696Enabled" -Value 0 -Type DWord -Force

Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "SystemPaneSuggestionsEnabled" -Value 0 -Type DWord -Force

Set-ItemProperty "HKLM:\\SOFTWARE\\Microsoft\\Windows\\Windows Error Reporting" `
    -Name "Disabled" -Value 1 -Type DWord -Force

Set-ItemProperty "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\DeliveryOptimization\\Config" `
    -Name "DODownloadMode" -Value 0 -Type DWord -Force
    
Set-ItemProperty "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DeliveryOptimization" `
    -Name "DODownloadMode" -Value 0 -Type DWord -Force
    