function SetVSTeamAccount {
    [PoshBot.BotCommand(Aliases = ('SetTeamAccount'))]
    [CmdletBinding(DefaultParameterSetName='Secure', SupportsShouldProcess=$true, ConfirmImpact='Low')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='Plain', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='Secure', Mandatory=$true, Position=1)]
    [Parameter(ParameterSetName='Windows', Mandatory=$true, Position=1)]
    [string]
    ${Account},

    [Parameter(ParameterSetName='Plain', Mandatory=$true, Position=2, HelpMessage='Personal Access or Bearer Token')]
    [Alias('Token')]
    [string]
    ${PersonalAccessToken},

    [Parameter(ParameterSetName='Secure', Mandatory=$true, HelpMessage='Personal Access or Bearer Token')]
    [Alias('PAT')]
    [securestring]
    ${SecurePersonalAccessToken},

    [Parameter(ParameterSetName='Plain')]
    [Parameter(ParameterSetName='Secure')]
    [Parameter(ParameterSetName='Windows')]
    [ValidateSet('TFS2017','TFS2018','VSTS','AzD')]
    [string]
    ${Version},

    [string]
    ${Drive},

    [Parameter(ParameterSetName='Plain')]
    [Parameter(ParameterSetName='Secure')]
    [switch]
    ${UseBearerToken},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-VSTeamAccount', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Set-VSTeamAccount
.ForwardHelpCategory Function

#>

}  


