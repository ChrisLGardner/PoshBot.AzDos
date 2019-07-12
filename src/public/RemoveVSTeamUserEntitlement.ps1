function RemoveVSTeamUserEntitlement {
    [PoshBot.BotCommand(Aliases = ('RemoveTeamUserEntitlement'))]
    [CmdletBinding(DefaultParameterSetName='ById', SupportsShouldProcess=$true, ConfirmImpact='High')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='ById', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('UserId')]
    [string]
    ${Id},

    [Parameter(ParameterSetName='ByEmail', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('UserEmail')]
    [string]
    ${Email},

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
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Remove-VSTeamUserEntitlement', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Remove-VSTeamUserEntitlement
.ForwardHelpCategory Function

#>

}  
