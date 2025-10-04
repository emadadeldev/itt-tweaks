Write-Host "[i] Disabling Scheduled Defrag Task" -ForegroundColor Cyan
Disable-ScheduledTask -TaskName 'Microsoft\Windows\Defrag\ScheduledDefrag' | Out-Null
