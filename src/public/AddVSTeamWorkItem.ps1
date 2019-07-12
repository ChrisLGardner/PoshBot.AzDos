function AddVSTeamWorkItem {
    [PoshBot.BotCommand(Aliases = ('AddTeamWorkItem'))]
    [CmdletBinding()]
param(
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, Position=0)]
    [string]
    ${Title},

    [Parameter(Position=1)]
    [string]
    ${Description},

    [Parameter(Position=2)]
    [string]
    ${IterationPath},

    [Parameter(Position=3)]
    [string]
    ${AssignedTo},

    [Parameter(Position=4)]
    [int]
    ${ParentId})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamWorkItem', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamWorkItem
.ForwardHelpCategory Function

#>

}  
