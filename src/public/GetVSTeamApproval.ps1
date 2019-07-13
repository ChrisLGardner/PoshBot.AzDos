function GetVSTeamApproval {
    [PoshBot.BotCommand(Aliases = ('GetTeamApproval'))]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Position=0)]
    [ValidateSet('Approved','ReAssigned','Rejected','Canceled','Pending','Rejected','Skipped','Undefined')]
    [string]
    ${StatusFilter},

    [Parameter(Position=1)]
    [Alias('ReleaseIdFilter')]
    [int[]]
    ${ReleaseIdsFilter},

    [Parameter(Position=2)]
    [string]
    ${AssignedToFilter})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamApproval', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamApproval
.ForwardHelpCategory Function

#>

}  


