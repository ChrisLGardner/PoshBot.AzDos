function SetVSTeamEnvironmentStatus {
    [PoshBot.BotCommand(Aliases = ('SetTeamEnvironmentStatus'),
                        Permissions = 'ManageRelease')]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('Id')]
    [int[]]
    ${EnvironmentId},

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [int]
    ${ReleaseId},

    [Parameter(Mandatory=$true, Position=0)]
    [Alias('EnvironmentStatus')]
    [ValidateSet('canceled','inProgress','notStarted','partiallySucceeded','queued','rejected','scheduled','succeeded','undefined')]
    [string]
    ${Status},

    [string]
    ${Comment},

    [datetime]
    ${ScheduledDeploymentTime},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Set-VSTeamEnvironmentStatus', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Set-VSTeamEnvironmentStatus
.ForwardHelpCategory Function

#>

}  



