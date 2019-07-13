function RemoveVSTeamBuildTag {
    [PoshBot.BotCommand(Aliases = ('RemoveTeamBuildTag'))]
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='Low')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Name', 'Project')]
    [string]
    ${ProjectName},

    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [string[]]
    ${Tags},

    [Parameter(Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('BuildID')]
    [int[]]
    ${Id},

    [switch]
    ${Force})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Remove-VSTeamBuildTag', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Remove-VSTeamBuildTag
.ForwardHelpCategory Function

#>

}  


