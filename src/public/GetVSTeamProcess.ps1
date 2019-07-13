function GetVSTeamProcess {
    [PoshBot.BotCommand(Aliases = ('GetTeamProcess'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='List')]
    [int]
    ${Top},

    [Parameter(ParameterSetName='List')]
    [int]
    ${Skip},

    [Parameter(ParameterSetName='ByID')]
    [Alias('ProcessTemplateID')]
    [string]
    ${Id})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamProcess', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamProcess
.ForwardHelpCategory Function

#>

}  


