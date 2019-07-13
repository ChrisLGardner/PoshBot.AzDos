function RemoveVSTeamAgent {
    [PoshBot.BotCommand(Aliases = ('RemoveTeamAgent'))]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High')]
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
    ${Id},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Remove-VSTeamAgent', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Remove-VSTeamAgent
.ForwardHelpCategory Function

#>

}  


