---
external help file: my-azure-help.xml
Module Name: my-azure
online version:
schema: 2.0.0
---

# Find-MyAzureVMImages

## SYNOPSIS
Display all the available VM SKUs in a particular region

## SYNTAX

```
Find-MyAzureVMImages [[-Location] <String>] [-PublisherFilter] <String> [<CommonParameters>]
```

## DESCRIPTION
Queries the VM Image Publishers, their associated offers and then lists the available SKUs for that location

## EXAMPLES

### EXAMPLE 1
```
# Show all the Linux SKUs for the default location (eastus)
```

Find-MyAzureVMImages -PublisherFilter "*linux*"

## PARAMETERS

### -Location
{{ Fill Location Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Eastus
Accept pipeline input: False
Accept wildcard characters: False
```

### -PublisherFilter
{{ Fill PublisherFilter Description }}

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
