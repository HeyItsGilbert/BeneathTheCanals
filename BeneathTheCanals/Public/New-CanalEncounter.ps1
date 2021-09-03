function New-CanalEncounter {
  [CmdletBinding()]
  param (
    [CatacombCategory]
    $CatacombCategory,
    [Period]
    $Period
  )

  $encounters = @{
    1  = @{
      'Name'        = 'Ominous Sound'
      'Description' = @(
        'Hear an alien whisper'
        'Taste blood in the air'
        'Smell sulfur'
        'Get the shivers'
        'Feel a touch on the back of the neck'
        'See a shadow shift'
        'Hear a giggle from your own belly'
        'All light sources flicker'
      )
    }
    2  = @{
      'Name'        = 'Unsavory Sneaker'
      'Description' = @(
        'See someone slip out the next exit',
        'See 1d3 folk counting treasure',
        'A drunk stumbles in',
        'Conartist approaches the party',
        '1d4+1 Bruisers approach',
        '1d3 corpsethieves butchering fresh human corpse.'
      )
    }
    3  = @{
      'Name'        = 'Mercantile'
      'Description' = @(
        'Merchant & 1d4-1 mercs returning with goods',
        'Merchant approaches party seeking a lost item',
        'Merchant & 1d3 each living/dead guards defend vs 1d4 Corpseants',
        'Stumble across rival guild merchants meeting.'
      )
    }
    4  = @{
      'Name'        = 'Corpseants'
      'Description' = @(
        '1d4+1 soldiers file in',
        'Soldier breaks through the wall',
        'Spot 1d3 soldiers feeding a honeypot',
        'A pair of soldiers spring an ambush',
        'A honeypot slain by blindserpent',
        'd3 soldiers fighting a blindserpent'
      )
    }
    5  = @{
      'Name'     = 'Adventurer(s)'
      'Quantity' = @(1..4)
      'Goal'     = @(
        'recover treasure',
        'acquire alchemical reagents',
        'capture a bonedrake',
        'destroy rogue bonegolem',
        'catch a thief',
        'find a Shard'
      )
      'Mood'     = @(
        'Friendly',
        'Frustrated',
        'Suspicious',
        'Mischievous'
      )
    }
    6  = @{
      'Name'  = 'Corpse'
      'Cause' = @(
        'Starved',
        'Partially Eaten',
        'Crushed',
        'Blasted apart'
      )
      'Item'  = @(
        'pair of copper rings',
        'half-slagged iron charm',
        'faintly glowing khopesh',
        'scorched feather',
        'shattered gem',
        'hobnailed boots'
      )
    }
    7  = @{
      'Name'        = 'Bonedrake'
      'Description' = @(
        'one erupts from the shadows, hurtling away from the party',
        '1d3 juveniles are eating the remains of a human',
        'one is stalking another adventurer in the next room',
        '2d4-1 are engaged in a territorial fight'
      )
    }
    8  = @{
      'Name'  = 'Ambling Beast'
      'Beast' = @(
        'Carbuncle',
        'Bandersnatch',
        'Catacomb Spinner',
        'Gryph',
        'Undercity Rat',
        'Blindserpent'
      )
      'Mood'  = @(
        'Surprised',
        'Scared',
        'Hungry',
        'Curious',
        'Territorial',
        'Shy',
        'Friendly',
        'Aggressive'
      )
    }
    9  = @{
      'Name'        = 'Bone Golem'
      'Description' = @(
        'a large golem is cleaning the area slowly',
        'gathering debris into itself',
        'a pair of golems are fighting off 2d3 corpseants',
        'a golem is standing motionless',
        'a golem is partially destroyed, dragging itself along the floor'
      )
    }
    10 = @{
      'Name'        = 'Spot a Shard'
      'Description' = @(
        'slinking away',
        'devouring a beast',
        'shuddering in place',
        'chewing on its own arm',
        'looking at the wall fixedly',
        'mumbling dark secrets',
        'blowing slobber bubbles',
        'painting with blood'
      )
    }
    11 = @{
      'Name'     = 'Blunder into Shard'
      'State'    = @(
        'eating a corpse',
        'wandering',
        'hunting',
        "dancing in someone's skin",
        "applying a dweomer",
        "sleeping on ceiling"
      )
      'Response' = @(
        'scream',
        'charge',
        'retreat',
        'berserk',
        'whisper',
        'stalk',
        'vomit',
        'defecate'
      )
    }
    12 = @{
      'Name'   = 'Shard Ambush'
      'Method' = @(
        'Leap from ceiling',
        'grab from crevasse',
        'appear in midst of group',
        'erupt from doorway',
        'charge head on',
        'trigger dweomer'
      )
      'Tactic' = @(
        'hit-and-run',
        'mage-eater',
        'prey on weak',
        'kill biggest threat'
      )
    }
  }

  # Get encounter die from catacomb type
  if ($null -eq $CatacombCategory) {
    $CatacombCategory = [Enum]::GetValues([CatacombCategory]) | Get-Random
  }
  $Catacomb = New-CanalCatacomb -Category $CatacombCategory

  # Roll for which encounter you get
  [int]$roll = Get-Random -Minimum 1 -Maximum $Catacomb.EncounterDie

  # Get time of Day
  if ($null -eq $Period) {
    $Period = [Enum]::GetValues([Period]) | Get-Random
  }
  $TimeOfDay = New-CanalTimeOfDay -Period $Period

  $e = $encounters[$roll + $TimeOfDay.EncounterShift]

  $encounter = [pscustomobject]@{
    Name = $e.Name;
  }
  $msplat = @{
    MemberType  = 'NoteProperty'
    InputObject = $encounter
  }
  # Roll sub dice
  $e.GetEnumerator() | ForEach-Object {
    Write-Verbose ("Looking at {0}" -f $_.Key)
    if ($_.Key -eq 'Name') { return }
    $i = Get-Random -Minimum 1 -Maximum $_.Value.Count
    # Subtract by thanks to zero index
    $rollValue = $_.Value[$i + $TimeOfDay.EncounterShift - 1]
    Write-Verbose ("Total: {0}; Shift: {1}; Rand: {2}" -f $_.Value.Count, $TimeOfDay.EncounterShift, $i)
    Add-Member @msplat -Name $_.Key -Value $rollValue
  }

  return $encounter
}
