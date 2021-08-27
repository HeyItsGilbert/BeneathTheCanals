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
}

Describe "New-CanalTimeOfDay" {
  It "Creates a new Catacomb" {
    New-CanalTimeOfDay | Should -Not -BeNullOrEmpty
  }
}

Describe "Test New-CanalEncounter" {
  It "Creates a new random encounter" {
    $cc = New-CanalCatacomb
    $tod = New-CanalTimeOfDay
    New-CanalEncounter -Catacomb $cc -TimeOfDay $tod | Should -BeOfType System.Management.Automation.PSCustomObject
  }

}
