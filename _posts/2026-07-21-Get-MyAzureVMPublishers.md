---
external help file: my-azure-help.xml
Module Name: my-azure
online version:
schema: 2.0.0
---

# Get-MyAzureVMPublishers

## SYNOPSIS
Display all the available VM publishers in a particular region

## SYNTAX

```
Get-MyAzureVMPublishers [[-Location] <String>] [[-Filter] <String>]
```

## DESCRIPTION
Lists all the VM Image Publishers, based on the provided filter or no filter at all, for a specific Azure region

## EXAMPLES

### EXAMPLE 1
```
# Show all the Microsoft Publishers for the default location (eastus)
Get-MyAzureVMPublishers -Filter "*Microsoft*"
```

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

### -Filter
{{ Fill Filter Description }}

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

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
