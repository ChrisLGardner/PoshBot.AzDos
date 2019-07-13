function AddVSTeamProfile {
    [PoshBot.BotCommand(Aliases = ('AddTeamProfile'))]
    [CmdletBinding(DefaultParameterSetName='Secure')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='Plain')]
    [Parameter(ParameterSetName='Secure', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='Windows', Mandatory=$true, Position=1)]
    [string]
    ${Account},

    [Parameter(ParameterSetName='Plain', Mandatory=$true, Position=2, HelpMessage='Personal Access Token')]
    [string]
    ${PersonalAccessToken},

    [Parameter(ParameterSetName='Secure', Mandatory=$true, HelpMessage='Personal Access Token')]
    [securestring]
    ${SecurePersonalAccessToken},

    [string]
    ${Name},

    [ValidateSet('TFS2017','TFS2018','VSTS')]
    [string]
    ${Version},

    [switch]
    ${UseBearerToken})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamProfile', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamProfile
.ForwardHelpCategory Function

#>

}  


