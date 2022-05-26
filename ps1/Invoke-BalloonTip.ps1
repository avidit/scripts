[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

function Invoke-BalloonTip() {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Message,

        [Parameter(Mandatory = $false)]
        [string]$Title = "PowerShell",

        [Parameter(Mandatory = $false)]
        [System.Windows.Forms.ToolTipIcon]$MessageType = "Info",

        [Parameter(Mandatory = $false)]
        [int]$Duration = 5000
    )

    $balloon = New-Object System.Windows.Forms.NotifyIcon
    $path = Get-Process -id $pid | Select-Object -ExpandProperty Path
    $balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
    $balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]$MessageType
    $balloon.BalloonTipText = $Message
    $balloon.BalloonTipTitle = $Title
    $balloon.Visible = $true
    $balloon.ShowBalloonTip($Duration)
}
