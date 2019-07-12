function AddVSTeamSonarQubeEndpoint {
    [PoshBot.BotCommand(Aliases = ('AddTeamSonarQubeEndpoint'))]
    [CmdletBinding(DefaultParameterSetName='Secure')]
param(
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${endpointName},

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${sonarqubeUrl},

    [Parameter(ParameterSetName='Plain', Mandatory=$true, Position=2, HelpMessage='Personal Access Token')]
    [string]
    ${personalAccessToken},

    [Parameter(ParameterSetName='Secure', Mandatory=$true, HelpMessage='Personal Access Token')]
    [securestring]
    ${securePersonalAccessToken})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamSonarQubeEndpoint', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamSonarQubeEndpoint
.ForwardHelpCategory Function

#>

}  
