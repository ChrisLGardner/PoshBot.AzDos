function AddVSTeamAccessControlEntry {
    [PoshBot.BotCommand(Aliases = ('AddTeamAccessControlEntry'))]
    [CmdletBinding(DefaultParameterSetName='ByNamespace')]
param(
    [PoshBot.FromConfig('VSTeamProfile')]
    [parameter(Mandatory)]
    [string]$VSTeamProfile,
    
    [Parameter(ParameterSetName='ByNamespace', Mandatory=$true, ValueFromPipeline=$true)]
    [string]
    ${SecurityNamespace},

    [Parameter(ParameterSetName='ByNamespaceId', Mandatory=$true)]
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

    [Parameter(ParameterSetName='ByNamespaceId', Mandatory=$true)]
    [Parameter(ParameterSetName='ByNamespace', Mandatory=$true)]
    [string]
    ${Token},

    [Parameter(ParameterSetName='ByNamespaceId', Mandatory=$true)]
    [Parameter(ParameterSetName='ByNamespace', Mandatory=$true)]
    [string]
    ${Descriptor},

    [Parameter(ParameterSetName='ByNamespaceId', Mandatory=$true)]
    [Parameter(ParameterSetName='ByNamespace', Mandatory=$true)]
    [ValidateRange(0, 2147483647)]
    [int]
    ${AllowMask},

    [Parameter(ParameterSetName='ByNamespaceId', Mandatory=$true)]
    [Parameter(ParameterSetName='ByNamespace', Mandatory=$true)]
    [ValidateRange(0, 2147483647)]
    [int]
    ${DenyMask})

begin
{
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer))
        {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Add-VSTeamAccessControlEntry', [System.Management.Automation.CommandTypes]::Function)
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

.ForwardHelpTargetName Add-VSTeamAccessControlEntry
.ForwardHelpCategory Function

#>

}  
