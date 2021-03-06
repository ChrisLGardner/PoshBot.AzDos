function GetVSTeamResourceArea {
    [PoshBot.BotCommand(Aliases = ('GetTeamResourceArea'))]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile
    )

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamResourceArea', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Resource Areas' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamResourceArea
.ForwardHelpCategory Function

#>

}  



