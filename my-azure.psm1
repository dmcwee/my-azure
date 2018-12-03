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

 .Example
  # Start all the VMs in the Resource Group 'Demo1'
  Start-MyAzureVMs -ResourceGroupName Demo1
#>
function Start-MyAzureVMs {
    param([Parameter(Mandatory=$true)][string] $ResourceGroupName)

    get-azurermvm -ResourceGroupName $ResourceGroupName | ForEach-Object { Start-AzureRmVm -Name $_.Name -ResourceGroupName $_.ResourceGroupName }
}

<# 
 .Synopsis
  Stops all VMs in all Resource Groups in the current subscription

 .Description
  Stops all VMs in all Resource Groups in the current subscription.  
  This function retrieves all the Resource Groups in the current subscription
  and iterates through all the VMs in the Resouce Groups and stops them.

 .Example
  # Stop all VMs in the Resource Group 'Demo1'
  Stop-MyAzureAllVMs
#>
function Stop-MyAzureAllVMs {

    Get-AzureRmResourceGroup | ForEach-Object {
        Write-Verbose "Stopping VMs in Resource Group $($_.ResourceGroupName)"
        Get-AzureRMVM -ResourceGroupName $_.ResourceGroupName | ForEach-Object {
            Write-Verbose "Stopping VM $($_.Name) in Resource Group $($_.ResourceGroupName)"
            Stop-AzureRmVM -Name $_.Name -ResourceGroupName $_.ResourceGroupName -Force
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
  
 .Example
  # Stop all VMs in the Resource Group 'Demo1'
  Stop-MyAzureVMs -ResourceGroupName Demo1
#>
function Stop-MyAzureVMs {
    param([Parameter(Mandatory=$true)][string] $ResourceGroupName)

    get-azurermvm -ResourceGroupName $ResourceGroupName | ForEach-Object { Stop-AzureRmVm -Name $_.Name -ResourceGroupName $_.ResourceGroupName -force }
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