Write-Host "[i] Setting boot menu policy to Standard" -ForegroundColor Cyan
bcdedit /set bootmenupolicy Standard | Out-Null
