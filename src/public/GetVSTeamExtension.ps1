function GetVSTeamExtension {
    [PoshBot.BotCommand(Aliases = ('GetTeamExtension'))]
    [CmdletBinding()]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='List')]
    [switch]
    ${IncludeInstallationIssues},

    [Parameter(ParameterSetName='List')]
    [switch]
    ${IncludeDisabledExtensions},

    [Parameter(ParameterSetName='List')]
    [switch]
    ${IncludeErrors},

    [Parameter(ParameterSetName='GetById', Mandatory=$true)]
    [string]
    ${PublisherId},

    [Parameter(ParameterSetName='GetById', Mandatory=$true)]
    [string]
    ${ExtensionId})

    process {
        Set-VSTeamAccount -Profile $VSTeamProfile
        $PSBoundParameters.Remove('VSTeamProfile')
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamExtension', [System.Management.Automation.CommandTypes]::Function)
        $output = & $wrappedCmd @PSBoundParameters 

        New-PoshBotCardResponse -Type Normal -Title 'Extensions' -Text ($output | Format-List * | Out-String)
    }
<#

.ForwardHelpTargetName Get-VSTeamExtension
.ForwardHelpCategory Function

#>

}  



