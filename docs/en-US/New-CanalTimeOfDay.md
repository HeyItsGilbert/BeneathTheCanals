---
external help file: BeneathTheCanals-help.xml
Module Name: BeneathTheCanals
online version:
schema: 2.0.0
---

# New-CanalTimeOfDay

## SYNOPSIS
Create a Canal Time of Day. This affects your encounters.

## SYNTAX

```
New-CanalTimeOfDay [[-Period] <Period>] [<CommonParameters>]
```

## DESCRIPTION
Create a Canal Time of Day. This affects your encounters.

## EXAMPLES

### Example 1
```powershell
> New-CanalTimeOfDay
```

Get a random time of day.

### Example 2
```powershell
> New-CanalTimeOfDay -Period Tabledark
```

Get a specific time of day.

## PARAMETERS

### -Period
If you already have a time period in mind, you can pass an explicit time period.

```yaml
Type: Period
Parameter Sets: (All)
Aliases:
Accepted values: Backerslight, Tabledark, Hopelight, QuietDark, Lastlight, Slumberdark

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
