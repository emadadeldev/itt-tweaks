Write-Host '[i] This may take a few minutes' -ForegroundColor Cyan
Write-Host "[i] CHKDSK scan..." -ForegroundColor Cyan 
Chkdsk /scan
Write-Host "[i] System File Checker (SFC)..." -ForegroundColor Cyan   
sfc /scannow
Write-Host "[i] DISM RestoreHealth..." -ForegroundColor Cyan   
DISM /Online /Cleanup-Image /Restorehealth
Write-Host "[i] SFC again to verify repairs..." -ForegroundColor Cyan  
sfc /scannow
Add-Log -Message "[i] System health check completed" -ForegroundColor Cyan
