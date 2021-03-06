function EnableVSTeamAgent {
    [PoshBot.BotCommand(Aliases = ('EnableTeamAgent'),
                        Permissions = 'ManageAgent')]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [int]
    ${PoolId},

    [Parameter(Mandatory=$true, Position=1, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('AgentID')]
    [int[]]
    ${Id})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Enable-VSTeamAgent', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Agents' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Enable-VSTeamAgent
.ForwardHelpCategory Function

#>

}  



