function UpdateVSTeamProject {
    [PoshBot.BotCommand(Aliases = ('UpdateTeamProject'),
                        Permissions = 'ManageProject')]
    [CmdletBinding(DefaultParameterSetName='ByName', SupportsShouldProcess=$true, ConfirmImpact='High')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [string]
    ${NewName},

    [string]
    ${NewDescription},

    [switch]
    ${Force},

    [Parameter(ParameterSetName='ByID', ValueFromPipelineByPropertyName=$true)]
    [string]
    ${Id})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Update-VSTeamProject', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title Projects -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Update-VSTeamProject
.ForwardHelpCategory Function

#>

}  



