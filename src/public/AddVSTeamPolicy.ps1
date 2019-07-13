function AddVSTeamPolicy {
    [PoshBot.BotCommand(Aliases = ('AddTeamPolicy'),
                        Permissions = 'ManageCodePolicy')]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, Position=0)]
    [guid]
    ${type},

    [switch]
    ${enabled},

    [switch]
    ${blocking},

    [Parameter(Mandatory=$true, Position=1)]
    [hashtable]
    ${settings})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamPolicy', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Add-VSTeamPolicy
.ForwardHelpCategory Function

#>

}  


