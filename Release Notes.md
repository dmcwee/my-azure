# My-Azure Changes

## 29 August 2023
**Tag:** Release-Az-1.2.1

**Branches:** Master

**Notes:** Added install.ps1 to install & sign the module. Added `New-MyP2SCertificate` to support creating certificates for use with Azure Point-To-Site Gateways

## 7 July 2021
**Tag:** Release-Az-1.1

**Branches:** Master

**Notes:** Added New-MyAzureDeployment and New-MyDSCPackage to allow for easier deployment of Azure Resource Group templates with custom DSC files

## 1 November 2019
**Tag:** Release-Az

**Branches:** Master, Az

**Notes:** Updates made to the My-Azure module to migrate it from the Azure RM powershell modules to the Azure AZ powershell modules.

## 15 October 2019
**Tag:** Release-AzureRm

**Branches:** Master

**Notes:** Applied the Release-AzureRm tag to the repository.  This is intended to be the last change for My-Azure supporting the Azure RM modules.  The module will be converted to using the Azure AZ powershell module and commands.

## 13 August 2019
**Tag:**

**Branches:** Master

**Notes:** Added filtering capabilities to Start-MyAzureVMs, Stop-MyAzureVMs.  Added Get-MyAzureVMPublishers and Get-MyAzureVMImageSkus commands to the module.