$commonProfile = Join-Path $PSScriptRoot 'profile.common.ps1'

if (Test-Path $commonProfile) {
  . $commonProfile
}

# ============================================================
# Variables de entorno de esta maquina
# ============================================================

$env:LANG = 'en_US.UTF-8'

# ============================================================
# Rutas y herramientas locales
# ============================================================

$vsCodeBinPath = Join-Path $env:LOCALAPPDATA 'Programs\Microsoft VS Code\bin'
Add-ToPathIfExists $vsCodeBinPath

if (Get-Command code -ErrorAction SilentlyContinue) {
  $env:EDITOR = 'code --wait'
  $env:VISUAL = 'code --wait'
}

$nodePath = Join-Path $env:ProgramFiles 'nodejs'
if (Test-Path $nodePath) {
  $env:NODE_HOME = $nodePath
  Add-ToPathIfExists $env:NODE_HOME
}

$pnpmPath = Join-Path $env:LOCALAPPDATA 'pnpm'
if (Test-Path $pnpmPath) {
  $env:PNPM_HOME = $pnpmPath
  Add-ToPathIfExists $env:PNPM_HOME
}

if ($env:ChocolateyInstall) {
  $chocolateyProfile = Join-Path $env:ChocolateyInstall 'helpers\chocolateyProfile.psm1'

  if (Test-Path $chocolateyProfile) {
    Import-Module $chocolateyProfile
  }
}
