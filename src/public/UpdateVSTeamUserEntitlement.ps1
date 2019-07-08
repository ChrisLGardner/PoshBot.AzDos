function UpdateVSTeamUserEntitlement {
    [PoshBot.BotCommand(Aliases = ('UpdateTeamUserEntitlement'))]
    [CmdletBinding(DefaultParameterSetName='ByEmail', SupportsShouldProcess=$true, ConfirmImpact='High')]
param(
    [Parameter(ParameterSetName='ById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('UserId')]
    [string]
    ${Id},

    [Parameter(ParameterSetName='ByEmail', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('UserEmail')]
    [string]
    ${Email},

    [Parameter(Mandatory=$true)]
    [ValidateSet('Advanced','EarlyAdopter','Express','None','Professional','StakeHolder')]
    [string]
    ${License},

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
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Update-VSTeamUserEntitlement', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Update-VSTeamUserEntitlement
.ForwardHelpCategory Function

#>

}  
