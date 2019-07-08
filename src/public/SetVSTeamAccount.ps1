function SetVSTeamAccount {
    [PoshBot.BotCommand(Aliases = ('SetTeamAccount'))]
    [CmdletBinding(DefaultParameterSetName='Secure', SupportsShouldProcess=$true, ConfirmImpact='Low')]
param(
    [Parameter(ParameterSetName='Plain', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='Secure', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='Windows', Mandatory=$true, Position=1)]
    [string]
    ${Account},

    [Parameter(ParameterSetName='Plain', Mandatory=$true, Position=2, HelpMessage='Personal Access or Bearer Token')]
    [Alias('Token')]
    [string]
    ${PersonalAccessToken},

    [Parameter(ParameterSetName='Secure', Mandatory=$true, HelpMessage='Personal Access or Bearer Token')]
    [Alias('PAT')]
    [securestring]
    ${SecurePersonalAccessToken},

    [Parameter(ParameterSetName='Plain')]
    [Parameter(ParameterSetName='Secure')]
    [Parameter(ParameterSetName='Windows')]
    [ValidateSet('TFS2017','TFS2018','VSTS','AzD')]
    [string]
    ${Version},

    [string]
    ${Drive},

    [Parameter(ParameterSetName='Plain')]
    [Parameter(ParameterSetName='Secure')]
    [switch]
    ${UseBearerToken},

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
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-VSTeamAccount', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Set-VSTeamAccount
.ForwardHelpCategory Function

#>

}  
