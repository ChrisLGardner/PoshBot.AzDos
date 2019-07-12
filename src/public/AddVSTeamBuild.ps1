function AddVSTeamBuild {
    [PoshBot.BotCommand(Aliases = ('AddTeamBuild'))]
    [CmdletBinding(DefaultParameterSetName='ByName')]
param(
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='ByID', ValueFromPipelineByPropertyName=$true)]
    [int]
    ${BuildDefinitionId},

    [string]
    ${SourceBranch},

    [hashtable]
    ${BuildParameters})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamBuild', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamBuild
.ForwardHelpCategory Function

#>

}  
