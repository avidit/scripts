function Install-Winget() {
    $file = "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle"
    $latest = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
    $browserDownloadUrl = ((Invoke-WebRequest $latest | ConvertFrom-Json).assets | Where-Object { $_.name -eq $file }).browser_download_url

    Write-Output "Dowloading latest release $browserDownloadUrl"
    Invoke-WebRequest $browserDownloadUrl -OutFile "$env:TEMP\$file"

    Import-Module Appx
    Add-AppxPackage "$env:TEMP\$file"

    Write-Output @"
winget install --id Git.Git -e
winget install --id 7zip.7zip -e
winget install --id VSCodium.VSCodium -e
winget install --id NickeManarin.ScreenToGif -e
winget install --id Microsoft.WindowsTerminal -e
"@
}
