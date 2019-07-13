function GetVSTeamInfo {
    [PoshBot.BotCommand(Aliases = ('GetTeamInfo'))]
    
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile
    )

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamInfo', [System.Management.Automation.CommandTypes]::Function)
        $PSBoundParameters.Add('$args', $args)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamInfo
.ForwardHelpCategory Function

#>

}  


