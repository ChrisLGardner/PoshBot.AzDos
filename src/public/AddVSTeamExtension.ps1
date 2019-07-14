function AddVSTeamExtension {
    [PoshBot.BotCommand(Aliases = ('AddTeamExtension'),
                        Permissions = 'ManageExtension')]
    [CmdletBinding()]
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

    [Parameter(Position=2)]
    [string]
    ${Version})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamExtension', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamExtension
.ForwardHelpCategory Function

#>

}  



