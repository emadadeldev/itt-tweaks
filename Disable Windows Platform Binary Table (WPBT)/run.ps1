$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager"

if (Test-Path $registryPath) {
    Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
    try {
        Remove-ItemProperty -Path $registryPath -Name "DisableWpbtExecution" -ErrorAction Stop
        Write-Host "[+] Removed DisableWpbtExecution successfully." -ForegroundColor Green
    } catch {
        Write-Host "[!] Failed to remove property: $($_.Exception.Message)" -ForegroundColor Red
    }
} else {
    Write-Host "[!] Registry path not found: $registryPath" -ForegroundColor Red
}
