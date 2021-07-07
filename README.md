# my-azure
A Powershell Module to streamline some common tasks and needs.

Installation
========
*As of 11/1/2019 My-Azure has been updated to to use the Azure Az Module.  If you cannot upgrade to the Az Module you can get the latest version of My-Azure for the RM Modules by checking out the Release-AzureRm tag.*

1. [Install the Azure AZ module](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-2.8.0).
1. If you don't have one already, create a *WindowsPowerShell* folder in your *Documents* folder
1. If you don't have one already, create a *Modules* folder inside the *WindowsPowerShell* folder created in *Step 1*
1. Clone this repository to the *Modules* folder created in *Step 2*
1. Launch a Powershell window. The module will automatically load.

# Login
This module includes two login commands:
1. Login-MyAzure
2. Login-MyAzureGov

**Login-MyAzure**

This command calls the Login-AzureRmAccount and then checks the account to determine if one or more subscription exists.  
If multiple subscriptions exist then the user is presented a list of subscriptions they can choose to set as their
current subscription context.

**Login-MyAzureGov**

This command calls the Login-AzureRmAccount targeting the US Government Azure cloud.

# Start VMs

**Start-MyAzureVMs**

This command takes a resource group and then iterates across all the VMs within that resource group and starts them.  
*8/13/19: Added the ability to filter, by VM name, which machines to start.*

# Stop VMs
This modules includes two commands to stop Azure VMs
1. Stop-MyAzureVMs
2. Stop-MyAzureAllVMs

**Stop-MyAzureVMs**

This command takes a resource group name as an argument and then iterates across the VMs within that resource group and stops them.
*8/13/19: Added the ability to filter, by VM name, which machines to stop.*

**Stop-MyAzureAllVMs**

This command iterates across all virtual machines within all resource groups in the current subscription and stops them.

**Switch-MyAzureSubscription**

This command queries the account's subscriptions and provides a list of available subscriptions as well as prompting the user for which subscription they would like to make use of.

# Other Utility Functions

**Get-MyAzureVersion**

This command queries the list of available modules which include Azure in the name and then prints a table with their name and version numbers.

**Get-MyAzureVmStatus**

Queries the Azure VMs in the provided resource group and displays their names and current Status

**Get-MyAzureVMPublishers**

Displays a list of VM Publishers in the specified region (eastus is the default region), and you can also filter the list of publishers.
*Added: 8/13/19*

**Get-MyAzureVMImageSkus**
Displays a list of the VM SKUs available in the specified region(eastus is the default region) for the specified VM Publisher (MicrosoftWindowsServer is the default Image Publisher).
*Added: 8/13/19*

**Find-MyAzureVMImages**
Display a list of VM SKUs available from in the specified region(eastus is the default region) for any VM Publisher who matches the provided filter.

**New-MyAzureDeployment**
Create or use an Azure Resource Group and begin a new Azure ARM Template Deployment
*Added: 7/7/21*

**New-MyDSCPackage**
Simple way to create a new DSC Package that includes 3rd party DSC modules like xActiveDirectory
*Added: 7/7/21*