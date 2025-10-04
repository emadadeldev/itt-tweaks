$Services = @(
    @{ Name = "Spooler"; StartupType = "Disabled" },
    @{ Name = "Fax"; StartupType = "Disabled" },
    @{ Name = "DPS"; StartupType = "Disabled" },
    @{ Name = "MapsBroker"; StartupType = "Disabled" },
    @{ Name = "WerSvc"; StartupType = "Disabled" },
    @{ Name = "RemoteRegistry"; StartupType = "Disabled" },
    @{ Name = "lmhosts"; StartupType = "Disabled" },
    @{ Name = "SharedAccess"; StartupType = "Disabled" },
    @{ Name = "DiagTrack"; StartupType = "Disabled" }
)

foreach ($svc in $Services) {
    try {
        $service = Get-Service -Name $svc.Name -ErrorAction Stop
        Set-Service -Name $svc.Name -StartupType $svc.StartupType
        Write-Host "[i] Disabled service: $($svc.Name)" -ForegroundColor Cyan
    } catch {
        Write-Host "[!] Error modifying service '$($svc.Name)': $($_.Exception.Message)" -ForegroundColor Red
    }
}
