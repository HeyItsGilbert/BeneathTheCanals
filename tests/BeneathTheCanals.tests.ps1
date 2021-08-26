# Taken with love from @juneb_get_help (https://raw.githubusercontent.com/juneb/PesterTDD/master/Module.Help.Tests.ps1)

BeforeDiscovery {

  function script:FilterOutCommonParams {
    param ($Params)
    $commonParams = @(
      'Debug', 'ErrorAction', 'ErrorVariable', 'InformationAction', 'InformationVariable',
      'OutBuffer', 'OutVariable', 'PipelineVariable', 'Verbose', 'WarningAction',
      'WarningVariable', 'Confirm', 'Whatif'
    )
    $params | Where-Object { $_.Name -notin $commonParams } | Sort-Object -Property Name -Unique
  }

  $manifest = Import-PowerShellDataFile -Path $env:BHPSModuleManifest
  $outputDir = Join-Path -Path $env:BHProjectPath -ChildPath 'Output'
  $outputModDir = Join-Path -Path $outputDir -ChildPath $env:BHProjectName
  $outputModVerDir = Join-Path -Path $outputModDir -ChildPath $manifest.ModuleVersion
  $outputModVerManifest = Join-Path -Path $outputModVerDir -ChildPath "$($env:BHProjectName).psd1"
  $outputClasses = Join-Path -Path $outputModVerDir -ChildPath 'Classes'

  Get-ChildItem -Path $outputClasses | ForEach-Object {
    . $_.FullName
  }

  # Get module commands
  # Remove all versions of the module from the session. Pester can't handle multiple versions.
  Get-Module $env:BHProjectName | Remove-Module -Force -ErrorAction Ignore
  Import-Module -Name $outputModVerManifest -Verbose:$false -ErrorAction Stop
  $params = @{
    Module      = (Get-Module $env:BHProjectName)
    CommandType = [System.Management.Automation.CommandTypes[]]'Cmdlet, Function' # Not alias
  }
  if ($PSVersionTable.PSVersion.Major -lt 6) {
    $params.CommandType[0] += 'Workflow'
  }

  ## When testing help, remember that help is cached at the beginning of each session.
  ## To test, restart session.
}

Describe "New-CanalCatacomb" {
  It "Creates a new Catacomb" {
    New-CanalCatacomb | Should -BeOfType [CanalCatacomb]
  }
}

Describe "New-CanalTimeOfDay" {
  It "Creates a new Catacomb" {
    New-CanalCatacomb | Should -BeOfType [CanalTimeOfDay]
  }
}

Describe "Test New-CanalEncounter" {
  It "Creates a new random encounter" {
    $cc = New-CanalCatacomb
    $tod = New-CanalTimeOfDay
    New-CanalEncounter -Catacomb $cc -TimeOfDay $tod | Should -BeOfType System.Management.Automation.PSCustomObject
  }

  It "Creates specific encounter" {
    $cc = New-CanalCatacomb ''
    $tod = New-CanalTimeOfDay -Period 'Backerslight'
    New-CanalEncounter -Catacomb $cc -TimeOfDay $tod | Should -BeOfType System.Management.Automation.PSCustomObject
  }
}
