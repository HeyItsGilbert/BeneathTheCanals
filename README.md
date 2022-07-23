# BeneathTheCanals
![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/BeneathTheCanals) ![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/BeneathTheCanals) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/HeyItsGilbert/BeneathTheCanals/CI) ![PowerShell Gallery](https://img.shields.io/powershellgallery/p/BeneathTheCanals)

Generate all the horrors needed for your game! Catacombs, encounters, and items.

## Overview

This module will help you generate items on the fly for use with your games.

## Installation

Currently you'll need to build this until I hook this into PS Gallery.

## Examples

Generate a random Catacomb

```powershell
> New-CanalCatacomb

Category     : Opulent
Room         : Chamber
Feature      : Ambient colored glow
EncounterDie : 8
FeatureShift : 1

>
```

Generate a random catacomb item

```powershell
> New-CanalItem

ItemType           : Tablet
Theme              : Prosperity
DecorativeMaterial : Precious Metal
Detail             : Always slightly damp
ItemEffect         : Gravity

```

Generate random time of day

```powershell
> New-CanalTimeOfDay

   Period Description
   ------ -----------
QuietDark Middle sunless period with moon falling from its zenith, when magic...
```
