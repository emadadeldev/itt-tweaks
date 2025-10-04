Write-Host "[i] Renaming computer and local user..." -ForegroundColor Cyan
$currentUsername = $env:USERNAME
try {
    Rename-Computer -NewName 'Unknown' -Force -ErrorAction Stop
    Write-Host "[OK] Computer renamed to 'Unknown'" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Failed to rename computer: $_" -ForegroundColor Red
}

try {
    Rename-LocalUser -Name $currentUsername -NewName 'Unknown'
    Write-Host "[OK] User renamed from '$currentUsername' to 'Unknown'" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Failed to rename user: $_" -ForegroundColor Red
}
