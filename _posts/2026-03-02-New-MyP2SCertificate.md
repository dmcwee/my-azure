---
external help file: my-azure-help.xml
Module Name: my-azure
online version:
schema: 2.0.0
---

# New-MyP2SCertificate

## SYNOPSIS
Creates a local Point 2 Site certificate for use with Azure Gateway deployments

## SYNTAX

```
New-MyP2SCertificate [[-RootCertCN] <String>] [[-ChildCertCN] <String>] [[-OutputPath] <String>]
 [[-TemplateParameterFile] <String>] [[-CertificateNameParam] <String>] [[-CertificateDataParam] <String>]
 [[-CertificatePassword] <SecureString>] [-OutputRawFiles] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This creates a local Self-Signed Root and Child certificate for use with Azure Gateway deployments.
This also creates
a text file with the exported root certificate so the cert can be used across multiple deployments if desired.

Without any paramters this command will generate a root cert named P2SRootCert, a child cert P2SChildCert, and the exported
file rootcert.txt (in the local directory).

## EXAMPLES

### EXAMPLE 1
```
New-MyP2SCertificate -RootCertCN "p2scert_root" -ChildCertCN "p2scert_child" -OutputFile "folder\p2scert_root.txt"
```

## PARAMETERS

### -RootCertCN
{{ Fill RootCertCN Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: P2SRootCert
Accept pipeline input: False
Accept wildcard characters: False
```

### -ChildCertCN
{{ Fill ChildCertCN Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: P2SChildCert
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutputPath
{{ Fill OutputPath Description }}

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

### -TemplateParameterFile
{{ Fill TemplateParameterFile Description }}

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

### -CertificateNameParam
{{ Fill CertificateNameParam Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: GatewayCertName
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertificateDataParam
{{ Fill CertificateDataParam Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: GatewayCertData
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertificatePassword
{{ Fill CertificatePassword Description }}

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutputRawFiles
{{ Fill OutputRawFiles Description }}

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
