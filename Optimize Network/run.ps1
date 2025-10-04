$registryPath = "HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "TcpAckFrequency" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "TCPNoDelay" -Value 1 -Type DWord
