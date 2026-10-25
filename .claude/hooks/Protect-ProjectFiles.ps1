[CmdletBinding()]
param(
    [Parameter()]
    [string]$RepoRoot
)

try {
    if (-not $RepoRoot) { $RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path }
    $repoRootPath = $RepoRoot.TrimEnd('\', '/')
    $hookInput = [Console]::In.ReadToEnd() | ConvertFrom-Json
    $toolName = [string]$hookInput.tool_name

    $protectedPaths = @(
        [PSCustomObject]@{ Pattern = 'tools/*'; Reason = 'is synced from the Modding Manager (Scripts/Build) and is overwritten on the next sync. Change it there, or ask the user.' },
        [PSCustomObject]@{ Pattern = 'tests/BuildEngine.Tests.ps1'; Reason = 'is synced from the Modding Manager (Scripts/Build/HoiModBuild.Tests.ps1) and is overwritten on the next sync. Change it there, or ask the user.' },
        [PSCustomObject]@{ Pattern = 'tests/Run-Tests.ps1'; Reason = 'is synced from the Modding Manager (Scripts/Build/Run-Tests.ps1) and is overwritten on the next sync. Change it there, or ask the user.' },
        [PSCustomObject]@{ Pattern = 'tests/Knowledge.Tests.ps1'; Reason = 'is synced from the Modding Manager (Scripts/Knowledge/Knowledge.Tests.ps1) and is overwritten on the next sync. Change it there, or ask the user.' },
        [PSCustomObject]@{ Pattern = '.github/workflows/ci.yml'; Reason = 'is synced from the Modding Manager (Scripts/Build/ci.yml) and is overwritten on the next sync. Change it there, or ask the user.' }
    )

    if ($toolName -in @('Edit', 'Write', 'MultiEdit', 'NotebookEdit')) {
        $filePath = [string]$hookInput.tool_input.file_path
        if (-not $filePath) { $filePath = [string]$hookInput.tool_input.notebook_path }
        if (-not $filePath) { exit 0 }
        if (-not [System.IO.Path]::IsPathRooted($filePath)) { $filePath = Join-Path $repoRootPath $filePath }
        $fullPath = [System.IO.Path]::GetFullPath($filePath)
        if (-not $fullPath.StartsWith($repoRootPath + '\', [System.StringComparison]::OrdinalIgnoreCase)) { exit 0 }
        $relativePath = $fullPath.Substring($repoRootPath.Length + 1).Replace('\', '/')
        foreach ($protected in $protectedPaths) {
            if ($relativePath -like $protected.Pattern) {
                [Console]::Error.WriteLine("$relativePath $($protected.Reason)")
                exit 2
            }
        }
        exit 0
    }

    if ($toolName -in @('Bash', 'PowerShell')) {
        $command = [string]$hookInput.tool_input.command
        if (-not $command) { exit 0 }
        $syncedFilePattern = 'HoiModBuild|BuildEngine\.Tests|Run-Tests\.ps1|Knowledge\.Tests|ci\.yml'
        if ($command -notmatch $syncedFilePattern) { exit 0 }
        $writePattern = 'Set-Content|Add-Content|Out-File|WriteAllText|WriteAllLines|WriteAllBytes|sed\s+-i|Copy-Item|Move-Item|Remove-Item|New-Item|\bcp\s|\bmv\s|\brm\s|\btee\s|>\s*"?[^\s"]*(tools[/\\]|BuildEngine\.Tests|Run-Tests\.ps1|Knowledge\.Tests|ci\.yml)'
        if ($command -match $writePattern) {
            [Console]::Error.WriteLine('The command writes a file synced from the Modding Manager (tools/, tests/BuildEngine.Tests.ps1, tests/Run-Tests.ps1, tests/Knowledge.Tests.ps1 or .github/workflows/ci.yml); the next sync overwrites it. Change it under the Manager''s Scripts/Build or Scripts/Knowledge, or ask the user. See AGENTS.md.')
            exit 2
        }
        exit 0
    }

    exit 0
} catch {
    exit 0
}
