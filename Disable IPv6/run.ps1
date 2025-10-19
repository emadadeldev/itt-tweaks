$registryPath = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\Tcpip6\\Parameters"
try {
  Write-Host "[i] Optimizing $path > 255" -ForegroundColor Cyan
  Set-ItemProperty -Path $registryPath -Name "DisabledComponents" -Value 255 -Type DWord
  Disable-NetAdapterBinding -Name \"*\" -ComponentID ms_tcpip6
}
catch {
    Write-Host "[!] $($_.Exception.Message)" -ForegroundColor Red
}
