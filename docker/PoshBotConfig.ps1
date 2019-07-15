$pbc = New-PoshBotConfiguration
$pbc.BotAdmins = @('User@Domain.Tld')
$pbc.PluginConfiguration = @{
    'PoshBot.AzDos' = @{
        VSTeamProfile = 'Default'
    }
}

$backendConfig = @{
    BackEndConfig = 'Goes Here'
}
$backend = New-PoshBotTeamsBackend -Configuration $backendConfig

$bot = New-PoshBotInstance -Configuration $pbc -Backend $backend
$bot | Start-PoshBot -Verbose
