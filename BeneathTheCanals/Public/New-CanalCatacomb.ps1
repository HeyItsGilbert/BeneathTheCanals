function New-CanalCatacomb {
  [CmdletBinding()]
  param (
    [CatacombCategory]
    $Category,
    [CatacombRoom]
    $Room
  )
  Write-Verbose "Category: $Category"
  Write-Verbose "Room: $Room"

  $catacomb = [CanalCatacomb]::new()
  if ($Category) {
    Write-Verbose "Setting specific category."
    $catacomb.SetCategory($Category)
  }
  if ($Room) {
    Write-Verbose "Setting specific room."
    $catacomb.SetRoom($Room)
  }

  return $catacomb
}
