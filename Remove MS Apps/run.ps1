$AppxPackages = @(
    "Microsoft.Copilot",
    "Microsoft.BingNews",
    "Microsoft.WindowsCamera",
    "Microsoft.Getstarted",
    "Microsoft.BingWeather_1.0.6.0_x64__8wekyb3d8bbwe",
    "MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy",
    "Microsoft.GetHelp",
    "Microsoft.AppConnector",
    "Microsoft.BingFinance",
    "Microsoft.BingTranslator",
    "Microsoft.BingSports",
    "MicrosoftCorporationII.MicrosoftFamily",
    "Microsoft.BingHealthAndFitness",
    "Microsoft.BingTravel",
    "Microsoft.MinecraftUWP",
    "PowerAutomate",
    "MicrosoftTeams",
    "Microsoft.Todos",
    "Microsoft.AsyncTextService",
    "Microsoft.GamingServices",
    "Microsoft.BingFoodAndDrink",
    "Microsoft.BingWeather",
    "Microsoft.Messaging",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.3DBuilder",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.NetworkSpeedTest",
    "Microsoft.News",
    "Microsoft.549981C3F5F10",
    "Microsoft.Office.Lens",
    "Microsoft.Office.OneNote",
    "Microsoft.Office.Sway",
    "Microsoft.OutlookForWindows",
    "Microsoft.OneConnect",
    "Microsoft.People",
    "Microsoft.Print3D",
    "Microsoft.RemoteDesktop",
    "Microsoft.SkypeApp",
    "Microsoft.StorePurchaseApp",
    "Microsoft.Office.Todo.List",
    "Microsoft.Whiteboard",
    "Microsoft.CommsPhone",
    "Microsoft.windowscommunicationsapps",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.Wallet",
    "Microsoft.WindowsMaps",
    "Microsoft.YourPhone",
    "Microsoft.WindowsSoundRecorder",
    "Microsoft.Windows.Cortana",
    "Microsoft.ScreenSketch",
    "Microsoft.Windows.DevHome",
    "Microsoft.MixedReality.Portal",
    "Microsoft.MSPaint",
    "Microsoft.Getstarted",
    "Microsoft.ZuneVideo",
    "Microsoft.ZuneMusic",
    "EclipseManager",
    "ActiproSoftwareLLC",
    "AdobeSystemsIncorporated.AdobePhotoshopExpress",
    "Duolingo-LearnLanguagesforFree",
    "PandoraMediaInc",
    "CandyCrush",
    "BubbleWitch3Saga",
    "Wunderlist",
    "Flipboard",
    "Twitter",
    "Facebook",
    "Minecraft",
    "Royal Revolt",
    "Sway",
    "Disney.37853FC22B2CE",
    "disney",
    "Microsoft.549981",
    "Microsoft.MicrosoftStickyNotes",
    "TikTok.TikTok_8wekyb3d8bbwe",
    "TikTok",
    "Microsoft.NetworkSpeedTest"
)

$RegistryChanges = @(
    @{ Path = "HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer"; Name = "NoStartMenuMorePrograms"; Type = "DWord"; Value = 2 },
    @{ Path = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer"; Name = "NoStartMenuMorePrograms"; Type = "DWord"; Value = 2 }
)

foreach ($name in $AppxPackages) {
    try {
        Write-Host "[i] Attempting to remove $name" -ForegroundColor Cyan
        Get-AppxPackage -Name $name | Remove-AppxPackage  -ErrorAction SilentlyContinue
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like "*$name*" | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
    } catch {
        Write-Host "[x] PLEASE USE (WINDOWS POWERSHELL) NOT (TERMINAL POWERSHELL 7) TO UNINSTALL"
    }
}

foreach ($Reg in $RegistryChanges) {
    Write-Host "[i] Modifying registry: $($Reg.Path) - $($Reg.Name)"
    Set-ItemProperty -Path $Reg.Path -Name $Reg.Name -Value $Reg.Value -Type $Reg.Type
}

$registryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "NoStartMenuMorePrograms" -Value 2 -Type DWord

$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}
Write-Host "[i] Optimizing $registryPath" -ForegroundColor Cyan
Set-ItemProperty -Path $registryPath -Name "NoStartMenuMorePrograms" -Value 2 -Type DWord
