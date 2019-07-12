function GetVSTeamGitRepository {
    [PoshBot.BotCommand(Aliases = ('GetTeamGitRepository'))]
    [CmdletBinding(DefaultParameterSetName='ByID')]
param(
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='ByID', ValueFromPipeline=$true)]
    [Alias('RepositoryID')]
    [guid[]]
    ${Id},

    [Parameter(ParameterSetName='ByName', ValueFromPipeline=$true)]
    [string[]]
    ${Name})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamGitRepository', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamGitRepository
.ForwardHelpCategory Function

#>

}  
