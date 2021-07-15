function Set-DotEnv {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $false)]
        [string]
        $envFile = ".\.env"
    )

    $content = Get-Content -Path $envFile -ErrorAction SilentlyContinue
    if ($content | Out-String | Test-Json -ErrorAction Ignore) {
        ($content | ConvertFrom-Json).PSObject.Properties | ForEach-Object {
            New-Variable -Name $_.Name -Value $_.Value -Scope Script -Force
        }
    }
    else {
        $content | ForEach-Object {
            if ($_.StartsWith("#")) { continue }
            if ($_.Trim()) {
                $kv = $_ -Split "=",2
                $key = $kv[0].Trim()
                $value = $kv[1].Trim()
                New-Variable -Name $key -Value $value -Scope Script -Force
           }
        }
    }
}
