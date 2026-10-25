[CmdletBinding()]
param(
    [Parameter()]
    [string]$RepoRoot
)

try {
    if (-not $RepoRoot) { $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path }
    $repoRootPath = $RepoRoot.TrimEnd('\', '/')
    $hookInput = [Console]::In.ReadToEnd() | ConvertFrom-Json
    if ([string]$hookInput.tool_name -notin @('Edit', 'Write', 'MultiEdit')) { exit 0 }
    $filePath = [string]$hookInput.tool_input.file_path
    if (-not $filePath) { exit 0 }
    if (-not [System.IO.Path]::IsPathRooted($filePath)) { $filePath = Join-Path $repoRootPath $filePath }
    $fullPath = [System.IO.Path]::GetFullPath($filePath)
    if (-not $fullPath.StartsWith($repoRootPath + '\', [System.StringComparison]::OrdinalIgnoreCase)) { exit 0 }
    $relativePath = $fullPath.Substring($repoRootPath.Length + 1).Replace('\', '/')
    if ($relativePath -notlike 'common/units/names_ships/*.txt') { exit 0 }
    $buildScriptPath = Join-Path $repoRootPath 'build.ps1'
    if (-not (Test-Path -LiteralPath $buildScriptPath)) { exit 0 }
} catch {
    exit 0
}

$powerShellExecutable = if (Get-Command -Name 'pwsh' -ErrorAction SilentlyContinue) { 'pwsh' } else { 'powershell' }
$validationOutput = @(& $powerShellExecutable -NoProfile -ExecutionPolicy Bypass -File $buildScriptPath -ValidateOnly 2>&1 | ForEach-Object { "$_" })
if ($LASTEXITCODE -eq 0) { exit 0 }

$errorLines = @($validationOutput | Where-Object { $_ -match '\[ERROR\]' } | Select-Object -First 20)
if ($errorLines.Count -eq 0) { $errorLines = @($validationOutput | Select-Object -Last 10) }
[Console]::Error.WriteLine("build.ps1 -ValidateOnly failed after the edit of ${relativePath}:")
foreach ($errorLine in $errorLines) { [Console]::Error.WriteLine($errorLine.Trim()) }
exit 2