function AddVSTeamAzureRMServiceEndpoint {
    [PoshBot.BotCommand(Aliases = ('AddTeamAzureRMServiceEndpoint'),
                        Permissions = 'ManageEndpoint')]
    [CmdletBinding(DefaultParameterSetName='Automatic')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
    [string]
    ${ProjectName},

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

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamAzureRMServiceEndpoint', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamAzureRMServiceEndpoint
.ForwardHelpCategory Function

#>

}  



