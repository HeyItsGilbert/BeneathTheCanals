enum Period {
  Backerslight = 1
  Tabledark = 2
  Hopelight = 3
  QuietDark = 4
  Lastlight = 5
  Slumberdark = 6
}

class CanalTimeOfDay {
  [Period]$Period
  [string]$Description
  [Int16]$EncounterShift

  # Constructor
  CanalTimeOfDay() {
    $this.GetTimeOfDay()
  }

  CanalTimeOfDay([Period]$p) {
    $this.ReadTimeOfDay($p)
  }

  # Vars/Constants
  hidden [array] GetTimes() {
    return @(
      @{
        'Period'         = 'Backerslight'
        'EncounterShift' = '+0'
        'Description'    = 'First period of daylight with no visible moon, during which bakers begin their work and the canals are mostly empty as the world wakes.'
      },
      @{
        'Period'         = 'Tabledark'
        'EncounterShift' = '+1'
        'Description'    = 'First sunless period with slowly rising moon, during which Pentolans typically eat & spend time together before starting their full day.'
      },
      @{
        'Period'         = 'Hopelight'
        'EncounterShift' = '+2'
        'Description'    = 'Middle period of daylight with moon rising to its zenith, during which most folks work and Spiredwellers attend parties and functions.'
      },
      @{
        'Period'         = 'QuietDark'
        'EncounterShift' = '+4'
        'Description'    = 'Middle sunless period with moon falling from its zenith, when magic is most powerful, and the canals and the Undercity are best avoided.'
      },
      @{
        'Period'         = 'Lastlight'
        'EncounterShift' = '+2'
        'Description'    = 'Final daylight period with setting moon and waning magic, during which folks eat their supper before heading to bed or out carousing'
      },
      @{
        'Period'         = 'Slumberdark'
        'EncounterShift' = '+1'
        'Description'    = "Final sunless, moonless period, during which folks slumber, carouse til they drop, or make their living when the moon can't see them."
      };
    )
  }

  # Methods
  [void] GetTimeOfDay() {
    $times = $this.GetTimes()
    $i = Get-Random -Minimum 1 -Maximum $times.Count
    $this.Period = $times[$i].Period
    $this.EncounterShift = $times[$i].EncounterShift
    $this.Description = $times[$i].Description
  }

  [void] ReadTimeOfDay($p) {
    $time = $this.GetTimes() | Where-Object {
      $_.Period -eq $p.ToString() }
    $this.Period = $p
    $this.EncounterShift = $time.EncounterShift
    $this.Description = $time.Description
  }
}
