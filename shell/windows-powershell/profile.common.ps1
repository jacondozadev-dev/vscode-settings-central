# ============================================================
# Helpers: funciones genericas reutilizables
# ============================================================

function Add-ToPathIfExists {
  param([string]$PathToAdd)

  if ([string]::IsNullOrWhiteSpace($PathToAdd)) {
    return
  }

  if ((Test-Path $PathToAdd) -and (($env:Path -split ';') -notcontains $PathToAdd)) {
    $env:Path = "$PathToAdd;$env:Path"
  }
}

# ============================================================
# Historial, sugerencias y colores de comandos
# ============================================================

$psReadLine = Get-Command Set-PSReadLineOption -ErrorAction SilentlyContinue

if ($psReadLine) {
  if ($psReadLine.Parameters.ContainsKey('PredictionSource')) {
    try {
      Set-PSReadLineOption -PredictionSource History -ErrorAction Stop
    } catch {
    }
  }

  if ($psReadLine.Parameters.ContainsKey('PredictionViewStyle')) {
    try {
      Set-PSReadLineOption -PredictionViewStyle ListView -ErrorAction Stop
    } catch {
    }
  }

  try {
    Set-PSReadLineOption -Colors @{
      Command = 'DarkGreen'
      Parameter = 'Yellow'
      String = 'Green'
      Operator = 'Magenta'
      Number = 'DarkYellow'
      InlinePrediction = 'DarkGray'
    }
  } catch {
  }
}

# ============================================================
# Informacion dinamica del proyecto
# ============================================================

if (-not $script:PromptRuntimeVersionCache) {
  $script:PromptRuntimeVersionCache = @{}
}

function Find-ProjectFile {
  param([string]$FileName)

  $directory = Get-Item -LiteralPath (Get-Location)

  while ($directory) {
    $candidate = Join-Path $directory.FullName $FileName
    if (Test-Path $candidate) {
      return $candidate
    }

    $directory = $directory.Parent
  }

  return $null
}

function Test-FlutterPubspec {
  param([string]$PubspecPath)

  if (-not $PubspecPath) {
    return $false
  }

  try {
    $pubspecText = Get-Content -Raw -LiteralPath $PubspecPath
    return $pubspecText -match '(?m)^\s*flutter:\s*$' -or $pubspecText -match '(?m)^\s*sdk:\s*flutter\s*$'
  } catch {
    return $false
  }
}

function Get-FvmFlutterVersion {
  $fvmrc = Find-ProjectFile '.fvmrc'

  if (-not $fvmrc) {
    return ''
  }

  try {
    $config = Get-Content -Raw -LiteralPath $fvmrc | ConvertFrom-Json
    if ($config.flutter) {
      return [string]$config.flutter
    }
  } catch {
  }

  return ''
}

function Get-NodePromptVersion {
  if ($script:PromptRuntimeVersionCache.ContainsKey('Node')) {
    return $script:PromptRuntimeVersionCache['Node']
  }

  $version = ''

  if (Get-Command node -ErrorAction SilentlyContinue) {
    $versionText = node --version 2>$null
    if ($versionText -match '^v?(.+)$') {
      $version = $Matches[1]
    }
  }

  $script:PromptRuntimeVersionCache['Node'] = $version
  return $version
}

function Get-ProjectRuntimePrompt {
  $pubspec = Find-ProjectFile 'pubspec.yaml'

  if ($pubspec) {
    if (Test-FlutterPubspec $pubspec) {
      $version = Get-FvmFlutterVersion
      if ($version) {
        return "Flutter-$version"
      }

      return 'Flutter'
    }

    return 'Dart'
  }

  if (Find-ProjectFile 'package.json') {
    $version = Get-NodePromptVersion
    if ($version) {
      return "Node-$version"
    }

    return 'Node'
  }

  return ''
}

# ============================================================
# Prompt
# ============================================================

function prompt {
  $user = $env:USERNAME
  $folder = Split-Path -Leaf (Get-Location)
  $runtime = Get-ProjectRuntimePrompt

  $branch = ''
  if (Get-Command git -ErrorAction SilentlyContinue) {
    $gitBranch = git branch --show-current 2>$null
    if ($LASTEXITCODE -eq 0 -and -not [string]::IsNullOrWhiteSpace($gitBranch)) {
      $branch = " [$gitBranch]"
    }
  }

  Write-Host $user -NoNewline -ForegroundColor Green
  Write-Host ' : ' -NoNewline
  Write-Host $folder -NoNewline -ForegroundColor DarkGreen
  Write-Host $branch -NoNewline -ForegroundColor Magenta

  if ($runtime) {
    Write-Host " $runtime" -NoNewline -ForegroundColor Cyan
  }

  Write-Host ' > ' -NoNewline -ForegroundColor White

  return ' '
}
