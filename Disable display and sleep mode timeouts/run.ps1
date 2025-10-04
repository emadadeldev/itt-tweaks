Write-Host "[i] Disabling screen and standby timeout (AC/DC)" -ForegroundColor Cyan
powercfg /X monitor-timeout-ac 0
powercfg /X monitor-timeout-dc 0
powercfg /X standby-timeout-ac 0
powercfg /X standby-timeout-dc 0
