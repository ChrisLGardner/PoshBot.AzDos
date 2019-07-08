function UpdateVSTeamVariableGroup {
    [PoshBot.BotCommand(Aliases = ('UpdateTeamVariableGroup'))]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${Id},

    [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${Name},

    [Parameter(Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${Description},

    [Parameter(Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
    [hashtable]
    ${Variables},

    [switch]
    ${Force})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Update-VSTeamVariableGroup', [System.Management.Automation.CommandTypes]::Function)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters }
        $steppablePipeline = $scriptCmd.GetSteppablePipeline()
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process
{
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end
{
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
<#

.ForwardHelpTargetName Update-VSTeamVariableGroup
.ForwardHelpCategory Function

#>

}  
