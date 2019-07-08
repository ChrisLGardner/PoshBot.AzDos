function AddVSTeamProfile {
    [PoshBot.BotCommand(Aliases = ('AddTeamProfile'))]
    [CmdletBinding(DefaultParameterSetName='Secure')]
param(
    [Parameter(ParameterSetName='Plain')]
    [Parameter(ParameterSetName='Secure', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='Windows', Mandatory=$true, Position=1)]
    [string]
    ${Account},

    [Parameter(ParameterSetName='Plain', Mandatory=$true, Position=2, HelpMessage='Personal Access Token')]
    [string]
    ${PersonalAccessToken},

    [Parameter(ParameterSetName='Secure', Mandatory=$true, HelpMessage='Personal Access Token')]
    [securestring]
    ${SecurePersonalAccessToken},

    [string]
    ${Name},

    [ValidateSet('TFS2017','TFS2018','VSTS')]
    [string]
    ${Version},

    [switch]
    ${UseBearerToken})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamProfile', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamProfile
.ForwardHelpCategory Function

#>

}  
