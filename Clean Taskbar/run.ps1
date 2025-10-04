$Registry = @(
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds"; Name = "ShellFeedsTaskbarViewMode"; Type = "DWord"; Value = 0 },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"; Name = "SearchboxTaskbarMode"; Type = "DWord"; Value = 0 },
    @{ Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People"; Name = "PeopleBand"; Type = "DWord"; Value = 0 },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"; Name = "HideSCAMeetNow"; Type = "DWord"; Value = 1 },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"; Name = "NoNewsAndInterests"; Type = "DWord"; Value = 1 },
    @{ Path = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\NewsAndInterests\AllowNewsAndInterests"; Name = "value"; Type = "DWord"; Value = 0 },
    @{ Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds"; Name = "EnableFeeds"; Type = "DWord"; Value = 0 },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; Name = "ShowCortanaButton"; Type = "DWord"; Value = 0 },
    @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; Name = "ShowTaskViewButton"; Type = "DWord"; Value = 0 }
)

try {
    foreach ($Item in $Registry) {
        if (-not (Test-Path $Item.Path)) {
            New-Item -Path $Item.Path -Force | Out-Null
        }

        New-ItemProperty -Path $Item.Path -Name $Item.Name -PropertyType $Item.Type -Value $Item.Value -Force | Out-Null
        Write-Host "[i] Set $($Item.Name) = $($Item.Value) > $($Item.Path)" -ForegroundColor Cyan
    }

    Write-Host "[i] Restarting explorer." -ForegroundColor Cyan
    Stop-Process -processName: Explorer -Force
    Start-Sleep -Seconds 1
    if (-not (Get-Process -processName: Explorer)) {
        Start-Process explorer.exe
    }
}
catch {
    Write-Host "[!] Error: $($_.Exception.Message)" -ForegroundColor Red
}
