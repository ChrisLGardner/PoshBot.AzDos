function UpdateVSTeam {
    [PoshBot.BotCommand(Aliases = ('UpdateTeam'),
                        Permissions = 'ManageTeam')]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [Alias('TeamName','TeamId','TeamToUpdate','Id')]
    [string]
    ${Name},

    [Parameter(Position=1)]
    [string]
    ${NewTeamName},

    [Parameter(Position=2)]
    [string]
    ${Description},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Update-VSTeam', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Update-VSTeam
.ForwardHelpCategory Function

#>

}  


