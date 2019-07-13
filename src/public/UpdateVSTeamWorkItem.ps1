function UpdateVSTeamWorkItem {
    [PoshBot.BotCommand(Aliases = ('UpdateTeamWorkItem'))]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true)]
    [int]
    ${Id},

    [string]
    ${Title},

    [string]
    ${Description},

    [string]
    ${IterationPath},

    [string]
    ${AssignedTo},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Update-VSTeamWorkItem', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Update-VSTeamWorkItem
.ForwardHelpCategory Function

#>

}  


