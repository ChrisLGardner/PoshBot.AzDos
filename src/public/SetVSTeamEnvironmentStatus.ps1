function SetVSTeamEnvironmentStatus {
    [PoshBot.BotCommand(Aliases = ('SetTeamEnvironmentStatus'))]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [int[]]
    ${EnvironmentId},

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]
    ${ReleaseId},

    [Parameter(Mandatory=$true, Position=0)]
    [Alias('EnvironmentStatus')]
    [ValidateSet('canceled','inProgress','notStarted','partiallySucceeded','queued','rejected','scheduled','succeeded','undefined')]
    [string]
    ${Status},

    [string]
    ${Comment},

    [datetime]
    ${ScheduledDeploymentTime},

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
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-VSTeamEnvironmentStatus', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-VSTeamEnvironmentStatus
.ForwardHelpCategory Function

#>

}  
