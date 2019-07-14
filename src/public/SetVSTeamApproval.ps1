function SetVSTeamApproval {
    [PoshBot.BotCommand(Aliases = ('SetTeamApproval'))]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [int[]]
    ${Id},

    [Parameter(Mandatory=$true, Position=1)]
    [ValidateSet('Approved','Rejected','Pending','ReAssigned')]
    [string]
    ${Status},

    [Parameter(Position=2)]
    [string]
    ${Approver},

    [Parameter(Position=3)]
    [string]
    ${Comment},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-VSTeamApproval', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Approvals' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Set-VSTeamApproval
.ForwardHelpCategory Function

#>

}  



