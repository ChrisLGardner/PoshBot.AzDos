function GetVSTeamAccessControlList {
    [PoshBot.BotCommand(Aliases = ('GetTeamAccessControlList'))]
    [CmdletBinding(DefaultParameterSetName='ByNamespace')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='ByNamespace', Mandatory=$true, ValueFromPipeline=$true)]
    [string]
    ${SecurityNamespace},

    [Parameter(ParameterSetName='ByNamespaceId', Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [Alias('ID')]
    [ValidateScript({ 
         try {
             [System.Guid]::Parse($_) | Out-Null
             $true
         } catch {
             $false
         }
       })]
    [string]
    ${SecurityNamespaceId},

    [Parameter(ParameterSetName='ByNamespaceId')]
    [Parameter(ParameterSetName='ByNamespace')]
    [string]
    ${Token},

    [Parameter(ParameterSetName='ByNamespaceId')]
    [Parameter(ParameterSetName='ByNamespace')]
    [string[]]
    ${Descriptors},

    [Parameter(ParameterSetName='ByNamespaceId')]
    [Parameter(ParameterSetName='ByNamespace')]
    [switch]
    ${IncludeExtendedInfo},

    [Parameter(ParameterSetName='ByNamespaceId')]
    [Parameter(ParameterSetName='ByNamespace')]
    [switch]
    ${Recurse})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Get-VSTeamAccessControlList', [System.Management.Automation.CommandTypes]::Function)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters }
        $steppablePipeline = $scriptCmd.GetSteppablePipeline()
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process
{
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end
{
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
<#

.ForwardHelpTargetName Get-VSTeamAccessControlList
.ForwardHelpCategory Function

#>

}  
