Write-Host "[i] Disable telemetry..." -ForegroundColor Cyan

# -------- Registry Paths --------
$Paths = @(
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo",
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager",
    "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement",
    "HKCU:\SOFTWARE\Microsoft\Siuf\Rules",
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection",
    "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent",
    "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config",
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization",
    "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
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
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" `
    -Name "DisabledByGroupPolicy" -Value 1 -Type DWord -Force

# -------- Suggested / Subscribed Content --------
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "ContentDeliveryAllowed" -Value 0 -Type DWord -Force
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "OemPreInstalledAppsEnabled" -Value 0 -Type DWord -Force
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "PreInstalledAppsEnabled" -Value 0 -Type DWord -Force
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "PreInstalledAppsEverEnabled" -Value 0 -Type DWord -Force
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "SilentInstalledAppsEnabled" -Value 0 -Type DWord -Force
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "SubscribedContent-338387Enabled" -Value 0 -Type DWord -Force
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "SubscribedContent-338388Enabled" -Value 0 -Type DWord -Force
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "SubscribedContent-338389Enabled" -Value 0 -Type DWord -Force
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "SubscribedContent-353698Enabled" -Value 0 -Type DWord -Force
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "SystemPaneSuggestionsEnabled" -Value 0 -Type DWord -Force
    
# -------- User Profile Engagement --------
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" `
    -Name "ScoobeSystemSettingEnabled" -Value 0 -Type DWord -Force

# -------- SIUF Rules (Feedback & Notifications) --------
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" `
    -Name "NumberOfSIUFInPeriod" -Value 0 -Type DWord -Force
Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "PeriodInNanoSeconds" -ErrorAction SilentlyContinue

# -------- Disable Feedback Notifications --------
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" `
    -Name "DoNotShowFeedbackNotifications" -Value 1 -Type DWord -Force

# -------- Disable Tailored Experiences --------
Set-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" `
    -Name "DisableTailoredExperiencesWithDiagnosticData" -Value 1 -Type DWord -Force

# -------- WER (Windows Error Reporting) --------
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" `
    -Name "Disabled" -Value 1 -Type DWord -Force

# -------- Delivery Optimization --------
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" `
    -Name "DODownloadMode" -Value 0 -Type DWord -Force
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" `
    -Name "DODownloadMode" -Value 0 -Type DWord -Force

# -------- Clear Page File at Shutdown (optional tweak) --------
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" `
    -Name "ClearPageFileAtShutdown" -Value 0 -Type DWord -Force
