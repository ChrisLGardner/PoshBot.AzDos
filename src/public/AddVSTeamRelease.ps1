function AddVSTeamRelease {
    [PoshBot.BotCommand(Aliases = ('AddTeamRelease'))]
    [CmdletBinding(DefaultParameterSetName='ById', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='ById', Mandatory=$true)]
    [int]
    ${DefinitionId},

    [string]
    ${Description},

    [Parameter(ParameterSetName='ById', Mandatory=$true)]
    [string]
    ${ArtifactAlias},

    [string]
    ${Name},

    [Parameter(ParameterSetName='ById', Mandatory=$true)]
    [string]
    ${BuildId},

    [string]
    ${SourceBranch},

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
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamRelease', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamRelease
.ForwardHelpCategory Function

#>

}  
