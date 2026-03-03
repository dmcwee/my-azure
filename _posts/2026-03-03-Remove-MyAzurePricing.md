---
external help file: my-azure-help.xml
Module Name: my-azure
online version:
schema: 2.0.0
---

# Remove-MyAzurePricing

## SYNOPSIS
Removing resource pricing

## SYNTAX

```
Remove-MyAzurePricing [[-SubscriptionId] <String>] [-ResourceGroupName] <String> [-ResourceName] <String>
 [[-AzureApi] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Removes the Defender for Cloud pricing applied to a specific resource.

## EXAMPLES

### EXAMPLE 1
```
Remove-MyAzurePricing -ResourceGroupName rg1 -ResourceName vm1
```

## PARAMETERS

### -SubscriptionId
{{ Fill SubscriptionId Description }}

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

### -ResourceGroupName
{{ Fill ResourceGroupName Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AzureApi
{{ Fill AzureApi Description }}

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

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
