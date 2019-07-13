function AddVSTeamProject {
    [PoshBot.BotCommand(Aliases = ('AddTeamProject'),
                        Permissions = 'ManageProject')]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(Mandatory=$true, Position=0)]
    [Alias('Name')]
    [string]
    ${ProjectName},

    [Parameter(Position=1)]
    [string]
    ${Description},

    [switch]
    ${TFVC})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamProject', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamProject
.ForwardHelpCategory Function

#>

}  


