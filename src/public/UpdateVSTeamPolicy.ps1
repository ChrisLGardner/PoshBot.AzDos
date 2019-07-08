function UpdateVSTeamPolicy {
    [PoshBot.BotCommand(Aliases = ('UpdateTeamPolicy'))]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory=$true, Position=0)]
    [int]
    ${id},

    [Parameter(Position=1)]
    [guid]
    ${type},

    [switch]
    ${enabled},

    [switch]
    ${blocking},

    [Parameter(Mandatory=$true, Position=2)]
    [hashtable]
    ${settings},

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
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Update-VSTeamPolicy', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Update-VSTeamPolicy
.ForwardHelpCategory Function

#>

}  
