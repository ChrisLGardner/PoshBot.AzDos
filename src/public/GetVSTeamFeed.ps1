function GetVSTeamFeed {
    [PoshBot.BotCommand(Aliases = ('GetTeamFeed'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='ByID', Position=0)]
    [Alias('FeedId')]
    [string[]]
    ${Id})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamFeed', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamFeed
.ForwardHelpCategory Function

#>

}  


