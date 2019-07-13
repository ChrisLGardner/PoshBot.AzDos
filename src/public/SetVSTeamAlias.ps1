function SetVSTeamAlias {
    [PoshBot.BotCommand(Aliases = ('SetTeamAlias'))]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Low')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-VSTeamAlias', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Set-VSTeamAlias
.ForwardHelpCategory Function

#>

}  


