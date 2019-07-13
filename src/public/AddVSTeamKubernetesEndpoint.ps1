function AddVSTeamKubernetesEndpoint {
    [PoshBot.BotCommand(Aliases = ('AddTeamKubernetesEndpoint'))]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
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

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamKubernetesEndpoint', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamKubernetesEndpoint
.ForwardHelpCategory Function

#>

}  


