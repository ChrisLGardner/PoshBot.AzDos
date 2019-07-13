function AddVSTeamServiceFabricEndpoint {
    [PoshBot.BotCommand(Aliases = ('AddTeamServiceFabricEndpoint'))]
    [CmdletBinding(DefaultParameterSetName='Certificate')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('displayName')]
    [string]
    ${endpointName},

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${url},

    [Parameter(ParameterSetName='Certificate', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${certificate},

    [Parameter(ParameterSetName='Certificate', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [securestring]
    ${certificatePassword},

    [Parameter(ParameterSetName='AzureAd', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='Certificate', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${serverCertThumbprint},

    [Parameter(ParameterSetName='AzureAd', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${username},

    [Parameter(ParameterSetName='AzureAd', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [securestring]
    ${password},

    [Parameter(ParameterSetName='None', ValueFromPipelineByPropertyName=$true)]
    [string]
    ${clusterSpn},

    [Parameter(ParameterSetName='None', ValueFromPipelineByPropertyName=$true)]
    [bool]
    ${useWindowsSecurity})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamServiceFabricEndpoint', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamServiceFabricEndpoint
.ForwardHelpCategory Function

#>

}  


