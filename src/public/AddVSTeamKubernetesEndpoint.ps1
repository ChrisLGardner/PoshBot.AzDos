function AddVSTeamKubernetesEndpoint {
    [PoshBot.BotCommand(Aliases = ('AddTeamKubernetesEndpoint'))]
    [CmdletBinding()]
param(
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${endpointName},

    [Parameter(Mandatory=$true, Position=1, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${kubeconfig},

    [Parameter(Mandatory=$true, Position=2, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${kubernetesUrl},

    [Parameter(Mandatory=$true, Position=3, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${clientCertificateData},

    [Parameter(Mandatory=$true, Position=4, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${clientKeyData},

    [switch]
    ${acceptUntrustedCerts},

    [switch]
    ${generatePfx})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamKubernetesEndpoint', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamKubernetesEndpoint
.ForwardHelpCategory Function

#>

}  
