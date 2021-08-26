function New-CanalTimeOfDay {
  [CmdletBinding()]
  param (
    [Period]$Period
  )

  if ($Period) {
    [CanalTimeOfDay]::new($Period)
  } else {
    [CanalTimeOfDay]::new()
  }
}
