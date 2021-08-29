enum CatacombCategory {
  Undercity = 1
  Ancient = 2
  Opulent = 3
  Volcanic = 4
}
enum CatacombRoom {
  Stairs = 1
  Passage = 2
  Grotto = 3
  Chamber = 4
  Vault = 5
  Tomb = 6
}
class CanalCatacomb {
  [CatacombCategory]$Category
  [CatacombRoom]$Room
  [string]$Feature
  [Int16]$EncounterDie
  [Int16]$FeatureShift

  # Constructor
  CanalCatacomb() {
    $this.GetCategory()
    $this.GetRoom()
    $this.GetFeature()
  }

  # Methods
  [hashtable] ListCategories() {
    return @{
      'Undercity' = '4';
      'Ancient'   = '6';
      'Opulent'   = '8';
      'Volcanic'  = '12';
    }
  }

  [void] GetCategory() {
    $cats = $this.ListCategories()
    $cat = $cats.GetEnumerator() | Get-Random
    $this.Category = $cat.Key
    $this.EncounterDie = $cat.Value
  }

  [void] SetCategory([CatacombCategory]$c) {
    $cats = $this.ListCategories()
    $this.Category = $c
    $this.EncounterDie = $cats[$c.ToString()]
  }

  [hashtable] ListRooms() {
    return @{
      'Stairs'  = '-2';
      'Passage' = '-1';
      'Grotto'  = '+0';
      'Chamber' = '+1';
      'Vault'   = '+2';
      'Tomb'    = '+3';
    }
  }

  [void] GetRoom() {
    $rooms = $this.ListRooms()
    $r = $rooms.GetEnumerator() | Get-Random
    $this.Room = $r.Key
    $this.FeatureShift = $r.Value
  }

  [void] SetRoom([CatacombRoom]$cr) {
    $rooms = $this.ListRooms()
    $this.Room = $cr
    $this.FeatureShift = $rooms[$cr.ToString()]
  }

  [Void] GetFeature() {
    $this.Feature = @(
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
