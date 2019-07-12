function GetVSTeamInfo {
    [PoshBot.BotCommand(Aliases = ('GetTeamInfo'))]
    
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    )

begin
{
    try {
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamInfo', [System.Management.Automation.CommandTypes]::Function)
        $PSBoundParameters.Add('$args', $args)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters }
        $steppablePipeline = $scriptCmd.GetSteppablePipeline()
        $steppablePipeline.Begin($myInvocation.ExpectingInput, $ExecutionContext)
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

.ForwardHelpTargetName Get-VSTeamInfo
.ForwardHelpCategory Function

#>

}  
