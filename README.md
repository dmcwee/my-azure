# my-azure
A Powershell Module to streamline some common tasks and needs.

Capabilities
========
# Login
This module includes two login commands:
1. Login-MyAzure
2. Login-MyAzureGov

## Login-MyAzure
This command calls the Login-AzureRmAccount and then checks the account to determine if one or more subscription exists.  
If multiple subscriptions exist then the user is presented a list of subscriptions they can choose to set as their
current subscription context.

## Login-MyAzureGov
This command calls the Login-AzureRmAccount targeting the US Government Azure cloud.

# Start VMs

## Start-MyAzureVMs
This command takes a resource group and then iterates across all the VMs within that resource group and starts them.  Currently,
this command performs these tasks in series, but future versions will include a parallel capability.

# Stop VMs
This modules includes two commands to stop Azure VMs
1. Stop-MyAzureVMs
2. Stop-MyAzureAllVMs

## Stop-MyAzureVMs
This command takes a resource group name as an argument and then iterates across the VMs within that resource group and stops them.

## Stop-MyAzureAllVMs
This command iterates across all virtual machines within all resource groups in the current subscription and stops them.

# Switch Subscriptions

## Switch-MyAzureSubscription
This command queries the account's subscriptions and provides a list of available subscriptions as well as prompting the user for 
which subscription they would like to make use of.

# Other Utility Functions

## Get-MyAzureVersion
This command queries the list of available modules which include Azure in the name and then prints a table with their name and version numbers.