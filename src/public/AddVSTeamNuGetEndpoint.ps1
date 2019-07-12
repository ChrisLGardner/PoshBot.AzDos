function AddVSTeamNuGetEndpoint {
    [PoshBot.BotCommand(Aliases = ('AddTeamNuGetEndpoint'))]
    [CmdletBinding(DefaultParameterSetName='SecureApiKey')]
param(
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${EndpointName},

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${NuGetUrl},

    [Parameter(ParameterSetName='ClearToken', Mandatory=$true, HelpMessage='Personal Access Token')]
    [string]
    ${PersonalAccessToken},

    [Parameter(ParameterSetName='ClearApiKey', Mandatory=$true, HelpMessage='ApiKey')]
    [string]
    ${ApiKey},

    [Parameter(ParameterSetName='SecurePassword', Mandatory=$true, HelpMessage='Username')]
    [string]
    ${Username},

    [Parameter(ParameterSetName='SecureToken', Mandatory=$true, HelpMessage='Personal Access Token')]
    [securestring]
    ${SecurePersonalAccessToken},

    [Parameter(ParameterSetName='SecureApiKey', Mandatory=$true, HelpMessage='ApiKey')]
    [securestring]
    ${SecureApiKey},

    [Parameter(ParameterSetName='SecurePassword', Mandatory=$true, HelpMessage='Password')]
    [securestring]
    ${SecurePassword})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamNuGetEndpoint', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamNuGetEndpoint
.ForwardHelpCategory Function

#>

}  
