enum CatacombCategory {
  Undercity
  Ancient
  Opulent
  Volcanic
}
enum CatacombRoom {
  Stairs
  Passage
  Grotto
  Chamber
  Vault
  Tomb
}
class CanalCatacomb {
  [CatacombCategory]$Category
  [CatacombRoom]$Room
  [string]$Feature
  [Int16]$EncounterDie
  [Int16]$FeatureShift

  # Constructor
  CanalCatacomb() {
    $this = $this.GetCategory($null)
    $this = $this.GetRoom($null)
    $this.Feature = $this.GetFeature()
  }

  CanalCatacomb([CatacombRoom]$Room) {
    $this = $this.GetCategory($null)
    $this = $this.GetRoom($Room)
    $this.Feature = $this.GetFeature()
  }

  CanalCatacomb([CatacombCategory]$Category) {
    $this = $this.GetCategory($Category)
    $this = $this.GetRoom($null)
    $this.Feature = $this.GetFeature()
  }

  # Methods
  [CanalCatacomb] GetCategory($c) {
    $cats = @{
      'Undercity' = '4';
      'Ancient'   = '6';
      'Opulent'   = '8';
      'Volcanic'  = '12';
    }
    if ($c) {
      $cat = $cats.GetEnumerator() | Where-Object { $_.Name -eq $c }
    } else {
      $cat = $cats.GetEnumerator() | Get-Random
    }

    $this.Category = $cat.Key
    $this.EncounterDie = $cat.Value
    return $this
  }

  [CanalCatacomb] GetRoom($g) {
    $rooms = @{
      'Stairs'  = '-2';
      'Passage' = '-1';
      'Grotto'  = '+0';
      'Chamber' = '+1';
      'Vault'   = '+2';
      'Tomb'    = '+3';
    }
    if ($g) {
      $r = $rooms.GetEnumerator() | Where-Object { $_.Name -eq $g }

    } else {
      $r = $rooms.GetEnumerator() | Get-Random
    }
    $this.Room = $r.Key
    $this.FeatureShift = $r.Value
    return $this
  }

  [String] GetFeature() {
    return $this.Feature = @(
      'Water on the surfaces',
      'Thick mold & fungus',
      'Crumbling surfaces',
      'Ambient colored glow',
      'Blood Stains',
      'Hot air from crevasses',
      'Partially melted walls',
      'Corpseant tunnel',
      'Ossuary',
      'Beast den',
      'Hideout',
      'Sarcophagus'
    ) | Get-Random
  }
}
