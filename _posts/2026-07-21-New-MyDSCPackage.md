---
external help file: my-azure-help.xml
Module Name: my-azure
online version:
schema: 2.0.0
---

# New-MyDSCPackage

## SYNOPSIS
Simple way to download and create a DSC zip file for use with Azure Resource Group Deployments

## SYNTAX

```
New-MyDSCPackage [[-DSCModulesPath] <String>] [[-DSCZipFile] <String>] [[-DSCModules] <String[]>]
 [-ForceDSCDownloads] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Download DSC Modules to the local folder and generate a zip with those modules and any custom scripts in the current directory

## EXAMPLES

### EXAMPLE 1
```
New-MyDSCPackage -DSCModulesPath .\dsc\ -DSCZipFile .\MyTestDSC.zip -DSCModules "xActiveDirectory","xTestingSomething"
```

## PARAMETERS

### -DSCModulesPath
The folder location where the DSC Modules should be downloaded to and where the custom files exist - Include trailing '\' in commandline parameter

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: .\
Accept pipeline input: False
Accept wildcard characters: False
```

### -DSCZipFile
Name of the ZIP'ed output file

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: .\MyDSCPackage.zip
Accept pipeline input: False
Accept wildcard characters: False
```

### -DSCModules
An array of DSC Modules that need to be downloaded to build the DSC Package

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: @("xActiveDirectory")
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForceDSCDownloads
Force the download of the DSC Module even if the module exists locally

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
