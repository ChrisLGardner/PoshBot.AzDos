function AddVSTeamAzureRMServiceEndpoint {
    [PoshBot.BotCommand(Aliases = ('AddTeamAzureRMServiceEndpoint'))]
    [CmdletBinding(DefaultParameterSetName='Automatic')]
param(
    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('displayName')]
    [string]
    ${subscriptionName},

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${subscriptionId},

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${subscriptionTenantId},

    [Parameter(ParameterSetName='Manual', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${servicePrincipalId},

    [Parameter(ParameterSetName='Manual', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${servicePrincipalKey},

    [string]
    ${endpointName})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamAzureRMServiceEndpoint', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamAzureRMServiceEndpoint
.ForwardHelpCategory Function

#>

}  
