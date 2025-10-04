Param (
    [string]$path = "HKCU:\Control Panel\Accessibility\StickyKeys"
)

Write-Host "[i] Optimizing  $path" -ForegroundColor Cyan
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Value "58"
Write-Host "[i] Restart required" -ForegroundColor Cyan
