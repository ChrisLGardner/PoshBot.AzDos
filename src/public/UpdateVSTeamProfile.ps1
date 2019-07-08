function UpdateVSTeamProfile {
    [PoshBot.BotCommand(Aliases = ('UpdateTeamProfile'))]
    [CmdletBinding(DefaultParameterSetName='Secure', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Plain', Mandatory=$true, HelpMessage='Personal Access Token')]
    [string]
    ${PersonalAccessToken},

    [Parameter(ParameterSetName='Secure', Mandatory=$true, HelpMessage='Personal Access Token')]
    [securestring]
    ${SecurePersonalAccessToken},

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
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Update-VSTeamProfile', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Update-VSTeamProfile
.ForwardHelpCategory Function

#>

}  
