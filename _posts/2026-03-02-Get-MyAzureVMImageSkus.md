---
external help file: my-azure-help.xml
Module Name: my-azure
online version:
schema: 2.0.0
---

# Get-MyAzureVMImageSkus

## SYNOPSIS
Display all the available VM SKUs for a specific Publisher

## SYNTAX

```
Get-MyAzureVMImageSkus [[-Location] <String>] [[-PublisherName] <String>]
```

## DESCRIPTION
Lists the available VM SKUs for the specified publisher and all of their associated Offers in the specified location

## EXAMPLES

### EXAMPLE 1
```
# Show all the Windows Server SKUs for the default location (eastus)
```

Find-MyAzureVmImageSkus

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

### -PublisherName
{{ Fill PublisherName Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: MicrosoftWindowsServer
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
