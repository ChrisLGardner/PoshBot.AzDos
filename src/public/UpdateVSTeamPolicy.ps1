function UpdateVSTeamPolicy {
    [PoshBot.BotCommand(Aliases = ('UpdateTeamPolicy'))]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Medium')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, Position=0)]
    [int]
    ${id},

    [Parameter(Position=1)]
    [guid]
    ${type},

    [switch]
    ${enabled},

    [switch]
    ${blocking},

    [Parameter(Mandatory=$true, Position=2)]
    [hashtable]
    ${settings},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Update-VSTeamPolicy', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Update-VSTeamPolicy
.ForwardHelpCategory Function

#>

}  


