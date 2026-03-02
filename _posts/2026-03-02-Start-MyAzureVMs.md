---
external help file: my-azure-help.xml
Module Name: my-azure
online version:
schema: 2.0.0
---

# Start-MyAzureVMs

## SYNOPSIS
Starts all VMs in the provided Resource Group

## SYNTAX

```
Start-MyAzureVMs [-ResourceGroupName] <String> [[-VMNameFilter] <String>] [[-TagName] <String>]
 [[-TagValue] <String>] [-Wait] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Starts all VMs in the provided Resouce Group. 
This function retrieves the VMs in a resouce
group and then starts those VMs.

## EXAMPLES

### EXAMPLE 1
```
# Start all the VMs in the Resource Group 'Demo1'
```

Start-MyAzureVMs -ResourceGroupName Demo1

# Start all the VMs in the Resource Group 'Demo1' in parallel
Start-MyAzureVMs -ResourceGroupName Demo1 -NoWait

## PARAMETERS

### -ResourceGroupName
The name of the Azure Resource Group where the VMs are located.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -VMNameFilter
{{ Fill VMNameFilter Description }}

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

### -TagName
{{ Fill TagName Description }}

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

### -TagValue
{{ Fill TagValue Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Wait
{{ Fill Wait Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

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
