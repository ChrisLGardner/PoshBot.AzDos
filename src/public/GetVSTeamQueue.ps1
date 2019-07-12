function GetVSTeamQueue {
    [PoshBot.BotCommand(Aliases = ('GetTeamQueue'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [Alias('Name', 'Project')]
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

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamQueue', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamQueue
.ForwardHelpCategory Function

#>

}  
