function RemoveVSTeamProject {
    [PoshBot.BotCommand(Aliases = ('RemoveTeamProject'))]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Remove-VSTeamProject', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Remove-VSTeamProject
.ForwardHelpCategory Function

#>

}  


