function GetVSTeamDescriptor {
    [PoshBot.BotCommand(Aliases = ('GetTeamDescriptor'))]
    [CmdletBinding(DefaultParameterSetName='ByStorageKey')]
param(
    [Parameter(ParameterSetName='ByStorageKey', Mandatory=$true)]
    [string]
    ${StorageKey})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamDescriptor', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamDescriptor
.ForwardHelpCategory Function

#>

}  
