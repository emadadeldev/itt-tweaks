Disable-MMAgent -MemoryCompression | Out-Null

$RegistrySettings = @(
    @{ Path = "HKCU:\SOFTWARE\Microsoft\GameBar"; Name = "AutoGameModeEnabled"; Type = "DWord"; Value = 0 }
    @{ Path = "HKCU:\SOFTWARE\Microsoft\GameBar"; Name = "AllowAutoGameMode"; Type = "DWord"; Value = 0 }
    @{ Path = "HKCU:\SOFTWARE\Microsoft\GameBar"; Name = "ShowStartupPanel"; Type = "DWord"; Value = 0 }
    @{ Path = "HKCU:\System\GameConfigStore"; Name = "GameDVR_Enabled"; Type = "DWord"; Value = 0 }
    @{ Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameBar"; Name = "AppCaptureEnabled"; Type = "DWord"; Value = 0 }
    @{ Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameBar"; Name = "UseNexusForGameBarEnabled"; Type = "DWord"; Value = 0 }
    @{ Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameBar"; Name = "AudioCaptureEnabled"; Type = "DWord"; Value = 0 }
    @{ Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameBar"; Name = "CursorCaptureEnabled"; Type = "DWord"; Value = 0 }
    @{ Path = "HKLM:\Software\Policies\Microsoft\Windows\GameDVR"; Name = "AllowgameDVR"; Type = "DWord"; Value = 0 }
    @{ Path = "HKLM:\System\CurrentControlSet\Services\xbgm"; Name = "Start"; Type = "DWord"; Value = 4 }
    @{ Path = "HKCU:\System\GameConfigStore"; Name = "GameDVR_FSEBehaviorMode"; Type = "DWord"; Value = 2 }
    @{ Path = "HKCU:\System\GameConfigStore"; Name = "GameDVR_HonorUserFSEBehaviorMode"; Type = "DWord"; Value = 1 }
    @{ Path = "HKCU:\System\GameConfigStore"; Name = "GameDVR_FSEBehavior"; Type = "DWord"; Value = 2 }
    @{ Path = "HKCU:\System\GameConfigStore"; Name = "GameDVR_EFSEFeatureFlags"; Type = "DWord"; Value = 0 }
    @{ Path = "HKCU:\System\GameConfigStore"; Name = "GameDVR_DSEBehavior"; Type = "DWord"; Value = 2 }
    @{ Path = "HKCU:\Software\Microsoft\DirectX\UserGpuPreferences"; Name = "DirectXUserGlobalSettings"; Type = "String"; Value = "SwapEffectUpgradeEnable=1;" }
    @{ Path = "HKCU:\Software\Microsoft\DirectX\GraphicsSettings"; Name = "SwapEffectUpgradeCache"; Type = "DWord"; Value = 1 }
    @{ Path = "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform"; Name = "InactivityShutdownDelay"; Type = "DWord"; Value = 4294967295 }
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows\Dwm"; Name = "OverlayTestMode"; Type = "DWord"; Value = 5 }
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games"; Name = "GPU Priority"; Type = "DWord"; Value = 8 }
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games"; Name = "Scheduling Category"; Type = "String"; Value = "High" }
    @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games"; Name = "SFIO Priority"; Type = "String"; Value = "High" }
    @{ Path = "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl"; Name = "IRQ8Priority"; Type = "DWord"; Value = 1 }
    @{ Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"; Name = "DisableWindowsConsumerFeatures"; Type = "DWord"; Value = 1 }
)

foreach ($item in $RegistrySettings) {
    try {
        if (-not (Test-Path $item.Path)) {
            New-Item -Path $item.Path -Force | Out-Null
            Write-Host "[i] Created path: $($item.Path)" -ForegroundColor Cyan
        }

        # Even if the name is empty, this will still write to default
        Set-ItemProperty -Path $item.Path -Name $item.Name -Value $item.Value -Type $item.Type -Force
        $target = if ($item.Name -eq "") { "(Default)" } else { $item.Name }
        Write-Host "[i] Set $target to $($item.Value) in $($item.Path)" -ForegroundColor Cyan
    } catch {
        Write-Host "[!] Error setting $($item.Name) in $($item.Path): $($_.Exception.Message)" -ForegroundColor Red
    }
}
