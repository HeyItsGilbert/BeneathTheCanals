BeforeDiscovery {
  $manifest = Import-PowerShellDataFile -Path $env:BHPSModuleManifest
  $outputDir = Join-Path -Path $env:BHProjectPath -ChildPath 'Output'
  $outputModDir = Join-Path -Path $outputDir -ChildPath $env:BHProjectName
  $outputModVerDir = Join-Path -Path $outputModDir -ChildPath $manifest.ModuleVersion
  $outputModVerManifest = Join-Path -Path $outputModVerDir -ChildPath "$($env:BHProjectName).psd1"

  # Get module commands
  # Remove all versions of the module from the session. Pester can't handle multiple versions.
  Get-Module $env:BHProjectName | Remove-Module -Force -ErrorAction Ignore
  Import-Module -Name $outputModVerManifest -Verbose:$false -ErrorAction Stop
}

Describe "New-CanalCatacomb" {
  It "Creates a new Catacomb" {
    New-CanalCatacomb | Should -Not -BeNullOrEmpty
  }

  It "Creates a specific Catacomb" {
    $c = New-CanalCatacomb -Category Undercity -Room Stairs
    $c.Category | Should -Be Undercity
    $c.Room | Should -Be Stairs
    $c.EncounterDie | Should -Be 4
    $c.FeatureShift | Should -Be -2
  }
}

Describe "New-CanalTimeOfDay" {
  It "Creates a random time of day" {
    New-CanalTimeOfDay | Should -Not -BeNullOrEmpty
  }

  It "Creates a specific period" {
    $tod = New-CanalTimeOfDay -Period Backerslight
    $tod.Period | Should -Be 'Backerslight'
    $tod.EncounterShift | Should -Be 0
    $tod.Description | Should -Be 'First period of daylight with no visible moon, during which bakers begin their work and the canals are mostly empty as the world wakes.'
  }
}

Describe "Test New-CanalEncounter" {
  It "Creates a new random encounter" {
    $cc = New-CanalCatacomb
    $tod = New-CanalTimeOfDay
    New-CanalEncounter -Catacomb $cc -TimeOfDay $tod | Should -BeOfType System.Management.Automation.PSCustomObject
  }

}
