function GetVSTeamMember {
    [PoshBot.BotCommand(Aliases = ('GetTeamMember'))]
    [CmdletBinding()]
param(
    [Parameter(Position=0)]
    [int]
    ${Top},

    [Parameter(Position=1)]
    [int]
    ${Skip},

    [Parameter(Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id','Name')]
    [string]
    ${TeamId})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamMember', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamMember
.ForwardHelpCategory Function

#>

}  
