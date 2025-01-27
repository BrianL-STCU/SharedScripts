---
external help file: -help.xml
Module Name:
online version: True
schema: 2.0.0
---

# Join-Keys.ps1

## SYNOPSIS
Combines dictionaries together into a single dictionary.

## SYNTAX

```
Join-Keys.ps1 [[-ReferenceObject] <IDictionary>] [-InputObject] <IDictionary> [-Accumulate] [-Force]
 [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```
Join-Keys.ps1 @{a=1;b=2} @{b=0;c=3}
```

Name                           Value
----                           -----
b                              2
c                              3
a                              1

### EXAMPLE 2
```
@{b=0;c=3},@{c=4;d=5} |Join-Keys.ps1 @{a=1;b=2} -Force |foreach {$_ |ConvertTo-Json -Compress}
```

{"c":3,"b":0,"a":1}
{"d":5,"b":2,"c":4,"a":1}

### EXAMPLE 3
```
@{b=0;c=3},@{c=4;d=5} |Join-Keys.ps1 @{a=1;b=2} -Force -Accumulate |foreach {$_ |ConvertTo-Json -Compress}
```

{"c":3,"b":0,"a":1}
{"c":4,"b":0,"d":5,"a":1}

### EXAMPLE 4
```
@{b=0;c=3},@{c=4;d=5} |Join-Keys.ps1 -Accumulate |select -Last 1
```

Name                           Value
----                           -----
c                              3
b                              0
d                              5

## PARAMETERS

### -ReferenceObject
Initial dictionary value to combine.

```yaml
Type: IDictionary
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Hashtables or other dictionaries to combine.

```yaml
Type: IDictionary
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Accumulate
Indicates that the ReferenceObject should be updated with each input dictionary,
rather than the default behavior of combining the original ReferenceObject with each.

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

### -Force
For matching keys, overwrites old values with new ones.
By default, only new keys are added.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Collections.IDictionary to combine.
## OUTPUTS

### System.Collections.IDictionary combining the inputs.
## NOTES

## RELATED LINKS
