---
external help file: BeneathTheCanals-help.xml
Module Name: BeneathTheCanals
online version:
schema: 2.0.0
---

# New-CanalEncounter

## SYNOPSIS

Creates an encounter for you to face in the catacombs.

## SYNTAX

```powershell
New-CanalEncounter [[-CatacombCategory] <CatacombCategory>] [[-Period] <Period>] [<CommonParameters>]
```

## DESCRIPTION

This will let you generate an encounter for your adventure.

## EXAMPLES

### Example 1

```powershell
PS C:\> New-CanalEncounter
```

Create a completely random encounter.

### Example 2

```powershell
PS C:\> New-CanalEncounter -Period Tabledark
```

Create an encounter you would face during the Tabledark time period.

## PARAMETERS

### -CatacombCategory

The category of catacomb you are in.

```yaml
Type: CatacombCategory
Parameter Sets: (All)
Aliases:
Accepted values: Undercity, Ancient, Opulent, Volcanic

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Period

The time period you are in the catacomb

```yaml
Type: Period
Parameter Sets: (All)
Aliases:
Accepted values: Backerslight, Tabledark, Hopelight, QuietDark, Lastlight, Slumberdark

Required: False
Position: 1
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
