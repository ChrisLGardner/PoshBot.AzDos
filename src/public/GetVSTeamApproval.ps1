function GetVSTeamApproval {
    [PoshBot.BotCommand(Aliases = ('GetTeamApproval'))]
    [CmdletBinding()]
param(
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Position=0)]
    [ValidateSet('Approved','ReAssigned','Rejected','Canceled','Pending','Rejected','Skipped','Undefined')]
    [string]
    ${StatusFilter},

    [Parameter(Position=1)]
    [Alias('ReleaseIdFilter')]
    [int[]]
    ${ReleaseIdsFilter},

    [Parameter(Position=2)]
    [string]
    ${AssignedToFilter})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamApproval', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamApproval
.ForwardHelpCategory Function

#>

}  
