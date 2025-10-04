Disable-MMAgent -MemoryCompression | Out-Null

$AppxPackages = @(
    "Microsoft.XboxApp",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay"
)
foreach ($name in $AppxPackages) {
    try {
        Write-Host "[i] Attempting to remove $name" -ForegroundColor Cyan
        Get-AppxPackage -Name $name | Remove-AppxPackage  -ErrorAction SilentlyContinue
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like "*$name*" | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
    } catch {
        Write-Host "[!] PLEASE USE (WINDOWS POWERSHELL) NOT (TERMINAL POWERSHELL 7) TO UNINSTALL"
    }
}
