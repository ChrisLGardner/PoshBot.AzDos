foreach ($Command in (Get-Command -Module VSTeam | Where-Object {$_.Verb -ne 'Show' -and (-not (Test-Path -Path "$PSScriptRoot\src\public\$($_.Name)"))})) {
    $ProxyCommand = [System.Management.Automation.ProxyCommand]::Create($Command)

    $NewCommand = @"
function $($Command.Name -replace '-') {
    [PoshBot.BotCommand(Aliases = ('$($Command.Noun -replace '^VS',$Command.Verb)'))]
    $ProxyCommand
}  
"@ -replace '\[VSTeam\w+\]', '[string]'

    $NewCommand | Set-Content "$Pwd\src\Public\$($Command.Name -replace '-').ps1"
}
