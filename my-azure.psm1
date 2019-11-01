<#
 .Synopsis
  Get the name and version number for the Azure Module that is loaded on the local machine.

 .Description
  This command queries the list of available modules which include Azure in the name and then prints
  a table with their name and version numbers.

 .Example
  Get-MyAzureVersion
#>
function Get-MyAzureVersion {
    Get-Module -ListAvailable | Where-Object { $_.Name -eq 'Azure' -or $_.Name -like 'Az.*' } | Format-Table -Property Name,Version
}

<#
 .Synopsis
  Get the Power State of the VMs in the resource group

 .Description
  Queries the Azure VMs in the provided resource group and displays their names and current PowerState

 .Example
  # Show the power status of all the VMs in resource group 'Demo1'
  Get-MyAzureVmStatus -ResourceGroupName Demo1
#>
function Get-MyAzureVMStatus {
    param([Parameter(Mandatory=$true)][string] $ResourceGroupName)

    Get-AzVM -ResourceGroupName $ResourceGroupName -Status | Format-Table -Property Name, ResourceGroupName, PowerState
}

<#
 .Synopsis
  Display all the available VM publishers in a particular region

 .Description
  Lists all the VM Image Publishers, based on the provided filter or no filter at all, for a specific Azure region

 .Example
  # Show all the Microsoft Publishers for the default location (eastus)
  Get-MyAzureVMPublishers -Filter "*Microsoft*"
#>
function Get-MyAzureVMPublishers {
    param([string] $Location = "eastus", [string] $Filter = "")
    if([string]::IsNullOrEmpty($Filter)) {
        Get-AzVMImagePublisher -Location $Location
    }
    else {
        Get-AzVMImagePublisher -Location $Location | Where-Object { $_.PublisherName -like $Filter }
    }
}

<#
 .Synopsis
  Display all the available VM SKUs for a specific Publisher

 .Description
  Lists the available VM SKUs for the specified publisher and all of their associated Offers in the specified location

 .Example
  # Show all the Windows Server SKUs for the default location (eastus)
  Find-MyAzureVmImageSkus
#>
function Get-MyAzureVMImageSkus {
    param([string] $Location ="eastus", [string] $PublisherName = "MicrosoftWindowsServer")
    Get-AzVMImageOffer -Location $Location -PublisherName $PublisherName | ForEach-Object {
        Get-AzVMImageSku -Location $Location -PublisherName $PublisherName -Offer $_.Offer
    }
}

<#
 .Synopsis
  Display all the available VM SKUs in a particular region

 .Description
  Queries the VM Image Publishers, their associated offers and then lists the available SKUs for that location

 .Example
  # Show all the Linux SKUs for the default location (eastus)
  Find-MyAzureVMImages -PublisherFilter "*linux*"
#>
function Find-MyAzureVMImages {
    param(
        [string] $Location="eastus",
        [Parameter(Mandatory=$true)][string] $PublisherFilter
    )

    Get-AzVMImagePublisher -Location $Location | Where-Object { $_.PublisherName -like $PublisherFilter } | ForEach-Object {
        $currentPub = $_
        Get-AzVMImageOffer -Location $Location -PublisherName $currentPub.PublisherName | ForEach-Object {
            Get-AzVMImageSku -Location $Location -PublisherName $currentPub.PublisherName -Offer $_.Offer
        }
    }
}

<#
#>
function Get-MyAzureWindowsVersions {
    #Write-Host "Microsoft VM Image Publishers:"
    #Get-AzVMImagePublisher -Location eastus | Where-Object { $_.PublisherName -like "*icrosoft*" }

    Write-Host "Microsoft Windows-Hub VM Image SKUs"
    Get-AzVMImageSku -Location eastus -PublisherName MicrosoftWindowsServer -Offer Windows-Hub

    Write-Host "Microsoft Windows Server VM Image SKUs"
    get-Azvmimagesku -Location eastus -PublisherName MicrosoftWindowsServer -Offer WindowsServer

    Write-Host "Microsoft Windows Client VM Image SKUs" 
    get-Azvmimagesku -Location eastus -PublisherName MicrosoftVisualStudio -Offer Windows
}

<# 
 .Synopsis
  Login to an Azure Context

 .Description
  Login to an Azure Context.  This function performs the azure login
  and then checks if multiple subscriptions exist.  If multiple 
  subscriptions exist the user is prompted to select the desired
  subscription.

 .Example
  Connect-MyAzure
#>
function Connect-MyAzure {
    param([string] $Environment = "")

    if([string]::IsNullOrEmpty($Environment)) {
        Connect-AzAccount
    }
    else {
        Connect-AzAccount -Environment $Environment
    }

    $subs = Get-AzSubscription
    if($subs.count -gt 1) {
        $subs | format-table -Property @{name="Index";expression={$subs.IndexOf($_)}},Name,SubscriptionId
        $x = Read-Host -Prompt "Please Input the Index of the Subscription you wish to use: "
        Set-AzContext -SubscriptionId $subs[$x]  
    }
    
}

<# 
 .Synopsis
  Login to Azure for Government (GCC High)

 .Description
  Login to Azure for Government (GCC High)

 .Example
  Connect-MyAzureGov

#>
function Connect-MyAzureGov {
    Connect-MyAzure -Environment AzureUSGovernment
}

<# 
 .Synopsis
  Starts all VMs in the provided Resource Group

 .Description
  Starts all VMs in the provided Resouce Group.  This function retrieves the VMs in a resouce
  group and then starts those VMs.

 .Parameter ResourceGroupName
  The name of the Azure Resource Group where the VMs are located.

 .Parameter NoWait
  Include this parameter in the command line to start VMs as a job rather than waiting for each one to successfully start

 .Example
  # Start all the VMs in the Resource Group 'Demo1'
  Start-MyAzureVMs -ResourceGroupName Demo1

  # Start all the VMs in the Resource Group 'Demo1' in parallel
  Start-MyAzureVMs -ResourceGroupName Demo1 -NoWait
#>
function Start-MyAzureVMs {
    [cmdletbinding(SupportsShouldProcess=$True)]
    param(
        [Parameter(Mandatory=$true)][string] $ResourceGroupName,
        [string]$VMNameFilter = "",
        [switch] $Wait
    )

    Write-Verbose "Wait: $($Wait)"
    if($PSCmdlet.ShouldProcess($ResourceGroupName, "Start VMs")){
        if($Wait -eq $false){
            if([string]::IsNullOrEmpty($VMNameFilter)) {
                get-Azvm -ResourceGroupName $ResourceGroupName | ForEach-Object { Start-AzVm -Name $_.Name -ResourceGroupName $_.ResourceGroupName -AsJob }
            }
            else {
                get-Azvm -ResourceGroupName $ResourceGroupName | Where-Object { $_.Name -like $VMNameFilter } | ForEach-Object { Start-AzVm -Name $_.Name -ResourceGroupName $_.ResourceGroupName -AsJob }
            }
            
        }
        else {
            if([string]::IsNullOrEmpty($VMNameFilter)){
                get-Azvm -ResourceGroupName $ResourceGroupName | ForEach-Object { Start-AzVm -Name $_.Name -ResourceGroupName $_.ResourceGroupName }
            }
            else {
                get-Azvm -ResourceGroupName $ResourceGroupName | Where-Object { $_.Name -like $VMNameFilter } | ForEach-Object { Start-AzVm -Name $_.Name -ResourceGroupName $_.ResourceGroupName }
            }
        }
    }
}

<# 
 .Synopsis
  Stops all VMs in all Resource Groups in the current subscription

 .Description
  Stops all VMs in all Resource Groups in the current subscription.  
  This function retrieves all the Resource Groups in the current subscription
  and iterates through all the VMs in the Resouce Groups and stops them.

 .Parameter NoWait
  Include this parameter in the command line to start VMs as a job rather than waiting for each one to successfully start

 .Example
  # Stop all VMs in the Resource Group 'Demo1'
  Stop-MyAzureAllVMs

  # Stop all VMs in the Resource Group 'Demo1' in parallel
  Stop-MyAzureAllVMs -NoWait
#>
function Stop-MyAzureAllVMs {
    [cmdletbinding(SupportsShouldProcess=$True)]
    param([switch]$Wait)

    Write-Verbose "NoWait: $($Wait)"
    if($PSCmdlet.ShouldProcess("All Resource Groups", "Don't Wait: $($Wait)"))
    {
        Get-AzResourceGroup | ForEach-Object {
            Write-Verbose "Stopping VMs in Resource Group $($_.ResourceGroupName)"
            Get-AzVm -ResourceGroupName $_.ResourceGroupName | ForEach-Object {
                Write-Verbose "Stopping VM $($_.Name) in Resource Group $($_.ResourceGroupName)"
                if($Wait -eq $false) 
                {
                    Stop-AzVM -Name $_.Name -ResourceGroupName $_.ResourceGroupName -Force -AsJob
                }
                else 
                {
                    Stop-AzVM -Name $_.Name -ResourceGroupName $_.ResourceGroupName -Force
                }
                
            } 
        }
    }
}

<# 
 .Synopsis
  Stops all VMs in the provided Resource Group

 .Description
  Stops all VMs in the provided Resouce Group.  This function retrieves the VMs in a resouce
  group and then stops those VMs.

 .Parameter ResourceGroupName
  The name of the Azure Resource Group where the VMs are located.

 .Parameter NoWait
  Include this parameter in the command line to start VMs as a job rather than waiting for each one to successfully start

 .Example
  # Stop all VMs in the Resource Group 'Demo1'
  Stop-MyAzureVMs -ResourceGroupName Demo1

  # Stop all VMs in the Resource Group 'Demo1' in parallel
  Stop-MyAzureVMs -ResourceGroupName Demo1 -NoWait
#>
function Stop-MyAzureVMs {
    [cmdletbinding(SupportsShouldProcess=$True)]
    param(
        [Parameter(Mandatory=$true)][string] $ResourceGroupName,
        [string]$VMNameFilter = "",
        [switch] $Wait
    )

    Write-Verbose "NoWait: $($Wait)"
    if($PSCmdlet.ShouldProcess($ResourceGroupName, "Stop VMs"))
    {
        if($Wait -eq $false)
        {
            if([string]::IsNullOrEmpty($VMNameFilter)){
                get-Azvm -ResourceGroupName $ResourceGroupName | ForEach-Object { Stop-AzVm -Name $_.Name -ResourceGroupName $_.ResourceGroupName -force -AsJob }
            }
            else {
                get-Azvm -ResourceGroupName $ResourceGroupName | Where-Object { $_.Name -like $VMNameFilter } | ForEach-Object { Stop-AzVm -Name $_.Name -ResourceGroupName $_.ResourceGroupName -force -AsJob }
            }
        }
        else 
        {
            if([string]::IsNullOrEmpty($VMNameFilter)){
                get-Azvm -ResourceGroupName $ResourceGroupName | ForEach-Object { Stop-AzVm -Name $_.Name -ResourceGroupName $_.ResourceGroupName -force }
            }
            else {
                get-Azvm -ResourceGroupName $ResourceGroupName | Where-Object { $_.Name -like $VMNameFilter } | ForEach-Object { Stop-AzVm -Name $_.Name -ResourceGroupName $_.ResourceGroupName -force }
            }
        }
        
    }
}

<# 
 .Synopsis
  Switch current Azure Resource Manager Subscription.

 .Description
  Switch current Azure Resource Manager Subscription.  This function retrieves the available
  resource manager subscriptions and prompts the user to select the subscription they wish 
  to use.

 .Example
  Switch-MyAzureSubscription -ResourceGroupName Demo1
#>
function Switch-MyAzureSubscription {
    $subs = Get-AzSubscription
    if($subs.count -gt 1) {
        $subs | format-table -Property @{name="Index";expression={$subs.IndexOf($_)}},Name,SubscriptionId
        $x = Read-Host -Prompt "Please Input the Index of the Subscription you wish to use: "
        Set-AzContext -SubscriptionId $subs[$x]  
    }
    else {
        Write-Host "Only one Azure Subscription was found."
    }
}