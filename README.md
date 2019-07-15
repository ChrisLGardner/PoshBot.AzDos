# PoshBot.AzDos
PoshBot module for working with Azure DevOps and TFS via the VSTeam module.

## Installing the Module

The module is available via the PowerShell Gallery and should be installed using

```PowerShell
Install-Module -Name PoshBot.AzDos -Repository PSGallery
```

Alternatively you can download the repository as a zip file (or clone it) and run the build.ps1 script to generate the latest version of the module.

## Using the Module

The module requires authentication with Azure DevOps which is achieved by creating a VSTeam profile and referencing it in the PoshBot configuration. To create the VSTeam Profile first run `Add-VSTeamProfile -Account <URL Here> -PersonalAccessToken <PAT Here> -Name <Friendly Name Here>` and this will create a vsteam_profiles.json file in the home directory of the current user. You will need to make sure this file is in the home directory of the user who will be running PoshBot.

By default almost all of the Get commands don't have any permissions required to run them. All of the other commands have permissions required based on which area of Azure DevOps/TFS they are interacting with.

Once you have generated the vsteam_profiles.json file you can add the friendly name of the profile to your PoshBot configuration:

```PowerShell
$pbc = New-PoshBotConfiguration
$pbc.BotAdmins = @('user@domain.tld')
$pbc.PluginConfiguration = @{
    'PoshBot.AzDos' = @{
        VSTeamProfile = '<Friendly Name Here>'
    }
}
```

This will ensure that all of the bot commands use this as their profile and connect to the correct endpoint.

Once the authentication is in place you can then have the bot run `Import-Plugin PoshBot.AzDos` to import the plugin. Permissions can then be configured as required.

## Running PoshBot in a container

In the Docker folder there is an example dockerfile, build script and PoshBot configuration file that will let you run PoshBot with PoshBot.AzDos. The plugin isn't automatically imported so that will need to be done on first run but could be incorporated into the dockerfile quite easily.
