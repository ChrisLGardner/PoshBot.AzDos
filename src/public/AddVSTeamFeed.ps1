function AddVSTeamFeed {
    [PoshBot.BotCommand(Aliases = ('AddTeamFeed'))]
    [CmdletBinding()]
param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]
    ${Name},

    [Parameter(Position=1)]
    [string]
    ${Description},

    [switch]
    ${EnableUpstreamSources},

    [switch]
    ${showDeletedPackageVersions})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamFeed', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamFeed
.ForwardHelpCategory Function

#>

}  
