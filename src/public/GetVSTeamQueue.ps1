function GetVSTeamQueue {
    [PoshBot.BotCommand(Aliases = ('GetTeamQueue'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='List')]
    [string]
    ${queueName},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('None','Manage','Use')]
    [string]
    ${actionFilter},

    [Parameter(ParameterSetName='ByID')]
    [Alias('QueueID')]
    [string]
    ${id})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamQueue', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Queues' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamQueue
.ForwardHelpCategory Function

#>

}  



