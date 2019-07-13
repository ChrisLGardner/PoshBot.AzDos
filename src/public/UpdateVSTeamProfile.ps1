function UpdateVSTeamProfile {
    [PoshBot.BotCommand(Aliases = ('UpdateTeamProfile'))]
    [CmdletBinding(DefaultParameterSetName='Secure', SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='Plain', Mandatory=$true, HelpMessage='Personal Access Token')]
    [string]
    ${PersonalAccessToken},

    [Parameter(ParameterSetName='Secure', Mandatory=$true, HelpMessage='Personal Access Token')]
    [securestring]
    ${SecurePersonalAccessToken},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Update-VSTeamProfile', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Update-VSTeamProfile
.ForwardHelpCategory Function

#>

}  


