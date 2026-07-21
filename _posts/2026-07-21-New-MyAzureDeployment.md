---
external help file: my-azure-help.xml
Module Name: my-azure
online version:
schema: 2.0.0
---

# New-MyAzureDeployment

## SYNOPSIS
Simple Resource Group Deployment Script

## SYNTAX

```
New-MyAzureDeployment [-ResourceGroupName] <String> [-ResourceGroupLocation] <String> [-TemplateFile] <String>
 [-Password] <SecureString> [[-TemplateParametersFile] <String>] [[-OutputFilesPath] <String>] [-NewP2SCert]
 [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Checks if a resource group exists or creates a new resource group and begins a resource group deployment

## EXAMPLES

### EXAMPLE 1
```
New-MyAzureDeployment -ResourceGroupName Demo1 -Location eastus -TemplateFile azuredeploy.json -TemplateParametersFile azuredeploy.parameters.json
```

## PARAMETERS

### -ResourceGroupName
Name of the existing resource group, or name of the resource group to create

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

### -ResourceGroupLocation
Location of the resource group - only used when creating a new resource group

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

### -TemplateFile
The Azure Resource Group Deployment JSON file

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

### -Password
{{ Fill Password Description }}

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TemplateParametersFile
The Azure Resource Group Deployment JSON file's optional template parameters file

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutputFilesPath
{{ Fill OutputFilesPath Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: .\
Accept pipeline input: False
Accept wildcard characters: False
```

### -NewP2SCert
{{ Fill NewP2SCert Description }}

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
