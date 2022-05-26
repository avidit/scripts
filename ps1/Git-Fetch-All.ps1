# run git fetch for all git repos in a directory
function Git-Fetch-All {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
    [Parameter(Mandatory = $false)]
    [String]$baseDir = ".",

    [parameter(Mandatory = $false)]
    [ValidateRange("Positive")]
    [Int32]$depth = 2
)
    Get-ChildItem -Path $baseDir -Depth $depth -Recurse -Force |
    Where-Object { $_.Mode -match "h" -and $_.FullName -like "*\.git" } |
    ForEach-Object {
        $dir = Get-Item (Join-Path $_.FullName "../")
        Write-Host "Fetching '$($dir.Name)'" -ForegroundColor Green
        Push-Location $dir
        & git fetch -p
        Pop-Location
    }
}
