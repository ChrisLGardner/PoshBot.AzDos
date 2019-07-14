function AddVSTeamWorkItem {
    [PoshBot.BotCommand(Aliases = ('AddTeamWorkItem'))]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, Position=0)]
    [string]
    ${Title},

    [Parameter(Position=1)]
    [string]
    ${Description},

    [Parameter(Position=2)]
    [string]
    ${IterationPath},

    [Parameter(Position=3)]
    [string]
    ${AssignedTo},

    [Parameter(Position=4)]
    [int]
    ${ParentId})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamWorkItem', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamWorkItem
.ForwardHelpCategory Function

#>

}  



