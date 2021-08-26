enum Period {
  Backerslight
  Tabledark
  Hopelight
  QuietDark
  Lastlight
  Slumberdark
}

class CanalTimeOfDay {
  [Period]$Period
  [string]$Description
  [Int16]$EncounterShift

  # Constructor
  CanalTimeOfDay() {
    $this = $this.GetTimeOfDay()
  }

  CanalTimeOfDay([Period]$p) {
    $this.ReadTimeOfDay($p)
  }

  # Vars/Constants
  hidden [hashtable] GetTimes() {
    return @{
      1 = @{
        'Period'         = 'Backerslight'
        'EncounterShift' = '+0'
        'Description'    = 'First period of daylight with no visible moon, during which bakers begin their work and the canals are mostly empty as the world wakes.'
      };
      2 = @{
        'Period'         = 'Tabledark'
        'EncounterShift' = '+1'
        'Description'    = 'First sunless period with slowly rising moon, during which Pentolans typically eat & spend time together before starting their full day.'
      };
      3 = @{
        'Period'         = 'Hopelight'
        'EncounterShift' = '+2'
        'Description'    = 'Middle period of daylight with moon rising to its zenith, during which most folks work and Spiredwellers attend parties and functions.'
      };
      4 = @{
        'Period'         = 'QuietDark'
        'EncounterShift' = '+4'
        'Description'    = 'Middle sunless period with moon falling from its zenith, when magic is most powerful, and the canals and the Undercity are best avoided.'
      };
      5 = @{
        'Period'         = 'Lastlight'
        'EncounterShift' = '+2'
        'Description'    = 'Final daylight period with setting moon and waning magic, during which folks eat their supper before heading to bed or out carousing'
      };
      6 = @{
        'Period'         = 'Slumberdark'
        'EncounterShift' = '+1'
        'Description'    = "Final sunless, moonless period, during which folks slumber, carouse til they drop, or make their living when the moon can't see them."
      };
    }
  }

  # Methods
  [CanalTimeOfDay] GetTimeOfDay() {
    $times = $this.GetTimes()
    $i = Get-Random -Minimum 1 -Maximum $times.Count
    $this.Period = $times[$i].Period
    $this.EncounterShift = $times[$i].EncounterShift
    $this.Description = $times[$i].Description

    return $this
  }

  [CanalTimeOfDay] ReadTimeOfDay($p) {
    $time = $this.GetTimes().GetEnumerator() | Where-Object {
      $_.Value.Period -eq $p} | Select-Object Value
    $this.Period = $time.Period
    $this.EncounterShift = $time.EncounterShift
    $this.Description = $time.Description

    return $this
  }
}
