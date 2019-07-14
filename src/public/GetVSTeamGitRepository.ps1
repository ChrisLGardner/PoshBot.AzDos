function GetVSTeamGitRepository {
    [PoshBot.BotCommand(Aliases = ('GetTeamGitRepository'))]
    [CmdletBinding(DefaultParameterSetName='ByID')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Alias('Project')]
    [string]
    ${ProjectName},

    [Parameter(ParameterSetName='ByID', ValueFromPipeline=$true)]
    [Alias('RepositoryID')]
    [guid[]]
    ${Id},

    [Parameter(ParameterSetName='ByName', ValueFromPipeline=$true)]
    [string[]]
    ${Name})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamGitRepository', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamGitRepository
.ForwardHelpCategory Function

#>

}  



