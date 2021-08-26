class CanalItem {
  [string]$ItemType
  [string]$Theme
  [string]$DecorativeMaterial
  [string]$Detail
  [string]$ItemEffect

  # Constructor
  CanalItem() {
    $this.ItemType = $this.GetItemType()
    $this.Theme = $this.GetTheme()
    $this.DecorativeMaterial = $this.GetDecorativeMaterial()
    $this.Detail = $this.GetDetail()
    $this.ItemEffect = $this.GetItemEffect()
  }

  # Methods
  [String] GetItemType() {
    return $this.ItemType = @(
      'Weapon',
      'Armor',
      'Shield',
      'Jewelry',
      'Tablet',
      'Art',
      'Tool',
      'Clothing',
      'Pottery',
      'Ritual Sacrifice',
      'Humanoid Statue',
      'Beast Statue',
      'Building Statue'
    ) | Get-Random
  }

  [String] GetTheme() {
    return $this.Theme = @(
      'War',
      'Love',
      'Prosperity',
      'Nature',
      'Fire',
      'Moon'
    ) | Get-Random
  }

  [String] GetDecorativeMaterial() {
    return $this.DecorativeMaterial = @(
      'Bronze',
      'Iron',
      'Pentolan Marble',
      'Porcelain',
      'Ironoak',
      'Mageglass'
      'Precious Metal',
      'Precious Gem'
    ) | Get-Random
  }

  [String] GetDetail() {
    return $this.Detail = @(
      'Dusty with a bloody smudge',
      'Polished smooth & soft',
      'Partially wrapped in silk',
      'Marked with a strange rune',
      'Intricate opaline scrollwork',
      'Tiny iron charms attached',
      'Always causes static shock',
      'Growing strange mold',
      'Hums softly in the dark',
      'Makes light flicker nearby',
      'Smells like cinnamon',
      'Always slightly damp'
    ) | Get-Random
  }

  [String] GetItemEffect() {
    return $this.ItemEffect = @(
      'Gravity',
      'Lust',
      'Anger',
      'Age',
      'Sight',
      'Light / Darkness',
      'Greed',
      'Fire',
      'Ice',
      'Lightning',
      'Stone',
      'Speed',
      'Mind',
      'Hearing',
      'Taste',
      'Health',
      'Beasts',
      'Size',
      'Plants',
      'Metamagic'
    ) | Get-Random
  }
}
