function GetVSTeamTfvcRootBranch {
    [PoshBot.BotCommand(Aliases = ('GetTeamTfvcRootBranch'))]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [switch]
    ${IncludeChildren},

    [switch]
    ${IncludeDeleted})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamTfvcRootBranch', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'TFVC Root Branches' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamTfvcRootBranch
.ForwardHelpCategory Function

#>

}  



