function Install-Scoop() {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

    Write-Output @"
scoop install git 7zip
"@
}