function AddVSTeamNuGetEndpoint {
    [PoshBot.BotCommand(Aliases = ('AddTeamNuGetEndpoint'),
                        Permissions = 'ManageEndpoint')]
    [CmdletBinding(DefaultParameterSetName='SecureApiKey')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${EndpointName},

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string]
    ${NuGetUrl},

    [Parameter(ParameterSetName='ClearToken', Mandatory=$true, HelpMessage='Personal Access Token')]
    [string]
    ${PersonalAccessToken},

    [Parameter(ParameterSetName='ClearApiKey', Mandatory=$true, HelpMessage='ApiKey')]
    [string]
    ${ApiKey},

    [Parameter(ParameterSetName='SecurePassword', Mandatory=$true, HelpMessage='Username')]
    [string]
    ${Username},

    [Parameter(ParameterSetName='SecureToken', Mandatory=$true, HelpMessage='Personal Access Token')]
    [securestring]
    ${SecurePersonalAccessToken},

    [Parameter(ParameterSetName='SecureApiKey', Mandatory=$true, HelpMessage='ApiKey')]
    [securestring]
    ${SecureApiKey},

    [Parameter(ParameterSetName='SecurePassword', Mandatory=$true, HelpMessage='Password')]
    [securestring]
    ${SecurePassword})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamNuGetEndpoint', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamNuGetEndpoint
.ForwardHelpCategory Function

#>

}  


