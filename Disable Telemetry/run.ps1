Write-Host "[i] Disable telemetry..." -ForegroundColor Cyan
# -------- Registry Paths --------
$Paths = @(
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo",
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection",
    "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager",
    "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement",
    "HKCU:\SOFTWARE\Microsoft\Siuf\Rules",
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection",
    "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent",
    "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config",
    "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization",
    "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management",
    "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance",
    "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem",
    "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile",
    "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters",
    "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer",
    "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager",
    "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
    "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People"
)

foreach ($Path in $Paths) {
    New-Item -Path $Path -Force | Out-Null
}

# -------- Telemetry --------
Write-Host "[i] Disable telemetry..." -ForegroundColor Cyan
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" `
    -Name "AllowTelemetry" -Value 0 -Type DWord -Force

# -------- Activity Feed / Timeline --------
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Value 0 -Type DWord -Force
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Value 0 -Type DWord -Force
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Value 0 -Type DWord -Force

# -------- Advertising ID --------
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0 -Type DWord -Force
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Value 1 -Type DWord -Force

# -------- Suggested Content --------
$CDM = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
Set-ItemProperty $CDM "ContentDeliveryAllowed" 0 -Type DWord -Force
Set-ItemProperty $CDM "OemPreInstalledAppsEnabled" 0 -Type DWord -Force
Set-ItemProperty $CDM "PreInstalledAppsEnabled" 0 -Type DWord -Force
Set-ItemProperty $CDM "PreInstalledAppsEverEnabled" 0 -Type DWord -Force
Set-ItemProperty $CDM "SilentInstalledAppsEnabled" 0 -Type DWord -Force
Set-ItemProperty $CDM "SubscribedContent-338387Enabled" 0 -Type DWord -Force
Set-ItemProperty $CDM "SubscribedContent-338388Enabled" 0 -Type DWord -Force
Set-ItemProperty $CDM "SubscribedContent-338389Enabled" 0 -Type DWord -Force
Set-ItemProperty $CDM "SubscribedContent-353698Enabled" 0 -Type DWord -Force
Set-ItemProperty $CDM "SystemPaneSuggestionsEnabled" 0 -Type DWord -Force

# -------- User Profile Engagement --------
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" `
    -Name "ScoobeSystemSettingEnabled" -Value 0 -Type DWord -Force

# -------- Feedback / SIUF --------
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Value 0 -Type DWord -Force
Remove-ItemProperty "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "PeriodInNanoSeconds" -ErrorAction SilentlyContinue
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" `
    -Name "DoNotShowFeedbackNotifications" -Value 1 -Type DWord -Force

# -------- Tailored Experiences --------
Set-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" `
    -Name "DisableTailoredExperiencesWithDiagnosticData" -Value 1 -Type DWord -Force

# -------- Windows Error Reporting --------
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" `
    -Name "Disabled" -Value 1 -Type DWord -Force

# -------- Delivery Optimization --------
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" `
    -Name "DODownloadMode" -Value 0 -Type DWord -Force
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" `
    -Name "DODownloadMode" -Value 0 -Type DWord -Force

# -------- Explorer / UI --------
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" `
    -Name "EnthusiastMode" -Value 1 -Type DWord -Force
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
    -Name "ShowTaskViewButton" -Value 0 -Type DWord -Force
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" `
    -Name "PeopleBand" -Value 0 -Type DWord -Force
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
    -Name "LaunchTo" -Value 1 -Type DWord -Force

# -------- Performance Tweaks --------
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" `
    -Name "LongPathsEnabled" -Value 1 -Type DWord -Force
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" `
    -Name "SystemResponsiveness" -Value 0 -Type DWord -Force
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" `
    -Name "NetworkThrottlingIndex" -Value 0xffffffff -Type DWord -Force
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" `
    -Name "IRPStackSize" -Value 30 -Type DWord -Force

# -------- Remote Assistance --------
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" `
    -Name "fAllowToGetHelp" -Value 0 -Type DWord -Force

# -------- Feeds / Meet Now --------
Set-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" `
    -Name "EnableFeeds" -Value 0 -Type DWord -Force
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" `
    -Name "ShellFeedsTaskbarViewMode" -Value 2 -Type DWord -Force
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
    -Name "HideSCAMeetNow" -Value 1 -Type DWord -Force

# -------- Scheduled Tasks --------
Write-Host "[i] Disable scheduled tasks..." -ForegroundColor Cyan

$Tasks = @(
    "\Microsoft\Windows\Autochk\Proxy",
    "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator",
    "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip",
    "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector",
    "\Microsoft\Windows\Feedback\Siuf\DmClient",
    "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload",
    "\Microsoft\Windows\Windows Error Reporting\QueueReporting",
    "\Microsoft\Windows\Application Experience\MareBackup",
    "\Microsoft\Windows\Application Experience\StartupAppTask",
    "\Microsoft\Windows\Application Experience\PcaPatchDbTask"
)

foreach ($Task in $Tasks) {
    Disable-ScheduledTask -TaskPath ($Task.Substring(0,$Task.LastIndexOf("\")+1)) `
        -TaskName ($Task.Split("\")[-1]) -ErrorAction SilentlyContinue | Out-Null
}

# -------- Defender --------
Write-Host "[i] Disable Defender sample submission..." -ForegroundColor Cyan
Set-MpPreference -SubmitSamplesConsent 2

Write-Host "[✓] Done. Reboot recommended." -ForegroundColor Green
