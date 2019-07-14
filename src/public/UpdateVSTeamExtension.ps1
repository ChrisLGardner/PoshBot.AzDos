function UpdateVSTeamExtension {
    [PoshBot.BotCommand(Aliases = ('UpdateTeamExtension'),
                        Permissions = 'ManageExtension')]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(Mandatory=$true, Position=0)]
    [string]
    ${PublisherId},

    [Parameter(Mandatory=$true, Position=1)]
    [string]
    ${ExtensionId},

    [Parameter(Mandatory=$true, Position=2)]
    [ValidateSet('none','disabled')]
    [string]
    ${ExtensionState},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Update-VSTeamExtension', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Update-VSTeamExtension
.ForwardHelpCategory Function

#>

}  



