function GetVSTeamPool {
    [PoshBot.BotCommand(Aliases = ('GetTeamPool'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [Parameter(ParameterSetName='ByID', Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
    [Alias('PoolID')]
    [int]
    ${Id})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamPool', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamPool
.ForwardHelpCategory Function

#>

}  
