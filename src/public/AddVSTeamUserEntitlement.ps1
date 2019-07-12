function AddVSTeamUserEntitlement {
    [PoshBot.BotCommand(Aliases = ('AddTeamUserEntitlement'))]
    [CmdletBinding()]
param(
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, Position=0)]
    [Alias('UserEmail')]
    [string]
    ${Email},

    [Parameter(Position=1)]
    [ValidateSet('Advanced','EarlyAdopter','Express','None','Professional','StakeHolder')]
    [string]
    ${License},

    [Parameter(Position=2)]
    [ValidateSet('Custom','ProjectAdministrator','ProjectContributor','ProjectReader','ProjectStakeholder')]
    [string]
    ${Group})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamUserEntitlement', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamUserEntitlement
.ForwardHelpCategory Function

#>

}  
