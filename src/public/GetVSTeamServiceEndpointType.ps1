function GetVSTeamServiceEndpointType {
    [PoshBot.BotCommand(Aliases = ('GetTeamServiceEndpointType'))]
    [CmdletBinding()]
param(
    [Parameter(ParameterSetName='ByType')]
    [string]
    ${Type},

    [Parameter(ParameterSetName='ByType')]
    [string]
    ${Scheme})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamServiceEndpointType', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamServiceEndpointType
.ForwardHelpCategory Function

#>

}  
