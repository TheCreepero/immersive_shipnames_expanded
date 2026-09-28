<#
.SYNOPSIS
    Build, validate, deploy, package, and publish automation for Immersive Ship Names Expanded (Hearts of Iron IV mod).

.DESCRIPTION
    Provides modern, reliable mod development workflows:
    - Deploy (default): Fast mirror sync into Paradox HOI4 mod directory, strictly excluding .git,
      documentation, and dev artifacts, while auto-generating the launcher .mod file from descriptor.mod.
    - DevLink: Points the launcher .mod file directly to this dev repository for instant zero-copy live editing.
    - Package: Generates a clean distribution ZIP archive (isne.zip) excluding .git and build tools.
    - Validate: Checks all ship namelist .txt files for balanced braces ({}), quotes, ship types, and syntax validity.
    - PublishSteam: Staged, clean upload directly to Steam Workshop via SteamCMD.
    - Clean: Removes deployed mod files and generated archives.

.PARAMETER Deploy
    Deploy mod files to the Paradox Interactive Hearts of Iron IV mod folder (default action).

.PARAMETER DevLink
    Configure Paradox launcher to read directly from the working development folder without copying.

.PARAMETER Package
    Create a clean release ZIP archive (default: isne.zip).

.PARAMETER PublishSteam
    Stage clean mod content and upload update to Steam Workshop using SteamCMD.

.PARAMETER InstallSteamCmd
    Automatically download and install Valve's official SteamCMD utility.

.PARAMETER ValidateOnly
    Run validation only and exit.

.PARAMETER Test
    Execute the comprehensive Pester unit test suites in tests/ and report results.

.PARAMETER Validate
    Validate ship namelist syntax and bracket balance before proceeding (enabled by default).

.PARAMETER NoValidate
    Skip syntax and bracket validation.

.PARAMETER Clean
    Clean deployed mod files from Paradox mod directory and delete temporary zip archives.

.PARAMETER InspectVanilla
    Inspect vanilla Hearts of Iron IV ship namelists for a country tag (e.g. -InspectVanilla FIN).

.PARAMETER Audit
    Audit the mod's ship namelist for a country tag against current ISNE standards (e.g. -Audit CUB).
    Prints a compact report: group table (counts vs tier quotas), findings by severity (FAIL/WARN/INFO), and a summary line.

.PARAMETER Group
    Optional specific ship namelist group tag to excerpt directly when using -InspectVanilla or -Audit (e.g. -Group FIN_DD_HISTORICAL).
    With -Audit, accepts a comma-separated list, and the TAG_ prefix may be omitted (e.g. -Group RULERS,HEROES,CV_HISTORICAL).

.PARAMETER NamesOnly
    With -Audit: print one compact line per group (tag, count, display name, names separated by "; ") instead of raw blocks.
    Combine with -Group to limit output to the listed groups; without -Group, prints every group and skips the report.

.PARAMETER Hoi4InstallDir
    Custom path to the Hearts of Iron IV installation folder if installed in a non-standard directory.

.PARAMETER ModDir
    Custom path to the Paradox Hearts of Iron IV mod directory. Defaults to standard Documents path.

.PARAMETER ZipOutput
    Custom file path or name for the packaged zip file.

.PARAMETER SteamUser
    Steam username owning the workshop item. Saved to .steam_username upon first entry.

.PARAMETER ChangeNote
    Update note for Steam Workshop. Defaults to the latest git commit message.

.PARAMETER SteamCmdPath
    Custom path to steamcmd.exe if installed in a non-standard directory.

.PARAMETER DryRun
    Preview the generated Steam VDF, staged files, and upload command without executing SteamCMD.

.EXAMPLE
    .\build.ps1
    # Validates and deploys the mod to the local HOI4 mod directory.

.EXAMPLE
    .\build.ps1 -DevLink
    # Configures HOI4 to load directly from the git repo folder (instant hot-reload).

.EXAMPLE
    .\build.ps1 -Package
    # Packages a clean isne.zip without .git or build artifacts.

.EXAMPLE
    .\build.ps1 -Test
    # Executes automated Pester test suites covering ship namelists, documentation, and build automation.

.EXAMPLE
    .\build.ps1 -Audit CUB
    # Audits CUB_ship_names.txt against current standards; add -Group CUB_BB_HISTORICAL to print a single group.

.EXAMPLE
    .\build.ps1 -Audit FIN -Group RULERS,HEROES,BC_HISTORICAL -NamesOnly
    # Prints the listed groups as one compact line each (names only, no block boilerplate).

.EXAMPLE
    .\build.ps1 -PublishSteam -DryRun
    # Previews the Steam Workshop VDF and staged files without uploading.
#>

[CmdletBinding(DefaultParameterSetName = 'Deploy')]
param(
    [Parameter(ParameterSetName = 'Deploy')]
    [switch]$Deploy,

    [Parameter(ParameterSetName = 'DevLink')]
    [switch]$DevLink,

    [Parameter(ParameterSetName = 'Package')]
    [switch]$Package,

    [Parameter(ParameterSetName = 'PublishSteam')]
    [switch]$PublishSteam,

    [Parameter(ParameterSetName = 'InstallSteamCmd')]
    [switch]$InstallSteamCmd,

    [Parameter(ParameterSetName = 'ValidateOnly')]
    [switch]$ValidateOnly,

    [Parameter(ParameterSetName = 'Test')]
    [switch]$Test,

    [Parameter(ParameterSetName = 'Clean')]
    [switch]$Clean,

    [Parameter(ParameterSetName = 'InspectVanilla', Mandatory = $true)]
    [string]$InspectVanilla,

    [Parameter(ParameterSetName = 'Audit', Mandatory = $true)]
    [string]$Audit,

    [Parameter(ParameterSetName = 'InspectVanilla')]
    [Parameter(ParameterSetName = 'Audit')]
    [string]$Group,

    [Parameter(ParameterSetName = 'Audit')]
    [switch]$NamesOnly,

    [Parameter(ParameterSetName = 'InspectVanilla')]
    [Parameter(ParameterSetName = 'Audit')]
    [string]$Hoi4InstallDir,

    [switch]$Validate,
    [switch]$NoValidate,
    [switch]$DryRun,
    [string]$ModDir,
    [string]$ZipOutput,
    [string]$SteamUser,
    [string]$ChangeNote,
    [string]$SteamCmdPath
)

Set-StrictMode -Off
$ErrorActionPreference = 'Stop'

# --- Terminal Styling Helpers ---
function Write-Step   { param([string]$msg) Write-Host "`n==> $msg" -ForegroundColor Cyan }
function Write-Ok     { param([string]$msg) Write-Host "  [OK] $msg" -ForegroundColor Green }
function Write-Info   { param([string]$msg) Write-Host "  [INFO] $msg" -ForegroundColor Gray }
function Write-Warn   { param([string]$msg) Write-Host "  [WARN] $msg" -ForegroundColor Yellow }
function Write-Err    { param([string]$msg) Write-Host "  [ERROR] $msg" -ForegroundColor Red }

$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

# --- Locate Directories ---
$ScriptDir = $PSScriptRoot
if (-not $ScriptDir) {
    $ScriptDir = (Get-Location).Path
}
$RepoDir = $ScriptDir

$ModName = "immersive_shipnames_expanded"
$DescriptorPath = Join-Path $RepoDir "descriptor.mod"
if (-not (Test-Path $DescriptorPath)) {
    Write-Err "Could not find 'descriptor.mod' in '$RepoDir'."
    exit 1
}

# Resolve Paradox HOI4 Mod Directory
if (-not $ModDir) {
    $docs = [Environment]::GetFolderPath('MyDocuments')
    $ModDir = Join-Path $docs "Paradox Interactive\Hearts of Iron IV\mod"
}

# --- Helper: Parse descriptor.mod ---
function Get-ModMetadata {
    param([string]$Path)

    if (-not (Test-Path $Path)) {
        throw "Descriptor file not found: $Path"
    }

    $raw = Get-Content $Path -Raw -Encoding UTF8
    $metadata = @{
        Raw = $raw
        Version = $null
        SupportedVersion = $null
        Name = $null
        RemoteFileId = $null
        Tags = @()
    }

    if ($raw -match 'version\s*=\s*"([^"]+)"') { $metadata.Version = $matches[1] }
    if ($raw -match 'supported_version\s*=\s*"([^"]+)"') { $metadata.SupportedVersion = $matches[1] }
    if ($raw -match 'name\s*=\s*"([^"]+)"') { $metadata.Name = $matches[1] }
    if ($raw -match 'remote_file_id\s*=\s*"([^"]+)"') { $metadata.RemoteFileId = $matches[1] }

    return $metadata
}

# --- Helper: Generate Launcher .mod File Content ---
function New-LauncherModContent {
    param(
        [string]$DescriptorPath,
        [string]$TargetModPath
    )

    $meta = Get-ModMetadata -Path $DescriptorPath
    $rawLines = Get-Content $DescriptorPath -Encoding UTF8

    # Normalize target path with forward slashes for Paradox engine
    $normalizedPath = ($TargetModPath -replace '\\', '/')

    $lines = [System.Collections.Generic.List[string]]::new()
    $insertedPath = $false

    foreach ($line in $rawLines) {
        # Skip existing path definitions if present in descriptor
        if ($line -match '^\s*path\s*=') { continue }

        # Insert path right before remote_file_id, or after supported_version
        if (-not $insertedPath -and ($line -match '^\s*remote_file_id\s*=')) {
            $lines.Add("path=`"$normalizedPath`"")
            $insertedPath = $true
        }

        $lines.Add($line)
    }

    if (-not $insertedPath) {
        $lines.Add("path=`"$normalizedPath`"")
    }

    return ($lines -join "`r`n")
}

# --- Helper: Validate Ship Namelists and Descriptor ---
function Invoke-Validation {
    Write-Step "Validating ship namelist syntax and files..."
    $hasErrors = $false

    # Check descriptor.mod
    if (-not (Test-Path $DescriptorPath)) {
        Write-Err "descriptor.mod is missing!"
        $hasErrors = $true
    } else {
        $meta = Get-ModMetadata -Path $DescriptorPath
        if (-not $meta.Name) { Write-Err "descriptor.mod: missing 'name' attribute"; $hasErrors = $true }
        if (-not $meta.SupportedVersion) { Write-Err "descriptor.mod: missing 'supported_version' attribute"; $hasErrors = $true }
        if (-not $hasErrors) {
            Write-Ok "descriptor.mod valid (Mod: '$($meta.Name)', Game Version: $($meta.SupportedVersion))"
        }
    }

    # Check thumbnail
    $thumbPath = Join-Path $RepoDir "thumbnail.png"
    if (Test-Path $thumbPath) {
        Write-Ok "thumbnail.png verified"
    } else {
        Write-Warn "thumbnail.png is missing from mod source (recommended for Steam Workshop)"
    }

    # Check ship namelists
    $namelistDir = Join-Path $RepoDir "common\units\names_ships"
    if (-not (Test-Path $namelistDir)) {
        Write-Err "Ship namelist directory not found: $namelistDir"
        return $false
    }

    $namelistFiles = Get-ChildItem -Path $namelistDir -Filter *.txt
    if ($namelistFiles.Count -eq 0) {
        Write-Warn "No ship namelist files found in $namelistDir"
    }

    $validShipTypes = @(
        'battle_cruiser', 'battleship', 'capital_ship', 'carrier', 'destroyer',
        'heavy_cruiser', 'light_cruiser', 'screen_ship', 'ship_hull_carrier',
        'ship_hull_cruiser', 'ship_hull_cruiser_submarine', 'ship_hull_heavy',
        'ship_hull_light', 'ship_hull_midget_submarine', 'ship_hull_submarine', 'submarine'
    )
    $globalGroupTags = @{}

    $checkedCount = 0
    foreach ($file in $namelistFiles) {
        $fileHasError = $false

        # Check UTF-8 BOM (UTF-8 without BOM required)
        $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
        if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
            Write-Err "$($file.Name): UTF-8 BOM detected! Files must be saved as UTF-8 without BOM."
            $fileHasError = $true
        }

        $lines = [System.IO.File]::ReadAllLines($file.FullName, [System.Text.Encoding]::UTF8)
        # Strip comments
        $cleanLines = @($lines | ForEach-Object { $_ -replace '#.*$', '' })
        $cleanText = $cleanLines -join "`n"

        # Check bracket balance
        $openCount  = ([regex]::Matches($cleanText, '\{')).Count
        $closeCount = ([regex]::Matches($cleanText, '\}')).Count
        if ($openCount -ne $closeCount) {
            Write-Err "$($file.Name): Bracket mismatch (Open: $openCount, Close: $closeCount)"
            $fileHasError = $true
        }

        # Check double-quote parity
        $quoteCount = ([regex]::Matches($cleanText, '"')).Count
        if ($quoteCount % 2 -ne 0) {
            Write-Err "$($file.Name): Unbalanced double quotes ($quoteCount quotes found)"
            $fileHasError = $true
        }

        # Check for invalid ship types against approved token whitelist
        $typeMatches = [regex]::Matches($cleanText, 'ship_types\s*=\s*\{([^}]*)\}')
        foreach ($tm in $typeMatches) {
            $tokens = [regex]::Matches($tm.Groups[1].Value, '([A-Za-z0-9_]+)') | ForEach-Object { $_.Groups[1].Value }
            foreach ($tok in $tokens) {
                if ($validShipTypes -notcontains $tok) {
                    Write-Err "$($file.Name): Invalid ship type token '$tok' found in ship_types"
                    $fileHasError = $true
                }
            }
        }

        # Check for empty unique or ordered blocks
        if ($cleanText -match 'unique\s*=\s*\{\s*\}') {
            Write-Err "$($file.Name): Empty unique block detected"
            $fileHasError = $true
        }
        if ($cleanText -match 'ordered\s*=\s*\{\s*\}') {
            Write-Err "$($file.Name): Empty ordered block detected"
            $fileHasError = $true
        }

        # Check for duplicate indices within each ordered block
        $orderedMatches = [regex]::Matches($cleanText, 'ordered\s*=\s*\{(?<content>[^}]*)\}')
        foreach ($m in $orderedMatches) {
            $block = $m.Groups['content'].Value
            $indexMatches = [regex]::Matches($block, '(\d+)\s*=\s*"')
            $seen = @{}
            foreach ($im in $indexMatches) {
                $idx = $im.Groups[1].Value
                if ($seen.ContainsKey($idx)) {
                    Write-Err "$($file.Name): Duplicate index $idx found in ordered block"
                    $fileHasError = $true
                } else {
                    $seen[$idx] = $true
                }
            }
        }

        # Check fallback_name format for ordinal placeholder (%d or %s)
        $fallbackMatches = [regex]::Matches($cleanText, 'fallback_name\s*=\s*"([^"]+)"')
        foreach ($fm in $fallbackMatches) {
            $fb = $fm.Groups[1].Value
            if ($fb -notmatch '(%d|%s)') {
                Write-Err "$($file.Name): Fallback name '$fb' is missing an ordinal placeholder (%d or %s)"
                $fileHasError = $true
            }
        }

        # Check group display name length (name = "...") for in-game UI dropdown limits (max 32 chars)
        $displayNameMatches = [regex]::Matches($cleanText, 'name\s*=\s*"([^"]+)"')
        foreach ($nm in $displayNameMatches) {
            $dispName = $nm.Groups[1].Value
            if ($dispName.Length -gt 32) {
                Write-Err "$($file.Name): Display name '$dispName' exceeds 32 characters ($($dispName.Length) chars). Shorten it for in-game UI dropdown compatibility."
                $fileHasError = $true
            }
        }

        # Check link_numbering_with self-reference and track global root group uniqueness
        $depth = 0
        $currentGroup = $null
        for ($i = 0; $i -lt $lines.Length; $i++) {
            $cleanLine = ($lines[$i] -replace '#.*$', '').Trim()
            if ([string]::IsNullOrWhiteSpace($cleanLine)) { continue }

            if ($depth -eq 0) {
                $gm = [regex]::Match($cleanLine, '^([A-Za-z][A-Za-z0-9_]*)\s*=\s*\{?')
                if ($gm.Success -and $cleanLine -notmatch '^(ordered|unique|ship_types|for_countries|can_use|link_numbering_with|type|prefix|fallback_name)\b') {
                    $currentGroup = $gm.Groups[1].Value
                    if ($globalGroupTags.ContainsKey($currentGroup)) {
                        Write-Err "$($file.Name): Duplicate group tag '$currentGroup' (first defined in $($globalGroupTags[$currentGroup]))"
                        $fileHasError = $true
                    } else {
                        $globalGroupTags[$currentGroup] = $file.Name
                    }
                }
            }

            $lm = [regex]::Match($cleanLine, 'link_numbering_with\s*=\s*\{([^}]*)\}')
            if ($lm.Success -and $currentGroup) {
                $targets = [regex]::Matches($lm.Groups[1].Value, '([A-Za-z0-9_]+)') | ForEach-Object { $_.Groups[1].Value }
                foreach ($tgt in $targets) {
                    if ($tgt -eq $currentGroup) {
                        Write-Err "$($file.Name): Group '$currentGroup' has self-referential link_numbering_with"
                        $fileHasError = $true
                    }
                }
            }

            $depth += (([regex]::Matches($cleanLine, '\{')).Count - ([regex]::Matches($cleanLine, '\}')).Count)
        }

        if ($fileHasError) {
            $hasErrors = $true
        } else {
            $checkedCount++
        }
    }

    # Verify documentation synchronization with README.md
    $readmePath = Join-Path $RepoDir "README.md"
    if (Test-Path $readmePath) {
        $readmeText = [System.IO.File]::ReadAllText($readmePath, [System.Text.Encoding]::UTF8)
        $implementedTags = [System.Collections.Generic.HashSet[string]]::new()
        foreach ($f in $namelistFiles) {
            if ($f.Name -match '^(?:ISNE_)?([A-Z0-9]{3})_') {
                [void]$implementedTags.Add($matches[1])
            }
        }
        foreach ($t in $implementedTags) {
            if ($readmeText -notmatch ("\|\s*[`]?" + [regex]::Escape($t) + "[`]?\s*\|")) {
                Write-Err "README.md: Missing documentation entry for nation tag '$t'"
                $hasErrors = $true
            }
        }
    }

    if (-not $hasErrors) {
        Write-Ok "All $checkedCount ship namelist files passed comprehensive syntax, engine, and structure validation."
    }

    return (-not $hasErrors)
}

# --- Helper: Find or Install SteamCMD ---
function Find-SteamCmd {
    param([string]$CustomPath)

    if ($CustomPath -and (Test-Path $CustomPath)) {
        return (Resolve-Path $CustomPath).Path
    }

    $cmd = Get-Command steamcmd.exe -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }

    $candidates = @(
        "C:\steamcmd\steamcmd.exe",
        "C:\Program Files (x86)\Steam\steamcmd.exe",
        (Join-Path $env:LOCALAPPDATA "Programs\steamcmd\steamcmd.exe"),
        (Join-Path $env:USERPROFILE "steamcmd\steamcmd.exe")
    )

    foreach ($p in $candidates) {
        if ($p -and (Test-Path $p)) { return $p }
    }

    return $null
}

function Install-SteamCmd {
    Write-Step "Installing SteamCMD..."
    $installDir = Join-Path $env:USERPROFILE "steamcmd"
    if (-not (Test-Path $installDir)) {
        New-Item -ItemType Directory -Path $installDir -Force | Out-Null
    }

    $zipPath = Join-Path $installDir "steamcmd.zip"
    $url = "https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"

    Write-Info "Downloading SteamCMD from Valve ($url)..."
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($url, $zipPath)

    Write-Info "Extracting to $installDir..."
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipPath, $installDir)
    Remove-Item -Force $zipPath

    $exe = Join-Path $installDir "steamcmd.exe"
    if (Test-Path $exe) {
        Write-Ok "SteamCMD successfully installed at: $exe"
        return $exe
    } else {
        throw "Failed to install SteamCMD: steamcmd.exe not found after extraction."
    }
}

# --- Helper: Find Hearts of Iron IV Game Installation ---
function Find-Hoi4Install {
    param([string]$CustomPath)

    if ($CustomPath -and (Test-Path (Join-Path $CustomPath "common\units\names_ships"))) {
        return (Resolve-Path $CustomPath).Path
    }

    $candidates = [System.Collections.Generic.List[string]]::new()
    $candidates.Add("C:\Gaming\Steam\steamapps\common\Hearts of Iron IV")
    $candidates.Add("C:\Program Files (x86)\Steam\steamapps\common\Hearts of Iron IV")
    $candidates.Add("C:\Program Files\Steam\steamapps\common\Hearts of Iron IV")

    # Read registry for SteamPath
    try {
        $regSteam = (Get-ItemProperty -Path "HKCU:\Software\Valve\Steam" -Name "SteamPath" -ErrorAction SilentlyContinue).SteamPath
        if ($regSteam) {
            $candidates.Add((Join-Path $regSteam "steamapps\common\Hearts of Iron IV"))
            $vdf = Join-Path $regSteam "steamapps\libraryfolders.vdf"
            if (Test-Path $vdf) {
                $vdfRaw = Get-Content $vdf -Raw -ErrorAction SilentlyContinue
                $libMatches = [regex]::Matches($vdfRaw, '"path"\s*"([^"]+)"')
                foreach ($m in $libMatches) {
                    $p = $m.Groups[1].Value -replace '\\\\', '\'
                    $candidates.Add((Join-Path $p "steamapps\common\Hearts of Iron IV"))
                }
            }
        }
    } catch {}

    foreach ($cand in $candidates) {
        if ($cand -and (Test-Path (Join-Path $cand "common\units\names_ships"))) {
            return (Resolve-Path $cand).Path
        }
    }

    return $null
}

# --- Helper: Parse ship namelist groups from a file ---
function Get-NamelistGroups {
    param([string]$Path)

    $raw = [System.IO.File]::ReadAllText($Path, [System.Text.Encoding]::UTF8)
    $lines = $raw -split '\r?\n'

    $groups = [System.Collections.Generic.List[psobject]]::new()
    $i = 0
    while ($i -lt $lines.Length) {
        $line = $lines[$i] -replace '#.*$', ''
        $match = [regex]::Match($line, '^\s*([A-Za-z][A-Za-z0-9_]*)\s*=\s*\{?')
        if ($match.Success -and $line.Trim() -notmatch '^(ordered|unique|ship_types|for_countries|can_use|link_numbering_with|type|prefix|fallback_name)\b') {
            $gtag = $match.Groups[1].Value
            $blockLines = [System.Collections.Generic.List[string]]::new()
            $blockLines.Add($lines[$i])
            $openB = ([regex]::Matches($line, '\{')).Count
            $closeB = ([regex]::Matches($line, '\}')).Count
            $braceCount = $openB - $closeB

            $j = $i + 1
            if ($openB -eq 0) {
                while ($j -lt $lines.Length -and ($lines[$j] -replace '#.*$', '') -notmatch '\{') {
                    $blockLines.Add($lines[$j])
                    $j++
                }
                if ($j -lt $lines.Length) {
                    $cleanJ = $lines[$j] -replace '#.*$', ''
                    $blockLines.Add($lines[$j])
                    $braceCount += ([regex]::Matches($cleanJ, '\{')).Count - ([regex]::Matches($cleanJ, '\}')).Count
                    $j++
                }
            }

            while ($j -lt $lines.Length -and $braceCount -gt 0) {
                $cleanJ = $lines[$j] -replace '#.*$', ''
                $blockLines.Add($lines[$j])
                $braceCount += ([regex]::Matches($cleanJ, '\{')).Count - ([regex]::Matches($cleanJ, '\}')).Count
                $j++
            }

            $blockText = $blockLines -join "`r`n"
            $cleanBlock = $blockText -replace '(?m)#.*$', ''

            $nameM = [regex]::Match($cleanBlock, '(?m)^\s*name\s*=\s*([^\r\n]+)')
            $typesM = [regex]::Match($cleanBlock, 'ship_types\s*=\s*\{([^}]*)\}')
            $fallbackM = [regex]::Match($cleanBlock, 'fallback_name\s*=\s*"([^"]+)"')
            $uniqueM = [regex]::Match($cleanBlock, 'unique\s*=\s*\{([^}]*)\}')
            $orderedM = [regex]::Match($cleanBlock, '(?s)ordered\s*=\s*\{(.*)\}')
            $prefixM = [regex]::Match($cleanBlock, 'prefix\s*=\s*"([^"]*)"')

            $names = @()
            $samples = @()
            if ($uniqueM.Success) {
                $entries = [regex]::Matches($uniqueM.Groups[1].Value, '"([^"]+)"')
                $names = @($entries | ForEach-Object { $_.Groups[1].Value })
                $samples = @($names | Select-Object -First 3)
            } elseif ($orderedM.Success) {
                $entries = [regex]::Matches($orderedM.Groups[1].Value, '(\d+)\s*=\s*(?:\{\s*)?"([^"]+)"')
                $names = @($entries | ForEach-Object { $_.Groups[2].Value })
                $samples = @($entries | Select-Object -First 3 | ForEach-Object { "$($_.Groups[1].Value)=$($_.Groups[2].Value)" })
            }

            $nameRaw = if ($nameM.Success) { $nameM.Groups[1].Value.Trim() } else { "" }

            $groups.Add([PSCustomObject]@{
                GroupTag      = $gtag
                ThemeName     = if ($nameRaw) { $nameRaw.Trim('"') } else { "N/A" }
                NameIsLiteral = $nameRaw.StartsWith('"')
                ShipTypes     = if ($typesM.Success) { ($typesM.Groups[1].Value -replace '\s+', ' ').Trim() } else { "N/A" }
                HasPrefix     = $prefixM.Success
                Prefix        = if ($prefixM.Success) { $prefixM.Groups[1].Value } else { "" }
                Fallback      = if ($fallbackM.Success) { $fallbackM.Groups[1].Value } else { "N/A" }
                Names         = $names
                Count         = $names.Count
                SampleNames   = ($samples -join ', ')
                RawBlock      = $blockText
            })

            $i = $j - 1
        }
        $i++
    }

    return , $groups.ToArray()
}

# --- Helper: Audit a mod namelist against current ISNE standards ---
# Returns findings as objects: Severity (FAIL/WARN/INFO), Check, Group, Detail.
# -RepoDir enables documentation sync checks; -VanillaGroups enables vanilla prefix parity.
function Get-NamelistAuditFindings {
    param(
        [object[]]$Groups,
        [string]$Tag,
        [string]$RepoDir,
        [object[]]$VanillaGroups
    )

    $findings = [System.Collections.Generic.List[psobject]]::new()
    function Add-Finding([string]$Sev, [string]$Check, [string]$Grp, [string]$Detail) {
        $findings.Add([PSCustomObject]@{ Severity = $Sev; Check = $Check; Group = $Grp; Detail = $Detail })
    }
    function Format-NameList([string[]]$Items) {
        $shown = @($Items | Select-Object -First 8)
        $text = $shown -join ', '
        if ($Items.Count -gt 8) { $text += " (+$($Items.Count - 8) more)" }
        return $text
    }

    # Tier quotas: Target (standard) and Floor (minor-navy minimum). Below floor = FAIL, below target = WARN.
    $quotas = @{
        DD = @{ Target = 100; Floor = 80 }
        SS = @{ Target = 60;  Floor = 50 }
        CL = @{ Target = 50;  Floor = 40 }
        CA = @{ Target = 35;  Floor = 35 }
        BB = @{ Target = 30;  Floor = 30 }
        BC = @{ Target = 30;  Floor = 30 }
        CV = @{ Target = 30;  Floor = 30 }
        THEME = @{ Target = 35; Floor = 20 }
    }
    $hulls = @('DD', 'SS', 'CL', 'CA', 'BB', 'BC', 'CV')

    $byClass = @{}
    $themes = @()
    foreach ($g in $Groups) {
        $m = [regex]::Match($g.GroupTag, "^$([regex]::Escape($Tag))_(DD|SS|CL|CA|BB|BC|CV)_HISTORICAL$")
        $cls = if ($m.Success) { $m.Groups[1].Value } else { 'THEME' }
        $g | Add-Member -NotePropertyName Class -NotePropertyValue $cls -Force
        $g | Add-Member -NotePropertyName Target -NotePropertyValue $quotas[$cls].Target -Force
        if ($cls -eq 'THEME') { $themes += $g } else { $byClass[$cls] = $g }
        if (-not $g.GroupTag.StartsWith("${Tag}_")) {
            Add-Finding 'WARN' 'TagNaming' $g.GroupTag "Group tag does not start with '${Tag}_'"
        }
    }

    # 1. Depth vs tiered quotas
    foreach ($g in $Groups) {
        $q = $quotas[$g.Class]
        if ($g.Count -lt $q.Floor) {
            # Thematic depth applies "where thematic scope permits", so a short pool is WARN, never FAIL
            $sev = if ($g.Class -eq 'THEME') { 'WARN' } else { 'FAIL' }
            Add-Finding $sev 'Depth' $g.GroupTag "$($g.Count) names; below floor $($q.Floor), target $($q.Target)"
        } elseif ($g.Count -lt $q.Target) {
            Add-Finding 'WARN' 'Depth' $g.GroupTag "$($g.Count) names; target $($q.Target) (floor $($q.Floor) met)"
        }
    }

    # 2. Structure
    foreach ($h in $hulls) {
        if (-not $byClass.ContainsKey($h)) {
            $detail = "Missing ${Tag}_${h}_HISTORICAL"
            if ($h -eq 'BC' -and $byClass.ContainsKey('BB') -and $byClass['BB'].ShipTypes -match '\bbattle_cruiser\b') {
                $detail += "; BB group also carries battle_cruiser (split BB/BC by doctrine)"
            }
            Add-Finding 'FAIL' 'MissingHull' '-' $detail
        }
    }
    if ($byClass.ContainsKey('BC') -and $byClass.ContainsKey('BB') -and $byClass['BB'].ShipTypes -match '\bbattle_cruiser\b') {
        Add-Finding 'WARN' 'BBCarriesBC' $byClass['BB'].GroupTag "BB ship_types include battle_cruiser although a BC group exists"
    }
    if ($themes.Count -lt 6) {
        Add-Finding 'WARN' 'ThemeCount' '-' "$($themes.Count) thematic pools; standard is 6+"
    }
    foreach ($t in $themes) {
        if ($t.ShipTypes -ne 'N/A') {
            Add-Finding 'FAIL' 'ThemeRestricted' $t.GroupTag "Thematic pool restricts ship_types ($($t.ShipTypes)); omit for universal selection"
        }
    }

    # 3. Collisions: intra-group duplicates, cross-class overlaps, BB/BC mirroring
    foreach ($g in $Groups) {
        $dups = @($g.Names | Group-Object | Where-Object { $_.Count -gt 1 } | ForEach-Object { $_.Name })
        if ($dups.Count -gt 0) {
            Add-Finding 'FAIL' 'DuplicateInGroup' $g.GroupTag (Format-NameList $dups)
        }
    }
    $major = @('CL', 'CA', 'BB', 'BC', 'CV') | Where-Object { $byClass.ContainsKey($_) }
    for ($a = 0; $a -lt $major.Count; $a++) {
        for ($b = $a + 1; $b -lt $major.Count; $b++) {
            $ga = $byClass[$major[$a]]; $gb = $byClass[$major[$b]]
            $inter = @($ga.Names | Where-Object { $gb.Names -ccontains $_ } | Select-Object -Unique)
            if ($inter.Count -gt 0) {
                Add-Finding 'FAIL' 'CrossClass' "$($major[$a])/$($major[$b])" (Format-NameList $inter)
                if ("$($major[$a])/$($major[$b])" -eq 'BB/BC') {
                    $minCount = [Math]::Min($ga.Count, $gb.Count)
                    if ($minCount -gt 0 -and ($inter.Count / $minCount) -ge 0.3) {
                        Add-Finding 'FAIL' 'BBBCMirror' 'BB/BC' "$($inter.Count) of $minCount names shared; specialize BB vs BC doctrine"
                    }
                }
            }
        }
    }

    # 4. Prefix consistency and vanilla parity
    foreach ($g in $Groups) {
        if ($g.HasPrefix -and $g.Prefix -and -not $g.Prefix.EndsWith(' ')) {
            Add-Finding 'FAIL' 'PrefixSpace' $g.GroupTag "Prefix '$($g.Prefix)' lacks trailing space"
        }
    }
    $prefixCounts = @($Groups | Where-Object { $_.Prefix } | Group-Object Prefix | Sort-Object Count -Descending)
    $dominant = if ($prefixCounts.Count -gt 0) { $prefixCounts[0].Name } else { '' }
    if ($dominant) {
        $off = @($Groups | Where-Object { $_.Prefix -ne $dominant } | ForEach-Object { $_.GroupTag -replace "^$([regex]::Escape($Tag))_", '' })
        if ($off.Count -gt 0) {
            Add-Finding 'FAIL' 'PrefixInconsistent' '-' "Dominant prefix '$dominant' missing/different in: $(Format-NameList $off)"
        }
    } else {
        Add-Finding 'INFO' 'Prefix' '-' "No prefix defined in any group"
    }
    if ($null -ne $VanillaGroups) {
        $vPrefixes = @($VanillaGroups | Where-Object { $_.Prefix } | ForEach-Object { $_.Prefix } | Select-Object -Unique)
        $vText = if ($vPrefixes.Count -gt 0) { ($vPrefixes | ForEach-Object { "'$_'" }) -join ', ' } else { 'none' }
        if (($vPrefixes -join '|') -ne $dominant) {
            Add-Finding 'WARN' 'VanillaPrefix' '-' "Vanilla prefix $vText vs mod '$dominant'; keep parity or document why"
        }
    } else {
        Add-Finding 'INFO' 'VanillaPrefix' '-' "Vanilla parity skipped (HOI4 install or vanilla file not found)"
    }

    # 5. Fallback heuristics (review, not proof)
    $scandinavian = @('DEN', 'NOR', 'SWE', 'ICE')
    $englishFallbackTags = @('ENG', 'USA', 'AST', 'CAN', 'NZL', 'SAF', 'RAJ', 'PHI', 'IRE', 'LBA')
    foreach ($g in $Groups) {
        $fb = $g.Fallback
        if ($fb -eq 'N/A') {
            Add-Finding 'FAIL' 'Fallback' $g.GroupTag "No fallback_name"
            continue
        }
        if ($scandinavian -contains $Tag -and $g.Class -ne 'THEME' -and $fb -match '(en|et) %[ds]$') {
            Add-Finding 'WARN' 'FallbackDefinite' $g.GroupTag "'$fb' may use a definite suffix; use indefinite nominative"
        }
        if ($fb -match '\bLys\b') {
            Add-Finding 'WARN' 'FallbackCalque' $g.GroupTag "'$fb' uses optical 'Lys'; naval term is Let/Lett/Latt"
        }
        if ($englishFallbackTags -notcontains $Tag -and $fb -match '\b(Destroyer|Submarine|Cruiser|Battleship|Battlecruiser|Carrier)\b') {
            Add-Finding 'WARN' 'FallbackEnglish' $g.GroupTag "'$fb' uses an English hull term in a non-English list"
        }
    }

    # 6. Display names (literal names only; localisation keys are skipped)
    foreach ($g in $Groups) {
        if (-not $g.NameIsLiteral) { continue }
        $len = $g.ThemeName.Length
        if ($len -gt 32) {
            Add-Finding 'FAIL' 'DisplayName' $g.GroupTag "'$($g.ThemeName)' is $len chars (max 32)"
        } elseif ($len -gt 25) {
            Add-Finding 'WARN' 'DisplayName' $g.GroupTag "'$($g.ThemeName)' is $len chars (ideal <= 25)"
        }
    }

    # 7. Documentation sync
    if ($RepoDir) {
        $tagCell = "\|\s*``?" + [regex]::Escape($Tag) + "``?\s*\|"
        $country = $null
        $readmePath = Join-Path $RepoDir "README.md"
        $readme = if (Test-Path $readmePath) { [System.IO.File]::ReadAllText($readmePath, [System.Text.Encoding]::UTF8) } else { '' }
        $rowM = [regex]::Match($readme, $tagCell + "\s*([^|\r\n]+?)\s*\|")
        if ($rowM.Success) { $country = $rowM.Groups[1].Value.Trim() } else { Add-Finding 'FAIL' 'DocsReadme' '-' "README.md has no row for $Tag" }

        $guidePath = Join-Path $RepoDir "WORKSHOP_DESCRIPTION_GUIDELINES.md"
        $guide = if (Test-Path $guidePath) { [System.IO.File]::ReadAllText($guidePath, [System.Text.Encoding]::UTF8) } else { '' }
        if ($guide -notmatch $tagCell) { Add-Finding 'FAIL' 'DocsWorkshopTable' '-' "Workshop cross-reference table has no row for $Tag" }

        if ($country) {
            $blockM = [regex]::Match($guide, "(?m)^\[b\]" + [regex]::Escape($country) + "\[/b\][ \t]*\r?\n((?:-[^\r\n]*\r?\n?)*)")
            if (-not $blockM.Success) {
                Add-Finding 'FAIL' 'DocsWorkshopBlock' '-' "No [b]$country[/b] block under Included nations"
            } else {
                $bullets = @($blockM.Groups[1].Value -split '\r?\n' | Where-Object { $_ -match '^-' })
                if ($bullets.Count -ne 2 -or $bullets[0] -notmatch '^- Expanded' -or $bullets[1] -notmatch '^- Added') {
                    Add-Finding 'WARN' 'DocsWorkshopFormat' '-' "[b]$country[/b] block is not the 2-bullet 'Expanded... / Added...' format ($($bullets.Count) bullets)"
                }
            }

            $wikiDir = Join-Path $RepoDir "wiki"
            $pageName = $country -replace ' ', '-'
            $wikiPath = Join-Path $wikiDir "$pageName.md"
            if (-not (Test-Path $wikiPath)) {
                Add-Finding 'FAIL' 'DocsWikiPage' '-' "wiki/$pageName.md not found"
            } else {
                $wiki = [System.IO.File]::ReadAllText($wikiPath, [System.Text.Encoding]::UTF8)
                $missing = @($Groups | Where-Object { $wiki -notmatch "\b$([regex]::Escape($_.GroupTag))\b" } | ForEach-Object { $_.GroupTag })
                if ($missing.Count -gt 0) { Add-Finding 'WARN' 'DocsWikiGroups' '-' "Wiki page does not mention: $(Format-NameList $missing)" }
                $known = @($Groups | ForEach-Object { $_.GroupTag })
                $stale = @([regex]::Matches($wiki, "\b$([regex]::Escape($Tag))_[A-Z][A-Z_]*\b") | ForEach-Object { $_.Value } | Select-Object -Unique | Where-Object { $known -notcontains $_ -and $_ -ne "${Tag}_ship_names" })
                if ($stale.Count -gt 0) { Add-Finding 'WARN' 'DocsWikiStale' '-' "Wiki page mentions groups not in file: $(Format-NameList $stale)" }

                # Sample names in each group's table row (last cell) must still exist in that group;
                # a shortened form (e.g. surname "Armfelt" for "Carl Gustaf Armfelt") counts as present
                $byTag = @{}
                foreach ($g in $Groups) { $byTag[$g.GroupTag] = $g }
                $staleSamples = [System.Collections.Generic.List[string]]::new()
                foreach ($row in [regex]::Matches($wiki, "(?m)^\|\s*``($([regex]::Escape($Tag))_[A-Z_]+)``\s*\|([^\r\n]*)")) {
                    $g = $byTag[$row.Groups[1].Value]
                    if (-not $g) { continue }
                    $cells = @($row.Groups[2].Value -split '\|' | ForEach-Object { $_.Trim() } | Where-Object { $_ })
                    if ($cells.Count -lt 2 -or $cells[-1] -match '`') { continue }
                    foreach ($sample in ($cells[-1] -split ',')) {
                        $s = $sample.Trim().Trim('*', '_').Trim()
                        if (-not $s -or $s -match '^(etc\.?|\.\.\.|…)$') { continue }
                        $pattern = '(?<![\p{L}\p{N}])' + [regex]::Escape($s) + '(?![\p{L}\p{N}])'
                        if (-not @($g.Names | Where-Object { $_ -cmatch $pattern }).Count) {
                            $staleSamples.Add("$($g.GroupTag -replace "^$([regex]::Escape($Tag))_", ''): $s")
                        }
                    }
                }
                if ($staleSamples.Count -gt 0) { Add-Finding 'WARN' 'DocsWikiSamples' '-' "Wiki sample names not in their group: $(Format-NameList $staleSamples.ToArray())" }
            }

            $homePath = Join-Path $wikiDir "Home.md"
            $homeText = if (Test-Path $homePath) { [System.IO.File]::ReadAllText($homePath, [System.Text.Encoding]::UTF8) } else { '' }
            $homeM = [regex]::Match($homeText, $tagCell + "\s*(\d+)\s*\|")
            if ($homeText -notmatch $tagCell) {
                Add-Finding 'FAIL' 'DocsWikiHome' '-' "wiki/Home.md has no row for $Tag"
            } elseif ($homeM.Success -and [int]$homeM.Groups[1].Value -ne $Groups.Count) {
                Add-Finding 'WARN' 'DocsWikiHome' '-' "wiki/Home.md lists $($homeM.Groups[1].Value) groups; file has $($Groups.Count)"
            }
            $sidebarPath = Join-Path $wikiDir "_Sidebar.md"
            $sidebar = if (Test-Path $sidebarPath) { [System.IO.File]::ReadAllText($sidebarPath, [System.Text.Encoding]::UTF8) } else { '' }
            if ($sidebar -notmatch "\($([regex]::Escape($pageName))\)") { Add-Finding 'FAIL' 'DocsWikiSidebar' '-' "wiki/_Sidebar.md has no link to $pageName" }

            $plansDir = Join-Path $RepoDir "docs\superpowers\plans"
            $slug = $country.ToLower() -replace ' ', '-'
            $plans = if (Test-Path $plansDir) { @(Get-ChildItem -Path $plansDir -Filter "*-$slug-*.md") } else { @() }
            if ($plans.Count -eq 0) { Add-Finding 'INFO' 'PlanFile' '-' "No docs/superpowers/plans/*-$slug-*.md (write an audit plan before review)" }
        }
    }

    return , $findings.ToArray()
}

# --- Action: Audit a mod ship namelist ---
function Invoke-NamelistAudit {
    param(
        [string]$Tag,
        [string]$TargetGroup,
        [string]$CustomHoi4Dir,
        [switch]$NamesOnly
    )

    $Tag = $Tag.ToUpper().Trim()
    $modFile = Join-Path $RepoDir "common\units\names_ships\${Tag}_ship_names.txt"
    if (-not (Test-Path $modFile)) {
        Write-Err "Mod namelist not found: $modFile"
        exit 1
    }

    $groups = Get-NamelistGroups -Path $modFile

    if ($TargetGroup -or $NamesOnly) {
        $selected = $groups
        if ($TargetGroup) {
            $wanted = @($TargetGroup -split ',' | ForEach-Object { $_.Trim().ToUpper() } | Where-Object { $_ })
            $missing = @($wanted | Where-Object { $w = $_; -not ($groups | Where-Object { $_.GroupTag -eq $w -or $_.GroupTag -eq "${Tag}_$w" }) })
            if ($missing.Count -gt 0) {
                Write-Err "Group(s) not found: $($missing -join ', '). Groups: $(($groups | ForEach-Object { $_.GroupTag }) -join ', ')"
            }
            $selected = @($groups | Where-Object { $wanted -contains $_.GroupTag -or $wanted -contains ($_.GroupTag -replace "^${Tag}_", '') })
        }
        foreach ($g in $selected) {
            if ($NamesOnly) {
                $label = if ($g.NameIsLiteral) { " `"$($g.ThemeName)`"" } else { '' }
                Write-Host "$($g.GroupTag) ($($g.Count))${label}: $($g.Names -join '; ')"
            } else {
                Write-Host "$($g.GroupTag) ($($g.Count) names)" -ForegroundColor Green
                Write-Host $g.RawBlock
            }
        }
        return
    }

    $vanillaGroups = $null
    $hoi4Dir = Find-Hoi4Install -CustomPath $CustomHoi4Dir
    if ($hoi4Dir) {
        foreach ($c in @("${Tag}_ship_names.txt", "${Tag}_names_ships.txt")) {
            $vp = Join-Path $hoi4Dir "common\units\names_ships\$c"
            if (Test-Path $vp) { $vanillaGroups = Get-NamelistGroups -Path $vp; break }
        }
    }

    $findings = Get-NamelistAuditFindings -Groups $groups -Tag $Tag -RepoDir $RepoDir -VanillaGroups $vanillaGroups

    Write-Host "ISNE audit: ${Tag}_ship_names.txt ($($groups.Count) groups)" -ForegroundColor Cyan
    $table = $groups | Select-Object @{ n = 'Group'; e = { $_.GroupTag -replace "^${Tag}_", '' } }, Class,
        @{ n = 'Count'; e = { "$($_.Count)/$($_.Target)" } }, Prefix, Fallback,
        @{ n = 'Name'; e = { if ($_.NameIsLiteral) { $_.ThemeName } else { '(loc key)' } } }
    Write-Host (($table | Format-Table -AutoSize | Out-String -Width 220).Trim())

    $order = @{ FAIL = 0; WARN = 1; INFO = 2 }
    Write-Host ""
    foreach ($f in ($findings | Sort-Object { $order[$_.Severity] }, Check)) {
        $color = switch ($f.Severity) { 'FAIL' { 'Red' } 'WARN' { 'Yellow' } default { 'Gray' } }
        $grp = $f.Group -replace "^${Tag}_", ''
        Write-Host "[$($f.Severity)] $($f.Check) $grp : $($f.Detail)" -ForegroundColor $color
    }
    $fails = @($findings | Where-Object { $_.Severity -eq 'FAIL' }).Count
    $warns = @($findings | Where-Object { $_.Severity -eq 'WARN' }).Count
    $infos = @($findings | Where-Object { $_.Severity -eq 'INFO' }).Count
    Write-Host "`nAUDIT SUMMARY ${Tag}: FAIL=$fails WARN=$warns INFO=$infos"
}

# --- Action: Inspect Vanilla Ship Namelists ---
function Invoke-InspectVanilla {
    param(
        [string]$Tag,
        [string]$TargetGroup,
        [string]$CustomHoi4Dir
    )

    $hoi4Dir = Find-Hoi4Install -CustomPath $CustomHoi4Dir
    if (-not $hoi4Dir) {
        Write-Err "Could not locate Hearts of Iron IV game installation directory."
        Write-Info "Specify the path using -Hoi4InstallDir '<path>'."
        exit 1
    }

    $Tag = $Tag.ToUpper().Trim()
    $candidates = @(
        (Join-Path $hoi4Dir "common\units\names_ships\${Tag}_ship_names.txt"),
        (Join-Path $hoi4Dir "common\units\names_ships\${Tag}_names_ships.txt")
    )

    $targetFile = $null
    foreach ($c in $candidates) {
        if (Test-Path $c) { $targetFile = $c; break }
    }

    if (-not $targetFile) {
        Write-Err "Vanilla ship namelist file not found for tag $Tag in: $(Join-Path $hoi4Dir 'common\units\names_ships')"
        exit 1
    }

    Write-Step "Inspecting vanilla ship namelists in: $targetFile"

    $groups = Get-NamelistGroups -Path $targetFile

    if ($TargetGroup) {
        $found = $groups | Where-Object { $_.GroupTag -eq $TargetGroup }
        if ($found) {
            Write-Host "`nGroup Details: $($found.GroupTag)" -ForegroundColor Green
            Write-Host "--------------------------------------------------------" -ForegroundColor Cyan
            Write-Host $found.RawBlock
        } else {
            Write-Err "Group '$TargetGroup' not found in vanilla file."
        }
    } else {
        Write-Host "`nFound $($groups.Count) ship name groups in vanilla for ${Tag}:" -ForegroundColor Green
        $groups | Select-Object GroupTag, ShipTypes, Prefix, Count, SampleNames | Format-Table -AutoSize
    }
}

# --- Action: InspectVanilla ---
if ($InspectVanilla) {
    Invoke-InspectVanilla -Tag $InspectVanilla -TargetGroup $Group -CustomHoi4Dir $Hoi4InstallDir
    $stopwatch.Stop()
    Write-Info "Completed in $($stopwatch.Elapsed.TotalSeconds.ToString('0.00'))s"
    exit 0
}

# --- Action: Audit ---
if ($Audit) {
    Invoke-NamelistAudit -Tag $Audit -TargetGroup $Group -CustomHoi4Dir $Hoi4InstallDir -NamesOnly:$NamesOnly
    exit 0
}

# --- Action: InstallSteamCmd ---
if ($InstallSteamCmd) {
    $installed = Install-SteamCmd
    Write-Host "`nSteamCMD is ready to use at: $installed" -ForegroundColor Green
    $stopwatch.Stop()
    exit 0
}

# --- Determine Actions ---
$shouldValidate = $Validate -or (-not $NoValidate -and -not $Clean -and -not $InspectVanilla -and -not $Audit -and -not $Test)
if ($ValidateOnly) {
    $ok = Invoke-Validation
    $stopwatch.Stop()
    if ($ok) {
        Write-Host "`nValidation succeeded in $($stopwatch.Elapsed.TotalSeconds.ToString('0.00'))s" -ForegroundColor Green
        exit 0
    } else {
        Write-Host "`nValidation failed!" -ForegroundColor Red
        exit 1
    }
}

# --- Action: Test ---
if ($Test) {
    $testRunner = Join-Path $RepoDir "tests\Run-Tests.ps1"
    if (-not (Test-Path $testRunner)) {
        Write-Err "Test runner not found at: $testRunner"
        exit 1
    }
    & $testRunner
    $rc = $LASTEXITCODE
    $stopwatch.Stop()
    exit $rc
}

# Validate first unless skipped
if ($shouldValidate) {
    $valid = Invoke-Validation
    if (-not $valid) {
        Write-Err "Pre-flight validation failed. Aborting."
        exit 1
    }
}

# --- Action: Clean ---
if ($Clean) {
    Write-Step "Cleaning build artifacts and deployed mod..."
    $deployedFolder = Join-Path $ModDir $ModName
    $deployedModFile = Join-Path $ModDir "$ModName.mod"
    $artifactsDir = Join-Path $RepoDir "artifacts"
    $zipFile = Join-Path $artifactsDir "isne.zip"
    $legacyZipFile = Join-Path $RepoDir "isne.zip"
    $localModFile = Join-Path $RepoDir "$ModName.mod"

    if (Test-Path $deployedFolder) {
        Remove-Item -Recurse -Force $deployedFolder
        Write-Ok "Removed deployed folder: $deployedFolder"
    }
    if (Test-Path $deployedModFile) {
        Remove-Item -Force $deployedModFile
        Write-Ok "Removed deployed mod file: $deployedModFile"
    }
    if (Test-Path $zipFile) {
        Remove-Item -Force $zipFile
        Write-Ok "Removed archive: $zipFile"
    }
    if (Test-Path $legacyZipFile) {
        Remove-Item -Force $legacyZipFile
        Write-Ok "Removed archive: $legacyZipFile"
    }
    if (Test-Path $localModFile) {
        Remove-Item -Force $localModFile
        Write-Ok "Removed workspace descriptor: $localModFile"
    }

    Write-Host "`nClean complete." -ForegroundColor Green
    exit 0
}

# --- Action: DevLink Mode ---
if ($DevLink) {
    Write-Step "Configuring DevLink (Zero-Copy Live Development)..."

    if (-not (Test-Path $ModDir)) {
        New-Item -ItemType Directory -Path $ModDir -Force | Out-Null
    }

    $targetDir = Join-Path $ModDir $ModName
    if (Test-Path $targetDir) {
        Write-Warn "A physical deployed folder exists at: $targetDir"
        Write-Warn "Removing or renaming it is recommended so the launcher doesn't conflict with DevLink."
    }

    $launcherModContent = New-LauncherModContent -DescriptorPath $DescriptorPath -TargetModPath $RepoDir
    $targetModFile = Join-Path $ModDir "$ModName.mod"
    [System.IO.File]::WriteAllText($targetModFile, $launcherModContent, [System.Text.UTF8Encoding]::new($false))

    $localModFile = Join-Path $RepoDir "$ModName.mod"
    [System.IO.File]::WriteAllText($localModFile, $launcherModContent, [System.Text.UTF8Encoding]::new($false))

    Write-Ok "Created launcher file: $targetModFile"
    Write-Ok "Path points directly to: $RepoDir"
    Write-Host "`n[DevLink Active] Edits in your workspace will be reflected immediately in Hearts of Iron IV without copying!" -ForegroundColor Green
    $stopwatch.Stop()
    Write-Info "Completed in $($stopwatch.Elapsed.TotalSeconds.ToString('0.00'))s"
    exit 0
}

# --- Action: Package (ZIP) ---
if ($Package) {
    Write-Step "Packaging mod into clean release ZIP..."

    $meta = Get-ModMetadata -Path $DescriptorPath
    $artifactsDir = Join-Path $RepoDir "artifacts"
    if (-not (Test-Path $artifactsDir)) { New-Item -ItemType Directory -Path $artifactsDir -Force | Out-Null }
    $zipFile = if ($ZipOutput) { $ZipOutput } else { Join-Path $artifactsDir "isne.zip" }
    if (-not [System.IO.Path]::IsPathRooted($zipFile)) {
        $zipFile = Join-Path $RepoDir $zipFile
    }

    # Create a clean temporary staging directory
    $tempStageDir = Join-Path ([System.IO.Path]::GetTempPath()) ("isne_stage_" + [System.Guid]::NewGuid().ToString("N"))
    $stageModDir = Join-Path $tempStageDir $ModName
    New-Item -ItemType Directory -Path $stageModDir -Force | Out-Null

    try {
        # Copy only actual mod files to staging
        $excludeDirs = @('.git', '.github', '.vscode', '.agents', '.agent', '.claude', 'tests', 'wiki', 'assets', 'artifacts', 'scratch', 'Files')
        $excludeFiles = @('*.bat', '*.ps1', '*.zip', '*.md', '.gitignore', '.gitattributes', '.steam_username')
        & robocopy.exe $RepoDir $stageModDir /MIR /XD $excludeDirs /XF $excludeFiles /R:1 /W:1 /NDL /NP /NFL | Out-Null

        # Also place the launcher .mod file in staging root
        $modFileContent = New-LauncherModContent -DescriptorPath $DescriptorPath -TargetModPath "mod/$ModName"
        $stageModFile = Join-Path $tempStageDir "$ModName.mod"
        [System.IO.File]::WriteAllText($stageModFile, $modFileContent, [System.Text.UTF8Encoding]::new($false))

        # Delete existing zip if present
        if (Test-Path $zipFile) {
            Remove-Item -Force $zipFile
        }

        # Build zip using .NET ZipFile
        [System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
        [System.IO.Compression.ZipFile]::CreateFromDirectory($tempStageDir, $zipFile, [System.IO.Compression.CompressionLevel]::Optimal, $false)

        $zipItem = Get-Item $zipFile
        $sizeKb = [math]::Round($zipItem.Length / 1KB, 1)
        Write-Ok "Created package: $zipFile ($sizeKb KB)"
        Write-Ok "Strictly excluded: .git, build scripts, markdown guidelines, wiki, and temp files."

        Write-Host "`nSuccessfully packaged '$($meta.Name)' v$($meta.Version)!" -ForegroundColor Green
    }
    finally {
        if (Test-Path $tempStageDir) {
            Remove-Item -Recurse -Force $tempStageDir
        }
    }

    $stopwatch.Stop()
    Write-Info "Completed in $($stopwatch.Elapsed.TotalSeconds.ToString('0.00'))s"
    exit 0
}

# --- Action: Publish to Steam Workshop ---
if ($PublishSteam) {
    Write-Step "Preparing Steam Workshop publication..."

    $meta = Get-ModMetadata -Path $DescriptorPath
    $remoteFileId = $meta.RemoteFileId
    if (-not $remoteFileId) {
        Write-Err "descriptor.mod does not have a 'remote_file_id'. Cannot update Steam Workshop item."
        Write-Info "For the first upload of a new mod, use the Paradox Launcher or create an initial item."
        exit 1
    }

    # Locate SteamCMD
    $steamCmdExe = Find-SteamCmd -CustomPath $SteamCmdPath
    if (-not $steamCmdExe) {
        Write-Warn "SteamCMD was not found on your system."
        if ($DryRun) {
            Write-Info "[DryRun] Simulating SteamCMD execution..."
            $steamCmdExe = "steamcmd.exe"
        } else {
            Write-Info "Attempting automatic SteamCMD download..."
            try {
                $steamCmdExe = Install-SteamCmd
            } catch {
                Write-Err "Could not automatically install SteamCMD: $_"
                Write-Info "Please run 'winget install Valve.SteamCMD' or download from Valve."
                exit 1
            }
        }
    } else {
        Write-Ok "Found SteamCMD: $steamCmdExe"
    }

    # Resolve Steam Username
    $steamUserFile = Join-Path $RepoDir ".steam_username"
    if (-not $SteamUser) {
        if ($env:STEAM_USERNAME) {
            $SteamUser = $env:STEAM_USERNAME
        } elseif (Test-Path $steamUserFile) {
            $SteamUser = (Get-Content $steamUserFile -Raw).Trim()
        }
    }

    if (-not $SteamUser) {
        if ($DryRun) {
            $SteamUser = "<steam_username>"
        } else {
            $SteamUser = (Read-Host "Enter your Steam username (owner of workshop item $remoteFileId)").Trim()
            if ($SteamUser) {
                [System.IO.File]::WriteAllText($steamUserFile, $SteamUser, [System.Text.UTF8Encoding]::new($false))
                Write-Info "Saved Steam username to '$steamUserFile' for future runs."
            } else {
                Write-Err "Steam username is required for publishing."
                exit 1
            }
        }
    }

    # Resolve changenote
    if (-not $ChangeNote) {
        $gitCommit = (& git -C $RepoDir log -1 --pretty=%B 2>$null)
        if ($gitCommit) {
            $ChangeNote = ($gitCommit.Trim() -split "`r?`n")[0]
            Write-Info "Using latest git commit message as changenote: '$ChangeNote'"
        } else {
            $ChangeNote = "Updated ship namelists"
        }
    } else {
        Write-Info "Using specified changenote: '$ChangeNote'"
    }

    # Clean staging for workshop upload
    $tempStage = Join-Path ([System.IO.Path]::GetTempPath()) ("isne_workshop_" + [System.Guid]::NewGuid().ToString("N"))
    $stageContent = Join-Path $tempStage "content"
    New-Item -ItemType Directory -Path $stageContent -Force | Out-Null

    try {
        $excludeDirs = @('.git', '.github', '.vscode', '.agents', '.agent', '.claude', 'tests', 'wiki', 'assets', 'artifacts', 'scratch', 'Files')
        $excludeFiles = @('*.bat', '*.ps1', '*.zip', '*.md', '.gitignore', '.gitattributes', '.steam_username')
        & robocopy.exe $RepoDir $stageContent /MIR /XD $excludeDirs /XF $excludeFiles /R:1 /W:1 /NDL /NP /NFL | Out-Null

        $previewPath = Join-Path $stageContent "thumbnail.png"
        if (-not (Test-Path $previewPath)) {
            Write-Warn "thumbnail.png is missing from staging directory!"
        }

        $contentEscaped = $stageContent -replace '\\', '\\'
        $previewEscaped = $previewPath -replace '\\', '\\'
        $titleEscaped   = $meta.Name -replace '"', '\"'
        $noteEscaped    = $ChangeNote -replace '"', '\"'

        $vdfContent = @"
"workshopitem"
{
    "appid" "394360"
    "publishedfileid" "$remoteFileId"
    "contentfolder" "$contentEscaped"
    "previewfile" "$previewEscaped"
    "visibility" "0"
    "title" "$titleEscaped"
    "changenote" "$noteEscaped"
}
"@
        $vdfPath = Join-Path $tempStage "workshop_build.vdf"
        [System.IO.File]::WriteAllText($vdfPath, $vdfContent, [System.Text.UTF8Encoding]::new($false))
        Write-Ok "Generated Steam Workshop VDF: $vdfPath"

        if ($DryRun) {
            Write-Step "[DryRun] Steam Workshop VDF Preview:"
            Write-Host $vdfContent -ForegroundColor Yellow
            Write-Step "[DryRun] Staged files for upload:"
            Get-ChildItem -Path $stageContent -Recurse -File | ForEach-Object {
                Write-Host "  $($_.FullName.Substring($stageContent.Length + 1))" -ForegroundColor Gray
            }
            Write-Step "[DryRun] Command that would execute:"
            Write-Host "& `"$steamCmdExe`" +login $SteamUser +workshop_build_item `"$vdfPath`" +quit" -ForegroundColor Cyan
            Write-Host "`nDry run complete. No files were uploaded." -ForegroundColor Green
            $stopwatch.Stop()
            exit 0
        }

        # Execute SteamCMD
        Write-Step "Executing SteamCMD upload..."
        Write-Info "If this is your first time logging in via SteamCMD, enter your Steam Guard code when prompted."
        & $steamCmdExe +login $SteamUser +workshop_build_item "$vdfPath" +quit
        $rc = $LASTEXITCODE

        if ($rc -eq 0) {
            Write-Host "`nSuccessfully published update to Steam Workshop!" -ForegroundColor Green
            Write-Host "Workshop URL: https://steamcommunity.com/sharedfiles/filedetails/?id=$remoteFileId" -ForegroundColor Cyan
        } else {
            Write-Err "SteamCMD upload failed with exit code $rc."
            exit $rc
        }
    }
    finally {
        if (Test-Path $tempStage) {
            Remove-Item -Recurse -Force $tempStage
        }
    }

    $stopwatch.Stop()
    Write-Info "Completed in $($stopwatch.Elapsed.TotalSeconds.ToString('0.00'))s"
    exit 0
}

# --- Action: Deploy (Default) ---
Write-Step "Deploying mod to Hearts of Iron IV..."

if (-not (Test-Path $ModDir)) {
    New-Item -ItemType Directory -Path $ModDir -Force | Out-Null
    Write-Info "Created mod directory: $ModDir"
}

$targetDir = Join-Path $ModDir $ModName
if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
}

$excludeDirs = @('.git', '.github', '.vscode', '.agents', '.agent', '.claude', 'tests', 'wiki', 'assets', 'artifacts', 'scratch', 'Files')
$excludeFiles = @('*.bat', '*.ps1', '*.zip', '*.md', '.gitignore', '.gitattributes', '.steam_username')

Write-Info "Synchronizing files using robocopy (purging stale files, excluding .git & dev folders)..."
& robocopy.exe $RepoDir $targetDir /MIR /XD $excludeDirs /XF $excludeFiles /R:1 /W:1 /NDL /NP /NFL | Out-Null
$rc = $LASTEXITCODE

if ($rc -ge 8) {
    Write-Err "Robocopy failed with exit code $rc."
    exit $rc
}

# Clean any accidental dev or documentation folders in target
$staleDirs = @('.git', '.github', '.vscode', '.agents', '.agent', '.claude', 'tests', 'wiki', 'assets', 'artifacts', 'scratch', 'Files')
foreach ($dir in $staleDirs) {
    $stalePath = Join-Path $targetDir $dir
    if (Test-Path $stalePath) {
        Remove-Item -Recurse -Force $stalePath
        Write-Info "Cleaned stale $dir folder from deployed destination."
    }
}

# Clean documentation and script files that shouldn't be in the mod folder
Get-ChildItem -Path $targetDir -Filter *.md -File -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
Get-ChildItem -Path $targetDir -Filter *.bat -File -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
Get-ChildItem -Path $targetDir -Filter *.ps1 -File -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue

Write-Ok "Files synchronized to: $targetDir"

# Auto-generate / synchronize the launcher .mod file in HOI4 mod directory
$launcherModContent = New-LauncherModContent -DescriptorPath $DescriptorPath -TargetModPath $targetDir
$targetModFile = Join-Path $ModDir "$ModName.mod"
[System.IO.File]::WriteAllText($targetModFile, $launcherModContent, [System.Text.UTF8Encoding]::new($false))
Write-Ok "Synchronized launcher descriptor: $targetModFile"

# Also keep the local .mod file in the dev folder updated
$localModFile = Join-Path $RepoDir "$ModName.mod"
[System.IO.File]::WriteAllText($localModFile, $launcherModContent, [System.Text.UTF8Encoding]::new($false))
Write-Ok "Synchronized workspace descriptor: $localModFile"

$meta = Get-ModMetadata -Path $DescriptorPath
Write-Host "`nSuccessfully deployed '$($meta.Name)' (v$($meta.Version) for HOI4 $($meta.SupportedVersion))!" -ForegroundColor Green
$stopwatch.Stop()
Write-Info "Completed in $($stopwatch.Elapsed.TotalSeconds.ToString('0.00'))s"
exit 0
