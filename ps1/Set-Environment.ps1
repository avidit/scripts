function Set-Environment {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $key,

        [Parameter(Mandatory = $true)]
        [string]
        $value
    )

    [System.Environment]::SetEnvironmentVariable("$key", "$value", "User")
    Set-Item -Path Env:$key -Value $value
}
