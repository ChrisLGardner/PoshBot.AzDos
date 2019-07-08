function AddVSTeamPolicy {
    [PoshBot.BotCommand(Aliases = ('AddTeamPolicy'))]
    [CmdletBinding()]
param(
    [Parameter(Mandatory=$true, Position=0)]
    [guid]
    ${type},

    [switch]
    ${enabled},

    [switch]
    ${blocking},

    [Parameter(Mandatory=$true, Position=1)]
    [hashtable]
    ${settings})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamPolicy', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamPolicy
.ForwardHelpCategory Function

#>

}  
