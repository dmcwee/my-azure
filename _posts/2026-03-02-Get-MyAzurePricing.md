---
external help file: my-azure-help.xml
Module Name: my-azure
online version:
schema: 2.0.0
---

# Get-MyAzurePricing

## SYNOPSIS
Queries the Defender for Cloud API for subscription or resource pricing plans

## SYNTAX

```
Get-MyAzurePricing [[-ResourceGroupName] <String>] [[-ResourceName] <String>] [[-SubscriptionId] <String>]
 [[-AzureApiBase] <String>]
```

## DESCRIPTION
This command queries the Defender for Cloud API to determine what pricing plans are applied at the subscription or resource levels.
If
the subscription ID is not provided then this will default to the item returned by Get-AzSubscription

## EXAMPLES

### EXAMPLE 1
```
# Get the pricing plan applied at the subscription level
```

Get-MyAzurePricing

# Get the pricing plan applied to a specific resource
Get-MyAzurePricing -ResourceGroupName Demo1 -ResourceName Vm1

## PARAMETERS

### -ResourceGroupName
{{ Fill ResourceGroupName Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceName
{{ Fill ResourceName Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SubscriptionId
{{ Fill SubscriptionId Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AzureApiBase
{{ Fill AzureApiBase Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Management.azure.com
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
