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
    Get-Module -ListAvailable | Where-Object { $_.Name -eq 'Azure' } | Format-Table -Property Name,Version
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
function Get-MyAzureVmStatus {
    param([Parameter(Mandatory=$true)][string] $ResourceGroupName)

    Get-AzureRmVm -ResourceGroupName $ResourceGroupName -Status | Format-Table -Property Name, ResourceGroupName, PowerState
}

<#
#>
function Get-MyAzureWindowsVersions {
    #Write-Host "Microsoft VM Image Publishers:"
    #Get-AzureRmVMImagePublisher -Location eastus | Where-Object { $_.PublisherName -like "*icrosoft*" }

    Write-Host "Microsoft Windows-Hub VM Image SKUs"
    Get-AzureRmVMImageSku -Location eastus -PublisherName MicrosoftWindowsServer -Offer Windows-Hub

    Write-Host "Microsoft Windows Server VM Image SKUs"
    get-azurermvmimagesku -Location eastus -PublisherName MicrosoftWindowsServer -Offer WindowsServer

    Write-Host "Microsoft Windows Client VM Image SKUs" 
    get-azurermvmimagesku -Location eastus -PublisherName MicrosoftVisualStudio -Offer Windows
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
  Login-MyAzure
#>
function Login-MyAzure {
    Login-AzureRmAccount

    $subs = Get-AzureRmSubscription
    if($subs.count -gt 1) {
        $subs | format-table -Property @{name="Index";expression={$subs.IndexOf($_)}},Name,SubscriptionId
        $x = Read-Host -Prompt "Please Input the Index of the Subscription you wish to use: "
        Set-AzureRmContext -SubscriptionId $subs[$x]  
    }
    
}

<# 
 .Synopsis
  Login to Azure for Government (GCC High)

 .Description
  Login to Azure for Government (GCC High)

 .Example
  Login-MyAzureGov

#>
function Login-MyAzureGov {
    Login-AzureRmAccount -Environment AzureUSGovernment
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
        [switch] $Wait
    )

    Write-Verbose "Wait: $($Wait)"
    if($PSCmdlet.ShouldProcess($ResourceGroupName, "Start VMs")){
        if($Wait -eq $false){
            get-azurermvm -ResourceGroupName $ResourceGroupName | ForEach-Object { Start-AzureRmVm -Name $_.Name -ResourceGroupName $_.ResourceGroupName -AsJob }
        }
        else {
            get-azurermvm -ResourceGroupName $ResourceGroupName | ForEach-Object { Start-AzureRmVm -Name $_.Name -ResourceGroupName $_.ResourceGroupName }
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
        Get-AzureRmResourceGroup | ForEach-Object {
            Write-Verbose "Stopping VMs in Resource Group $($_.ResourceGroupName)"
            Get-AzureRmVm -ResourceGroupName $_.ResourceGroupName | ForEach-Object {
                Write-Verbose "Stopping VM $($_.Name) in Resource Group $($_.ResourceGroupName)"
                if($Wait -eq $false) 
                {
                    Stop-AzureRmVM -Name $_.Name -ResourceGroupName $_.ResourceGroupName -Force -AsJob
                }
                else 
                {
                    Stop-AzureRmVM -Name $_.Name -ResourceGroupName $_.ResourceGroupName -Force
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
        [switch] $Wait
    )

    Write-Verbose "NoWait: $($Wait)"
    if($PSCmdlet.ShouldProcess($ResourceGroupName, "Stop VMs"))
    {
        if($Wait -eq $false)
        {
            get-azurermvm -ResourceGroupName $ResourceGroupName | ForEach-Object { Stop-AzureRmVm -Name $_.Name -ResourceGroupName $_.ResourceGroupName -force -AsJob }
        }
        else 
        {
            get-azurermvm -ResourceGroupName $ResourceGroupName | ForEach-Object { Stop-AzureRmVm -Name $_.Name -ResourceGroupName $_.ResourceGroupName -force }
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
    $subs = Get-AzureRmSubscription
    if($subs.count -gt 1) {
        $subs | format-table -Property @{name="Index";expression={$subs.IndexOf($_)}},Name,SubscriptionId
        $x = Read-Host -Prompt "Please Input the Index of the Subscription you wish to use: "
        Set-AzureRmContext -SubscriptionId $subs[$x]  
    }
    else {
        Write-Host "Only one Azure Subscription was found."
    }
}