if (-not $Value) { $Value = 0 }

$RegistryPaths = @(
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR",
    "HKCU:\SOFTWARE\Microsoft\GameBar"
)

try {
    foreach ($path in $RegistryPaths) {
        if (-not (Test-Path -Path $path)) {
            Write-Host "[i] '$path' does not exist. Creating it..."
            New-Item -Path $path -Force | Out-Null
        }

        Write-Host "[i] Optimizing $path (AutoGameModeEnabled = $Value)" -ForegroundColor Cyan
        Set-ItemProperty -Path $path -Name "AutoGameModeEnabled" -Value $Value -Type DWord -Force -ErrorAction Stop
    }
}
catch {
    Write-Host "[!] $($_.Exception.Message)" -ForegroundColor Red
}
