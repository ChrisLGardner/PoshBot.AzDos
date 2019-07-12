function GetVSTeamBuild {
    [PoshBot.BotCommand(Aliases = ('GetTeamBuild'))]
    [CmdletBinding(DefaultParameterSetName='List')]
param(
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='List')]
    [int]
    ${Top},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('succeeded','partiallySucceeded','failed','canceled')]
    [string]
    ${ResultFilter},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('manual','individualCI','batchedCI','schedule','userCreated','validateShelveset','checkInShelveset','triggered','all')]
    [string]
    ${ReasonFilter},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('inProgress','completed','cancelling','postponed','notStarted','all')]
    [string]
    ${StatusFilter},

    [Parameter(ParameterSetName='List')]
    [int[]]
    ${Queues},

    [Parameter(ParameterSetName='List')]
    [int[]]
    ${Definitions},

    [Parameter(ParameterSetName='List')]
    [string]
    ${BuildNumber},

    [Parameter(ParameterSetName='List')]
    [ValidateSet('build','xaml')]
    [string]
    ${Type},

    [Parameter(ParameterSetName='List')]
    [int]
    ${MaxBuildsPerDefinition},

    [Parameter(ParameterSetName='List')]
    [string[]]
    ${Properties},

    [Parameter(ParameterSetName='ByID', ValueFromPipeline=$true)]
    [Alias('BuildID')]
    [int[]]
    ${Id})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamBuild', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Get-VSTeamBuild
.ForwardHelpCategory Function

#>

}  
