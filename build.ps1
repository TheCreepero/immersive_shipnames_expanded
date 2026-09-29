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

.PARAMETER VerifyShipTypes
    Verify every group's ship_types against data/ship_types_canon.json (e.g. -VerifyShipTypes FIN, or -VerifyShipTypes ALL).
    Prints a single "ship_types OK" line when clean, otherwise one "FAIL/WARN <group> <check> <detail>" line per deviation. Exit code 1 on any FAIL.

.PARAMETER SyncShipTypeCanon
    Scan vanilla names_ships, print the observed ship_types sets per class, and diff them against data/ship_types_canon.json.
    Run after a Hearts of Iron IV patch. Add -Write to refresh the canon's token list and metadata (class rules are curated by hand).

.PARAMETER Write
    With -SyncShipTypeCanon: rewrite data/ship_types_canon.json (tokens and meta only).

.PARAMETER Group
    Optional specific ship namelist group tag to excerpt directly when using -InspectVanilla or -Audit (e.g. -Group FIN_DD_HISTORICAL).
    With -Audit, accepts a comma-separated list, and the TAG_ prefix may be omitted (e.g. -Group RULERS,HEROES,CV_HISTORICAL).
    With -EditNames (required): the single group to edit; the TAG_ prefix may be omitted.

.PARAMETER NamesOnly
    With -Audit: print one compact line per group (tag, count, display name, names separated by "; ") instead of raw blocks.
    Combine with -Group to limit output to the listed groups; without -Group, prints every group and skips the report.

.PARAMETER EditNames
    Edit one group of a mod namelist in place without opening the file (e.g. -EditNames SWE -Group CA_HISTORICAL -Remove "Rolf Krake").
    Lists use "; " separators, as printed by -NamesOnly. Each operation must match exactly once; the edit is refused on any
    miss, duplicate or emptied block. Prints the group's -NamesOnly line afterwards. Only unique = { } blocks are supported.

.PARAMETER Add
    With -EditNames: names to add ("A; B"). Appended on a new line at the end of the unique block, or after -After.

.PARAMETER Remove
    With -EditNames: names to remove ("A; B").

.PARAMETER Rename
    With -EditNames: in-place renames as "Old=New; Old2=New2" (keeps the entry's position).

.PARAMETER After
    With -EditNames -Add: insert the added names directly after this existing name instead of at the block end.

.PARAMETER DiffNames
    Name-level diff of a mod namelist against a git revision (e.g. -DiffNames CHL): one line per changed group with
    added (+) and removed (-) names, display name / prefix / fallback / ship_types changes, names moved between groups,
    and the unchanged groups. Far smaller than a line diff; use it for plan change tables and reviews.

.PARAMETER Base
    With -DiffNames or -AuditPlan: git revision to compare the working-tree file against (default HEAD).

.PARAMETER Sections
    With -Audit -NamesOnly: show each group's comment headers inline ("[Header] A; B [Header2] C"), so section
    placement can be planned without opening the file.

.PARAMETER Section
    With -EditNames -Add: add the names at the end of the section under this comment header (text after '#');
    the header is created at the block end if missing. Headers an edit leaves empty are dropped automatically.

.PARAMETER RenameSection
    With -EditNames: rename comment headers in place ("Old header=New header; ...").

.PARAMETER Quiet
    With -EditNames: print only the summary line (count and dropped sections), not the group's names.

.PARAMETER AuditPlan
    Create docs/superpowers/plans/<today>-<country>-audit.md (e.g. -AuditPlan CHL): the initial -Audit report, TODO
    sections to fill, and a per-group change table generated from -DiffNames between markers. Run again to refresh
    the table; the rest of the plan is left untouched. -Audit reports unfilled TODOs as PlanTodo.

.PARAMETER SyncWiki
    Sync wiki/<Country>.md group rows with the namelist (literal display names; sample cells keep valid samples,
    expand an unambiguous short form to its full entry, drop stale ones and top up from the group) and the TAG's
    group count in wiki/Home.md (e.g. -SyncWiki CHL). Lists groups without a row, rows without a group, and prose
    lines that mention names removed or moved since HEAD; prose, README and the Workshop block stay manual.

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
    .\build.ps1 -EditNames SWE -Group CA_HISTORICAL -Remove "Rolf Krake; Birger Jarl" -Rename "Gustav V=Gustaf V" -Add "Garmer; Fenris" -After "Loke"
    # Edits one group in place and prints its updated names line.

.EXAMPLE
    .\build.ps1 -DiffNames CHL
    # Lists added, removed and moved names per group versus HEAD (compact input for plan change tables and reviews).

.EXAMPLE
    .\build.ps1 -EditNames CHL -Group BC -Add "Chipana; Islay" -Section "Naval Engagements" -Quiet
    # Adds under an existing (or new) comment header; empty headers left behind by removals are dropped.

.EXAMPLE
    .\build.ps1 -AuditPlan CHL
    # Creates the audit plan skeleton, or refreshes its generated change table.

.EXAMPLE
    .\build.ps1 -SyncWiki CHL
    # Refreshes wiki display names, sample cells and the Home.md group count.

.EXAMPLE
    .\build.ps1 -VerifyShipTypes ALL
    # Checks ship_types of every mod namelist against the vanilla-derived canon.

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

    [Parameter(ParameterSetName = 'VerifyShipTypes', Mandatory = $true)]
    [string]$VerifyShipTypes,

    [Parameter(ParameterSetName = 'SyncShipTypeCanon', Mandatory = $true)]
    [switch]$SyncShipTypeCanon,

    [Parameter(ParameterSetName = 'SyncShipTypeCanon')]
    [switch]$Write,

    [Parameter(ParameterSetName = 'EditNames', Mandatory = $true)]
    [string]$EditNames,

    [Parameter(ParameterSetName = 'InspectVanilla')]
    [Parameter(ParameterSetName = 'Audit')]
    [Parameter(ParameterSetName = 'EditNames', Mandatory = $true)]
    [string]$Group,

    [Parameter(ParameterSetName = 'Audit')]
    [switch]$NamesOnly,

    [Parameter(ParameterSetName = 'Audit')]
    [switch]$Sections,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$Add,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$Remove,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$Rename,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$After,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$Section,

    [Parameter(ParameterSetName = 'EditNames')]
    [string]$RenameSection,

    [Parameter(ParameterSetName = 'EditNames')]
    [switch]$Quiet,

    [Parameter(ParameterSetName = 'DiffNames', Mandatory = $true)]
    [string]$DiffNames,

    [Parameter(ParameterSetName = 'AuditPlan', Mandatory = $true)]
    [string]$AuditPlan,

    [Parameter(ParameterSetName = 'SyncWiki', Mandatory = $true)]
    [string]$SyncWiki,

    [Parameter(ParameterSetName = 'DiffNames')]
    [Parameter(ParameterSetName = 'AuditPlan')]
    [string]$Base = 'HEAD',

    [Parameter(ParameterSetName = 'InspectVanilla')]
    [Parameter(ParameterSetName = 'Audit')]
    [Parameter(ParameterSetName = 'AuditPlan')]
    [Parameter(ParameterSetName = 'SyncShipTypeCanon')]
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

# --- Helper: Copy only shipped mod content (whitelist) ---
# Only these paths are part of the mod. Anything else in the repo (docs, wiki, tests,
# agent configs, scripts, launcher .mod, ...) is never copied, and is purged from the destination.
$ModContentDirs  = @('common')
$ModContentFiles = @('descriptor.mod', 'thumbnail.png')

function Copy-ModContent {
    param([string]$Source, [string]$Destination)

    if (-not (Test-Path $Destination)) { New-Item -ItemType Directory -Path $Destination -Force | Out-Null }

    foreach ($dir in $ModContentDirs) {
        $src = Join-Path $Source $dir
        if (-not (Test-Path $src)) { continue }
        & robocopy.exe $src (Join-Path $Destination $dir) /MIR /R:1 /W:1 /NDL /NP /NFL | Out-Null
        if ($LASTEXITCODE -ge 8) { Write-Err "Robocopy failed for '$dir' with exit code $LASTEXITCODE."; exit $LASTEXITCODE }
    }
    foreach ($file in $ModContentFiles) {
        $src = Join-Path $Source $file
        if (Test-Path $src) { Copy-Item -Path $src -Destination (Join-Path $Destination $file) -Force }
    }

    $keep = @($ModContentDirs) + @($ModContentFiles)
    Get-ChildItem -Path $Destination -Force | Where-Object { $keep -notcontains $_.Name } | ForEach-Object {
        Remove-Item -Recurse -Force $_.FullName
        Write-Info "Removed non-mod item from destination: $($_.Name)"
    }
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

# --- Helper: Load the vanilla-derived ship_types canon ---
$ShipTypeCanonPath = Join-Path $RepoDir "data\ship_types_canon.json"

function Get-ShipTypeCanon {
    param([string]$Path = $ShipTypeCanonPath)

    if (-not (Test-Path $Path)) { return $null }
    return [System.IO.File]::ReadAllText($Path, [System.Text.Encoding]::UTF8) | ConvertFrom-Json
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

    $canon = Get-ShipTypeCanon
    if (-not $canon) {
        Write-Err "ship_types canon not found: $ShipTypeCanonPath (regenerate with -SyncShipTypeCanon -Write)"
        $hasErrors = $true
    }
    $validShipTypes = if ($canon) { @($canon.tokens) } else { @() }
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

# --- Helper: Tag suffixes of role-specific pools (see authoring skill section 2C) ---
# Role pools are universal (no ship_types) pools for roles without a vanilla ship_types token.
# Add a suffix here when a nation's research surfaces a new role series.
function Get-RolePoolSuffixes {
    return @(
        'MINELAYERS', 'MINESWEEPERS',
        'ESCORT_CARRIERS', 'ESCORT_DESTROYERS', 'CORVETTES', 'FRIGATES', 'SLOOPS', 'AVISOS', 'PATROL_VESSELS',
        'SCOUT_CRUISERS', 'FLOTILLA_LEADERS', 'TORPEDO_BOATS', 'FAST_ATTACK_CRAFT',
        'COASTAL_DEFENSE', 'MONITORS', 'GUNBOATS',
        'FAST_BATTLESHIPS', 'LARGE_CRUISERS', 'ARMORED_CRUISERS', 'LIGHT_CARRIERS',
        'SEAPLANE_TENDERS',
        'CRUISER_SUBMARINES', 'COASTAL_SUBMARINES', 'MINELAYING_SUBMARINES',
        'AUXILIARY_CRUISERS', 'TRAINING_SHIPS', 'ICEBREAKERS', 'SUBMARINE_TENDERS', 'STATE_YACHTS'
    )
}

# --- Helper: Spelling-insensitive comparison key for a ship name ---
# Folds case, diacritics, spacing/punctuation, doubled letters and common orthographic variants
# (Gustav/Gustaf, Wasa/Vasa, Carl/Karl, Thor/Tor, y/i, ae/a), so "Gotalejon" matches "Gota Lejon".
# Exonyms (Scania/Skane) are out of scope. Kept ASCII-only for Windows PowerShell 5.1.
function Get-NameVariantKey {
    param([string]$Name)
    $s = $Name.ToLowerInvariant()
    $map = @{ 0x00E6 = 'ae'; 0x00F8 = 'o'; 0x0153 = 'oe'; 0x00DF = 'ss'; 0x0142 = 'l'; 0x0111 = 'd'; 0x00F0 = 'd'; 0x00FE = 'th'; 0x0131 = 'i' }
    foreach ($code in $map.Keys) { $s = $s.Replace([string][char]$code, $map[$code]) }
    $s = [regex]::Replace($s.Normalize([System.Text.NormalizationForm]::FormD), '\p{Mn}', '')
    # Regnal numerals become digits first, so letter folding below cannot merge "Oscar I" with "Oscar II"
    $s = [regex]::Replace($s, '\b[ivx]+\b', [System.Text.RegularExpressions.MatchEvaluator] {
        param($m)
        if ($m.Value -notmatch '^x{0,3}(ix|iv|v?i{0,3})$') { return $m.Value }
        $total = 0; $prev = 0
        $vals = @{ [char]'i' = 1; [char]'v' = 5; [char]'x' = 10 }
        $chars = $m.Value.ToCharArray()
        for ($k = $chars.Count - 1; $k -ge 0; $k--) {
            $v = $vals[$chars[$k]]
            if ($v -lt $prev) { $total -= $v } else { $total += $v; $prev = $v }
        }
        return [string]$total
    })
    $s = $s -replace '[fv]\b', 'f'
    $s = $s -replace '[^a-z0-9]', ''
    $s = $s -replace 'ph', 'f' -replace 'th', 't' -replace 'w', 'v' -replace 'ck', 'k' -replace '[cq]', 'k' -replace 'z', 's' -replace 'y', 'i'
    $s = $s -replace 'ae', 'a' -replace 'oe', 'o' -replace 'ue', 'u'
    $s = $s -replace '([a-z])\1+', '$1'
    return $s
}

# --- Helper: Resolve a group name given as full tag, tag without the TAG_ prefix, or hull shorthand (CL) ---
function Resolve-GroupTag {
    param(
        [string]$Tag,
        [string]$Name,
        [string[]]$Known
    )
    $n = $Name.Trim().ToUpper()
    foreach ($candidate in @($n, "${Tag}_$n", "${Tag}_${n}_HISTORICAL")) {
        if ($Known -contains $candidate) { return $candidate }
    }
    return $null
}

# --- Helper: Split a group's unique block into comment-headed sections ---
# Returns objects with Header (comment text without '#', '' before the first comment) and Names, in file order.
function Get-GroupSections {
    param([string]$RawBlock)
    $m = [regex]::Match($RawBlock, '(?s)unique\s*=\s*\{(.*)\}\s*\}\s*$')
    $sections = [System.Collections.Generic.List[psobject]]::new()
    if (-not $m.Success) { return @() }
    $current = [PSCustomObject]@{ Header = ''; Names = [System.Collections.Generic.List[string]]::new() }
    foreach ($line in ($m.Groups[1].Value -split "`n")) {
        $t = $line.Trim()
        if ($t.StartsWith('#')) {
            if ($current.Header -or $current.Names.Count) { $sections.Add($current) }
            $current = [PSCustomObject]@{ Header = ($t -replace '^#+\s*', ''); Names = [System.Collections.Generic.List[string]]::new() }
            continue
        }
        foreach ($q in [regex]::Matches(($t -replace '#.*$', ''), '"([^"]+)"')) { $current.Names.Add($q.Groups[1].Value) }
    }
    if ($current.Header -or $current.Names.Count) { $sections.Add($current) }
    # Unrolled on purpose: callers pipe the sections (wrap in @() for a count)
    return $sections.ToArray()
}

# --- Helper: Words of a name that identify a person, with titles and ranks dropped ---
# Used by the CrossClassPerson check ("Presidente Pinto" / "Anibal Pinto"). Returns $null for place-like names.
function Get-PersonKeyWords {
    param([string]$Name)
    if (-not $script:PersonKeyLists) {
        $titles = @('almirante', 'contraalmirante', 'vicealmirante', 'capitan', 'comandante', 'teniente', 'subteniente', 'guardiamarina',
            'grumete', 'sargento', 'marinero', 'ingeniero', 'cirujano', 'piloto', 'aspirante', 'alferez', 'presidente', 'ministro',
            'general', 'coronel', 'mariscal', 'marechal', 'don', 'dona', 'rey', 'reina', 'principe', 'infante', 'admiral', 'captain',
            'commander', 'lieutenant', 'president', 'king', 'queen', 'prince', 'princess', 'sir', 'lord', 'kaiser', 'konig', 'prinz',
            'erzherzog', 'graf', 'furst', 'kronprins', 'prins', 'drottning', 'konung', 'kung', 'amiral', 'kapitan', 'duque', 'duke',
            'sultan', 'shah', 'emir', 'raja', 'rajah', 'datu', 'heneral', 'presidente', 'comodoro', 'commodore', 'fieldmarshal')
        $places = @('mount', 'monte', 'mont', 'city', 'ciudad', 'fort', 'fuerte', 'castillo', 'cabo', 'cape', 'canal', 'estrecho', 'strait',
            'isla', 'islas', 'island', 'ilha', 'ilhas', 'lake', 'lago', 'rio', 'river', 'golfo', 'gulf', 'bahia', 'baia', 'bay', 'puerto',
            'porto', 'port', 'punta', 'point', 'villa', 'vila', 'paso', 'nova', 'nueva', 'novo', 'nuevo', 'sao', 'bandar', 'arg', 'congreso')
        # Folded once per run: key folding is regex-heavy and this runs for every name pair
        $script:PersonKeyLists = @{
            Places = @($places | ForEach-Object { Get-NameVariantKey $_ })
            Titles = @($titles | ForEach-Object { Get-NameVariantKey $_ })
        }
    }
    $placeKeys = $script:PersonKeyLists.Places
    $titleKeys = $script:PersonKeyLists.Titles
    $words = @($Name -split '[\s\-]+' | Where-Object { $_ } | ForEach-Object { Get-NameVariantKey $_ } | Where-Object { $_ })
    if (@($words | Where-Object { $placeKeys -contains $_ }).Count) { return $null }
    $i = 0
    while ($i -lt $words.Count - 1 -and $titleKeys -contains $words[$i]) { $i++ }
    return , @($words[$i..($words.Count - 1)])
}

# --- Helper: Audit a mod namelist against current ISNE standards ---
# Returns findings as objects: Severity (FAIL/WARN/INFO), Check, Group, Detail.
# -RepoDir enables documentation sync checks; -VanillaGroups enables vanilla prefix parity.
function Get-NamelistAuditFindings {
    param(
        [object[]]$Groups,
        [string]$Tag,
        [string]$RepoDir,
        [object[]]$VanillaGroups,
        [object]$Canon
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
        ROLE = @{ Target = 20; Floor = 10 }
    }
    $hulls = @('DD', 'SS', 'CL', 'CA', 'BB', 'BC', 'CV')
    $roleTags = @(Get-RolePoolSuffixes | ForEach-Object { "${Tag}_$_" })

    $byClass = @{}
    $themes = @()
    $roles = @()
    foreach ($g in $Groups) {
        $m = [regex]::Match($g.GroupTag, "^$([regex]::Escape($Tag))_(DD|SS|CL|CA|BB|BC|CV)_HISTORICAL$")
        $cls = if ($m.Success) { $m.Groups[1].Value } elseif ($roleTags -contains $g.GroupTag) { 'ROLE' } else { 'THEME' }
        $g | Add-Member -NotePropertyName Class -NotePropertyValue $cls -Force
        $g | Add-Member -NotePropertyName Target -NotePropertyValue $quotas[$cls].Target -Force
        if ($cls -eq 'THEME') { $themes += $g } elseif ($cls -eq 'ROLE') { $roles += $g } else { $byClass[$cls] = $g }
        if (-not $g.GroupTag.StartsWith("${Tag}_")) {
            Add-Finding 'WARN' 'TagNaming' $g.GroupTag "Group tag does not start with '${Tag}_'"
        }
    }

    # 1. Depth vs tiered quotas
    foreach ($g in $Groups) {
        $q = $quotas[$g.Class]
        if ($g.Count -lt $q.Floor) {
            # Thematic depth applies "where thematic scope permits" and role pools are precedent-limited, so a short pool is WARN, never FAIL
            $sev = if ($g.Class -in @('THEME', 'ROLE')) { 'WARN' } else { 'FAIL' }
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
    if ($themes.Count -lt 6) {
        Add-Finding 'WARN' 'ThemeCount' '-' "$($themes.Count) thematic pools; standard is 6+"
    }
    if ($Canon) {
        foreach ($f in (Get-ShipTypeFindings -Groups $Groups -Canon $Canon)) { $findings.Add($f) }
    } else {
        Add-Finding 'INFO' 'ShipTypes' '-' "ship_types check skipped (data/ship_types_canon.json not found)"
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

    # 3a. Spelling variants of one name across major hulls or role pools (Gustav V / Gustaf V): exact checks miss them
    $variantScope = @($major | ForEach-Object { $byClass[$_] }) + @($roles)
    for ($a = 0; $a -lt $variantScope.Count; $a++) {
        for ($b = $a + 1; $b -lt $variantScope.Count; $b++) {
            $ga = $variantScope[$a]; $gb = $variantScope[$b]
            $keysB = @{}
            foreach ($n in $gb.Names) { $keysB[(Get-NameVariantKey $n)] = $n }
            $pairs = @(foreach ($n in ($ga.Names | Select-Object -Unique)) {
                $k = Get-NameVariantKey $n
                if ($keysB.ContainsKey($k) -and $keysB[$k] -cne $n -and $gb.Names -cnotcontains $n) { "$n ~ $($keysB[$k])" }
            })
            if ($pairs.Count -gt 0) {
                $label = { param($g) if ($g.Class -eq 'ROLE') { $g.GroupTag -replace "^$([regex]::Escape($Tag))_", '' } else { $g.Class } }
                Add-Finding 'WARN' 'CrossClassVariant' "$(& $label $ga)/$(& $label $gb)" (Format-NameList $pairs)
            }
        }
    }

    # 3a'. Possibly one person under two forms across major hulls ("Presidente Pinto" / "Anibal Pinto", "Baquedano" /
    # "Manuel Baquedano"): titles dropped, same surname, and one form is the bare surname or a word-suffix of the other.
    # A heuristic review list (INFO): namesakes and places named after people also match, so only real duplicates need fixing.
    $personWords = @{}; $variantKeys = @{}
    foreach ($h in $major) {
        foreach ($n in $byClass[$h].Names) {
            if (-not $personWords.ContainsKey($n)) { $personWords[$n] = Get-PersonKeyWords $n; $variantKeys[$n] = Get-NameVariantKey $n }
        }
    }
    for ($a = 0; $a -lt $major.Count; $a++) {
        for ($b = $a + 1; $b -lt $major.Count; $b++) {
            $ga = $byClass[$major[$a]]; $gb = $byClass[$major[$b]]
            $pairs = [System.Collections.Generic.List[string]]::new()
            foreach ($na in ($ga.Names | Select-Object -Unique)) {
                $wa = $personWords[$na]
                if (-not $wa -or $wa[-1].Length -lt 3 -or $wa[-1] -notmatch '[a-z]') { continue }
                foreach ($nb in ($gb.Names | Select-Object -Unique)) {
                    if ($na -ceq $nb -or $variantKeys[$na] -eq $variantKeys[$nb]) { continue }
                    $wb = $personWords[$nb]
                    if (-not $wb -or $wb[-1] -ne $wa[-1]) { continue }
                    $short, $long = if ($wa.Count -le $wb.Count) { $wa, $wb } else { $wb, $wa }
                    $suffix = ($long[($long.Count - $short.Count)..($long.Count - 1)] -join ' ') -eq ($short -join ' ')
                    if ($short.Count -eq 1 -or $suffix) { $pairs.Add("$na ~ $nb") }
                }
            }
            if ($pairs.Count -gt 0) {
                Add-Finding 'INFO' 'CrossClassPerson' "$($major[$a])/$($major[$b])" (Format-NameList $pairs.ToArray())
            }
        }
    }

    # 3b. Role pools must not reuse names from the major hulls (FAIL) or DD/SS (WARN)
    foreach ($r in $roles) {
        foreach ($h in @('CL', 'CA', 'BB', 'BC', 'CV', 'DD', 'SS')) {
            if (-not $byClass.ContainsKey($h)) { continue }
            $inter = @($r.Names | Where-Object { $byClass[$h].Names -ccontains $_ } | Select-Object -Unique)
            if ($inter.Count -gt 0) {
                $sev = if ($h -in @('DD', 'SS')) { 'WARN' } else { 'FAIL' }
                Add-Finding $sev 'RoleOverlap' "$($r.GroupTag)/$h" (Format-NameList $inter)
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
    # Vanilla hull-specific prefix scheme (e.g. ITA: RCT/RI/RN/RSmg): parity is checked per group, not against one national prefix
    $vPrefixes = if ($null -ne $VanillaGroups) { @($VanillaGroups | Where-Object { $_.Prefix } | ForEach-Object { $_.Prefix } | Select-Object -Unique) } else { @() }
    if ($vPrefixes.Count -gt 1) {
        Add-Finding 'INFO' 'PrefixScheme' '-' "Vanilla hull-specific prefixes: $(($vPrefixes | ForEach-Object { "'$_'" }) -join ', '); parity checked per group"
        foreach ($g in $Groups) {
            $short = $g.GroupTag -replace "^$([regex]::Escape($Tag))_", ''
            $v = @($VanillaGroups | Where-Object { $_.GroupTag -eq $g.GroupTag }) | Select-Object -First 1
            if (-not $g.Prefix) {
                Add-Finding 'FAIL' 'PrefixInconsistent' $g.GroupTag "No prefix; vanilla prefixes every group"
            } elseif ($v -and $v.Prefix -and $v.Prefix -ne $g.Prefix) {
                Add-Finding 'WARN' 'VanillaPrefix' $g.GroupTag "Vanilla prefix '$($v.Prefix)' vs mod '$($g.Prefix)'; keep parity or document why"
            } elseif (-not $v -and $g.Prefix -notin $vPrefixes) {
                Add-Finding 'INFO' 'PrefixScheme' $g.GroupTag "New group uses prefix '$($g.Prefix)' not used in vanilla ($short)"
            }
        }
    } elseif ($dominant) {
        $off = @($Groups | Where-Object { $_.Prefix -ne $dominant } | ForEach-Object { $_.GroupTag -replace "^$([regex]::Escape($Tag))_", '' })
        if ($off.Count -gt 0) {
            Add-Finding 'FAIL' 'PrefixInconsistent' '-' "Dominant prefix '$dominant' missing/different in: $(Format-NameList $off)"
        }
    } else {
        Add-Finding 'INFO' 'Prefix' '-' "No prefix defined in any group"
    }
    if ($vPrefixes.Count -gt 1) {
        # Per-group parity reported above
    } elseif ($null -ne $VanillaGroups) {
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
                # Listed in full (not truncated): each entry is a cell edit, so the caller never has to open the page to find them
                if ($staleSamples.Count -gt 0) { Add-Finding 'WARN' 'DocsWikiSamples' '-' "Wiki sample names not in their group: $($staleSamples -join ', ')" }
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
            if ($plans.Count -eq 0) {
                Add-Finding 'INFO' 'PlanFile' '-' "No docs/superpowers/plans/*-$slug-*.md (create one with -AuditPlan $Tag before review)"
            } else {
                # Skeletons from -AuditPlan carry <!-- TODO --> markers until the author fills them in
                $latest = $plans | Sort-Object Name | Select-Object -Last 1
                $todos = ([regex]::Matches([System.IO.File]::ReadAllText($latest.FullName, [System.Text.Encoding]::UTF8), '<!-- TODO')).Count
                if ($todos -gt 0) { Add-Finding 'WARN' 'PlanTodo' '-' "$($latest.Name) has $todos unfilled TODO section(s)" }
            }
        }
    }

    return , $findings.ToArray()
}

# --- Helper: Check each group's ship_types against the canon ---
# Returns findings (Severity/Check/Group/Detail): UnknownToken, WrongClassToken, MissingRequired, BBCarriesBC, ThemeRestricted.
function Get-ShipTypeFindings {
    param(
        [object[]]$Groups,
        [object]$Canon
    )

    $findings = [System.Collections.Generic.List[psobject]]::new()
    function Add-TypeFinding([string]$Sev, [string]$Check, [string]$Grp, [string]$Detail) {
        $findings.Add([PSCustomObject]@{ Severity = $Sev; Check = $Check; Group = $Grp; Detail = $Detail })
    }

    $hasBC = @($Groups | Where-Object { $_.GroupTag -match '_BC_HISTORICAL$' }).Count -gt 0
    foreach ($g in $Groups) {
        $present = if ($g.ShipTypes -eq 'N/A') { @() } else { @($g.ShipTypes -split '\s+' | Where-Object { $_ }) }
        $m = [regex]::Match($g.GroupTag, '_(DD|SS|CL|CA|BB|BC|CV)_HISTORICAL$')
        if (-not $m.Success) {
            if ($present.Count -gt 0) {
                Add-TypeFinding 'FAIL' 'ThemeRestricted' $g.GroupTag "Thematic pool restricts ship_types ($($g.ShipTypes)); omit for universal selection"
            }
            continue
        }

        $cls = $m.Groups[1].Value
        $rule = $Canon.classes.$cls
        $required = @($rule.required)
        $optional = @($rule.optional)
        $allowed = $required + $optional

        $unknown = @($present | Where-Object { $Canon.tokens -notcontains $_ })
        if ($unknown.Count -gt 0) {
            Add-TypeFinding 'FAIL' 'UnknownToken' $g.GroupTag "$($unknown -join ' ') not used by vanilla names_ships"
        }
        $wrong = @($present | Where-Object { $Canon.tokens -contains $_ -and $allowed -notcontains $_ })
        if ($wrong.Count -gt 0) {
            Add-TypeFinding 'FAIL' 'WrongClassToken' $g.GroupTag "$($wrong -join ' ') invalid for $cls (expected: $($required -join ' '))"
        }
        $missing = @($required | Where-Object { $present -notcontains $_ })
        if ($missing.Count -gt 0) {
            Add-TypeFinding 'FAIL' 'MissingRequired' $g.GroupTag "missing $($missing -join ' ') (expected: $($required -join ' '))"
        }
        if ($cls -eq 'BB' -and $hasBC -and $present -contains 'battle_cruiser') {
            Add-TypeFinding 'WARN' 'BBCarriesBC' $g.GroupTag "BB ship_types include battle_cruiser although a BC group exists"
        }
    }

    return , $findings.ToArray()
}

# --- Action: Verify ship_types of mod namelists against the canon ---
function Invoke-VerifyShipTypes {
    param([string]$Tag)

    $canon = Get-ShipTypeCanon
    if (-not $canon) {
        Write-Host "FAIL canon missing: $ShipTypeCanonPath (run -SyncShipTypeCanon -Write)"
        return 1
    }

    $dir = Join-Path $RepoDir "common\units\names_ships"
    $Tag = $Tag.ToUpper().Trim()
    $files = if ($Tag -eq 'ALL') {
        @(Get-ChildItem -Path $dir -Filter *.txt)
    } else {
        $p = Join-Path $dir "${Tag}_ship_names.txt"
        if (-not (Test-Path $p)) { Write-Host "FAIL namelist not found: $p"; return 1 }
        @(Get-Item $p)
    }

    $groupCount = 0
    $all = [System.Collections.Generic.List[psobject]]::new()
    foreach ($file in $files) {
        $groups = Get-NamelistGroups -Path $file.FullName
        $groupCount += $groups.Count
        foreach ($f in (Get-ShipTypeFindings -Groups $groups -Canon $canon)) { $all.Add($f) }
    }

    foreach ($f in $all) { Write-Host "$($f.Severity) $($f.Group) $($f.Check) $($f.Detail)" }
    $fails = @($all | Where-Object { $_.Severity -eq 'FAIL' }).Count
    if ($all.Count -eq 0) { Write-Host "ship_types OK: $($files.Count) files, $groupCount groups" }
    return $(if ($fails -gt 0) { 1 } else { 0 })
}

# --- Action: Diff vanilla ship_types against the canon (optionally refresh tokens/meta) ---
function Invoke-SyncShipTypeCanon {
    param(
        [string]$CustomHoi4Dir,
        [switch]$WriteCanon
    )

    $hoi4Dir = Find-Hoi4Install -CustomPath $CustomHoi4Dir
    if (-not $hoi4Dir) {
        Write-Err "Could not locate Hearts of Iron IV game installation directory. Specify -Hoi4InstallDir '<path>'."
        return 1
    }
    $vanillaDir = Join-Path $hoi4Dir "common\units\names_ships"
    $vanillaFiles = @(Get-ChildItem -Path $vanillaDir -Filter *.txt)

    $tokenCounts = @{}
    $classSets = @{}
    foreach ($file in $vanillaFiles) {
        foreach ($g in (Get-NamelistGroups -Path $file.FullName)) {
            if ($g.ShipTypes -eq 'N/A') { continue }
            $toks = @($g.ShipTypes -split '\s+' | Where-Object { $_ } | Sort-Object -Unique)
            foreach ($t in $toks) { $tokenCounts[$t] = 1 + [int]$tokenCounts[$t] }
            $m = [regex]::Match($g.GroupTag, '_(DD|SS|CL|CA|BB|BC|CV)_HISTORICAL$')
            if (-not $m.Success) { continue }
            $cls = $m.Groups[1].Value
            if (-not $classSets.ContainsKey($cls)) { $classSets[$cls] = @{} }
            $key = $toks -join ' '
            $classSets[$cls][$key] = 1 + [int]$classSets[$cls][$key]
        }
    }

    $liveTokens = @($tokenCounts.Keys | Sort-Object)
    Write-Host "Vanilla: $($vanillaFiles.Count) files, $($liveTokens.Count) live ship_types tokens"
    Write-Host ("Tokens: " + (($liveTokens | ForEach-Object { "$_=$($tokenCounts[$_])" }) -join ', '))

    $canon = Get-ShipTypeCanon
    $drift = 0
    foreach ($cls in @('DD', 'SS', 'CL', 'CA', 'BB', 'BC', 'CV')) {
        $sets = @($classSets[$cls].GetEnumerator() | Sort-Object Value -Descending)
        Write-Host ("${cls}: " + (($sets | ForEach-Object { "$($_.Value)x[$($_.Key)]" }) -join ' '))
        if (-not $canon) { continue }
        $rule = $canon.classes.$cls
        $req = (@($rule.required) | Sort-Object) -join ' '
        $allowed = @($rule.required) + @($rule.optional)
        if ($sets.Count -gt 0 -and $sets[0].Key -ne $req) {
            Write-Host "  DRIFT ${cls}: most common vanilla set [$($sets[0].Key)] differs from canon required [$req]" -ForegroundColor Yellow
            $drift++
        }
        foreach ($s in $sets) {
            $extra = @($s.Key -split ' ' | Where-Object { $allowed -notcontains $_ })
            if ($extra.Count -gt 0) { Write-Host "  INFO ${cls}: vanilla variant [$($s.Key)] uses tokens the canon does not allow ($($extra -join ' '))" }
        }
    }

    if ($canon) {
        $added = @($liveTokens | Where-Object { $canon.tokens -notcontains $_ })
        $removed = @($canon.tokens | Where-Object { $liveTokens -notcontains $_ })
        if ($added.Count -or $removed.Count) {
            Write-Host "  DRIFT tokens: +[$($added -join ' ')] -[$($removed -join ' ')]" -ForegroundColor Yellow
            $drift++
        }
    }
    Write-Host $(if ($drift -eq 0) { "Canon matches vanilla." } else { "Canon differs from vanilla in $drift place(s)." })

    if ($WriteCanon) {
        $sb = [System.Text.StringBuilder]::new()
        $join = { param($a) ($a | ForEach-Object { '"' + $_ + '"' }) -join ', ' }
        [void]$sb.AppendLine('{')
        [void]$sb.AppendLine("  `"meta`": { `"generated`": `"$((Get-Date).ToString('yyyy-MM-dd'))`", `"vanillaFiles`": $($vanillaFiles.Count) },")
        [void]$sb.AppendLine("  `"tokens`": [$(& $join $liveTokens)],")
        [void]$sb.AppendLine('  "classes": {')
        $classNames = @('DD', 'SS', 'CL', 'CA', 'BB', 'BC', 'CV')
        for ($i = 0; $i -lt $classNames.Count; $i++) {
            $rule = $canon.classes.($classNames[$i])
            $comma = if ($i -lt $classNames.Count - 1) { ',' } else { '' }
            [void]$sb.AppendLine("    `"$($classNames[$i])`": { `"required`": [$(& $join @($rule.required))], `"optional`": [$(& $join @($rule.optional))] }$comma")
        }
        [void]$sb.AppendLine('  }')
        [void]$sb.AppendLine('}')
        [System.IO.File]::WriteAllText($ShipTypeCanonPath, $sb.ToString(), (New-Object System.Text.UTF8Encoding $false))
        Write-Host "Wrote $ShipTypeCanonPath (tokens and meta refreshed; class rules preserved)."
    }
    return 0
}

# --- Action: Audit a mod ship namelist ---
function Invoke-NamelistAudit {
    param(
        [string]$Tag,
        [string]$TargetGroup,
        [string]$CustomHoi4Dir,
        [switch]$NamesOnly,
        [switch]$Sections
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
            $known = @($groups | ForEach-Object { $_.GroupTag })
            $wanted = @($TargetGroup -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ })
            $resolved = @($wanted | ForEach-Object { Resolve-GroupTag -Tag $Tag -Name $_ -Known $known })
            $missing = @(for ($i = 0; $i -lt $wanted.Count; $i++) { if (-not $resolved[$i]) { $wanted[$i] } })
            if ($missing.Count -gt 0) {
                Write-Err "Group(s) not found: $($missing -join ', '). Groups: $(($groups | ForEach-Object { $_.GroupTag -replace "^${Tag}_", '' }) -join ', ')"
            }
            $selected = @($groups | Where-Object { $resolved -contains $_.GroupTag })
        }
        foreach ($g in $selected) {
            if ($NamesOnly) {
                $label = if ($g.NameIsLiteral) { " `"$($g.ThemeName)`"" } else { '' }
                $body = if ($Sections) {
                    (@(Get-GroupSections -RawBlock $g.RawBlock) | ForEach-Object {
                        $names = if ($_.Names.Count) { $_.Names -join '; ' } else { '(empty)' }
                        if ($_.Header) { "[$($_.Header)] $names" } else { $names }
                    }) -join ' '
                } else { $g.Names -join '; ' }
                Write-Host "$($g.GroupTag) ($($g.Count))${label}: $body"
            } else {
                Write-Host "$($g.GroupTag) ($($g.Count) names)" -ForegroundColor Green
                Write-Host $g.RawBlock
            }
        }
        return
    }

    $findings = Get-TagAuditFindings -Tag $Tag -Groups $groups -CustomHoi4Dir $CustomHoi4Dir

    Write-Host "ISNE audit: ${Tag}_ship_names.txt ($($groups.Count) groups)" -ForegroundColor Cyan
    $table = $groups | Select-Object @{ n = 'Group'; e = { $_.GroupTag -replace "^${Tag}_", '' } }, Class,
        @{ n = 'Count'; e = { "$($_.Count)/$($_.Target)" } }, Prefix, Fallback,
        @{ n = 'Name'; e = { if ($_.NameIsLiteral) { $_.ThemeName } else { '(loc key)' } } }
    Write-Host (($table | Format-Table -AutoSize | Out-String -Width 220).Trim())

    Write-Host ""
    foreach ($line in (Format-AuditFindingLines -Findings $findings -Tag $Tag)) {
        $color = if ($line.StartsWith('[FAIL]')) { 'Red' } elseif ($line.StartsWith('[WARN]')) { 'Yellow' } else { 'Gray' }
        Write-Host $line -ForegroundColor $color
    }
    Write-Host "`n$(Format-AuditSummary -Findings $findings -Tag $Tag)"
}

# --- Helper: Run the standards audit for a TAG (vanilla parity and canon included) ---
function Get-TagAuditFindings {
    param(
        [string]$Tag,
        [object[]]$Groups,
        [string]$CustomHoi4Dir
    )
    $vanillaGroups = $null
    $hoi4Dir = Find-Hoi4Install -CustomPath $CustomHoi4Dir
    if ($hoi4Dir) {
        foreach ($c in @("${Tag}_ship_names.txt", "${Tag}_names_ships.txt")) {
            $vp = Join-Path $hoi4Dir "common\units\names_ships\$c"
            if (Test-Path $vp) { $vanillaGroups = Get-NamelistGroups -Path $vp; break }
        }
    }
    return , (Get-NamelistAuditFindings -Groups $Groups -Tag $Tag -RepoDir $RepoDir -VanillaGroups $vanillaGroups -Canon (Get-ShipTypeCanon))
}

# --- Helper: Audit findings as report lines, FAIL first ---
function Format-AuditFindingLines {
    param(
        [object[]]$Findings,
        [string]$Tag
    )
    $order = @{ FAIL = 0; WARN = 1; INFO = 2 }
    return , @($Findings | Sort-Object { $order[$_.Severity] }, Check | ForEach-Object {
        "[$($_.Severity)] $($_.Check) $($_.Group -replace "^${Tag}_", '') : $($_.Detail)"
    })
}

function Format-AuditSummary {
    param(
        [object[]]$Findings,
        [string]$Tag
    )
    $count = { param($s) @($Findings | Where-Object { $_.Severity -eq $s }).Count }
    return "AUDIT SUMMARY ${Tag}: FAIL=$(& $count 'FAIL') WARN=$(& $count 'WARN') INFO=$(& $count 'INFO')"
}

# --- Helper: Comment headers in a unique block that no longer head any entry ---
function Get-OrphanHeaderLines {
    param([string[]]$Lines)
    $orphans = @()
    for ($i = 0; $i -lt $Lines.Count; $i++) {
        if (-not $Lines[$i].Trim().StartsWith('#')) { continue }
        $j = $i + 1
        while ($j -lt $Lines.Count -and -not $Lines[$j].Trim()) { $j++ }
        if ($j -ge $Lines.Count -or $Lines[$j].Trim().StartsWith('#')) { $orphans += $i }
    }
    return , $orphans
}

# --- Helper: Edit the unique = { } block of one group in namelist text ---
# Pure text transform used by -EditNames: renames names and section headers, removes, then adds (at block end, after
# -After, or at the end of the -Section comment header, created if missing). Section headers an edit leaves empty are
# dropped; headers that were already empty stay. Throws on any name that does not match exactly once, on duplicates
# within the group, and on an emptied block.
function Edit-NamelistGroupText {
    param(
        [string]$Text,
        [string]$GroupTag,
        [string[]]$Add = @(),
        [string[]]$Remove = @(),
        [string[]]$Rename = @(),
        [string]$After,
        [string]$Section,
        [string[]]$RenameSection = @()
    )

    if ($After -and $Section) { throw "Use -After or -Section, not both" }
    $nl = if ($Text.Contains("`r`n")) { "`r`n" } else { "`n" }
    $cr = if ($nl -eq "`r`n") { "`r" } else { '' }
    $headerText = { param($line) $line.Trim() -replace '^#+\s*', '' }
    $head = [regex]::Match($Text, "(?m)^[ \t]*$([regex]::Escape($GroupTag))[ \t]*=[ \t]*\{")
    if (-not $head.Success) { throw "Group $GroupTag not found" }

    # Walk the group's braces (skipping comments and quoted names) to find its unique block
    $depth = 0; $pos = $head.Index + $head.Length - 1; $blockEnd = -1
    $uStart = -1; $uEnd = -1
    for ($i = $pos; $i -lt $Text.Length; $i++) {
        $ch = $Text[$i]
        if ($ch -eq '#') { while ($i -lt $Text.Length -and $Text[$i] -ne "`n") { $i++ }; continue }
        if ($ch -eq '"') { $i++; while ($i -lt $Text.Length -and $Text[$i] -ne '"') { $i++ }; continue }
        if ($ch -eq '{') {
            $depth++
            if ($depth -eq 2 -and $uStart -lt 0 -and $Text.Substring($pos, $i - $pos) -match 'unique\s*=\s*$') { $uStart = $i + 1 }
        } elseif ($ch -eq '}') {
            if ($depth -eq 2 -and $uStart -ge 0 -and $uEnd -lt 0) { $uEnd = $i }
            $depth--
            if ($depth -eq 0) { $blockEnd = $i; break }
        }
    }
    if ($blockEnd -lt 0) { throw "Group $GroupTag has unbalanced braces" }
    if ($uStart -lt 0 -or $uEnd -lt 0) { throw "Group $GroupTag has no unique = { } block (ordered blocks must be edited by hand)" }

    $inner = $Text.Substring($uStart, $uEnd - $uStart)
    $current = { @([regex]::Matches(($inner -replace '(?m)#.*$', ''), '"([^"]+)"') | ForEach-Object { $_.Groups[1].Value }) }
    $countOf = { param($n) @(& $current | Where-Object { $_ -ceq $n }).Count }
    $origLines = @($inner -split "`n")
    $orphansBefore = @((Get-OrphanHeaderLines -Lines $origLines) | ForEach-Object { & $headerText $origLines[$_] })

    foreach ($pair in $RenameSection) {
        $parts = $pair -split '=', 2
        if ($parts.Count -ne 2 -or -not $parts[0].Trim() -or -not $parts[1].Trim()) { throw "RenameSection '$pair' must be Old=New" }
        $old = $parts[0].Trim(); $new = $parts[1].Trim()
        $lines = @($inner -split "`n")
        $hits = @(for ($l = 0; $l -lt $lines.Count; $l++) { if ($lines[$l].Trim().StartsWith('#') -and (& $headerText $lines[$l]) -ceq $old) { $l } })
        if ($hits.Count -ne 1) { throw "RenameSection: header '$old' found $($hits.Count) times in $GroupTag (expected 1)" }
        $indent = [regex]::Match($lines[$hits[0]], '^[ \t]*').Value
        $lines[$hits[0]] = "$indent# $new$cr"
        $inner = $lines -join "`n"
    }

    foreach ($pair in $Rename) {
        $parts = $pair -split '=', 2
        if ($parts.Count -ne 2 -or -not $parts[0].Trim() -or -not $parts[1].Trim()) { throw "Rename '$pair' must be Old=New" }
        $old = $parts[0].Trim(); $new = $parts[1].Trim()
        if ((& $countOf $old) -ne 1) { throw "Rename: '$old' found $(& $countOf $old) times in $GroupTag (expected 1)" }
        if ((& $countOf $new) -gt 0) { throw "Rename: '$new' already exists in $GroupTag" }
        $inner = $inner.Replace("`"$old`"", "`"$new`"")
    }

    foreach ($name in $Remove) {
        if ((& $countOf $name) -ne 1) { throw "Remove: '$name' found $(& $countOf $name) times in $GroupTag (expected 1)" }
        $q = [regex]::Escape("`"$name`"")
        $lines = @($inner -split "`n")
        $drop = -1
        for ($l = 0; $l -lt $lines.Count; $l++) {
            if ($lines[$l] -notmatch $q -or $lines[$l].TrimStart().StartsWith('#')) { continue }
            $edited = if ($lines[$l] -match "$q[ \t]+") { $lines[$l] -replace "$q[ \t]+", '' } else { $lines[$l] -replace "[ \t]*$q", '' }
            # Drop a line the removal emptied (keeps comment and blank separator lines intact)
            if ($edited.Trim()) { $lines[$l] = $edited } else { $drop = $l }
            break
        }
        $inner = @(for ($l = 0; $l -lt $lines.Count; $l++) { if ($l -ne $drop) { $lines[$l] } }) -join "`n"
    }

    if ($Add.Count -gt 0) {
        $dupes = @($Add | Where-Object { (& $countOf $_) -gt 0 })
        if ($dupes.Count -gt 0) { throw "Add: already in ${GroupTag}: $($dupes -join ', ')" }
        $repeat = @($Add | Group-Object | Where-Object { $_.Count -gt 1 } | ForEach-Object { $_.Name })
        if ($repeat.Count -gt 0) { throw "Add: listed twice: $($repeat -join ', ')" }
        $quoted = ($Add | ForEach-Object { "`"$_`"" }) -join ' '
        $entryLines = @($inner -split "`n" | Where-Object { $_ -match '"' -and -not $_.TrimStart().StartsWith('#') })
        $indent = if ($entryLines.Count -gt 0) { [regex]::Match($entryLines[-1], '^[ \t]*').Value } else { "`t`t" }
        $lines = @($inner -split "`n")
        $hits = if ($Section) { @(for ($l = 0; $l -lt $lines.Count; $l++) { if ($lines[$l].Trim().StartsWith('#') -and (& $headerText $lines[$l]) -ceq $Section.Trim()) { $l } }) } else { @() }
        if ($After) {
            if ((& $countOf $After) -ne 1) { throw "After: '$After' found $(& $countOf $After) times in $GroupTag (expected 1)" }
            $inner = $inner.Replace("`"$After`"", "`"$After`" $quoted")
        } elseif ($hits.Count -gt 1) {
            throw "Section: header '$Section' found $($hits.Count) times in $GroupTag (expected 1)"
        } elseif ($hits.Count -eq 1) {
            # Insert after the last entry line of that section (before the next header or the block end)
            $at = $hits[0]
            for ($l = $hits[0] + 1; $l -lt $lines.Count -and -not $lines[$l].Trim().StartsWith('#'); $l++) { if ($lines[$l].Trim()) { $at = $l } }
            $lines = @($lines[0..$at]) + @("$indent$quoted$cr") + @(if ($at + 1 -lt $lines.Count) { $lines[($at + 1)..($lines.Count - 1)] })
            $inner = $lines -join "`n"
        } else {
            $newLines = if ($Section) { $nl + $indent + '# ' + $Section.Trim() + $nl + $indent + $quoted } else { $nl + $indent + $quoted }
            $body = $inner.TrimEnd()
            $inner = $body + $newLines + $inner.Substring($body.Length)
        }
    }

    if ((& $current).Count -eq 0) { throw "Edit would leave $GroupTag with an empty unique block" }

    # Drop section headers this edit left without entries (headers that were empty before are kept)
    $lines = @($inner -split "`n")
    $drop = @((Get-OrphanHeaderLines -Lines $lines) | Where-Object { $orphansBefore -cnotcontains (& $headerText $lines[$_]) })
    if ($drop.Count) { $inner = @(for ($l = 0; $l -lt $lines.Count; $l++) { if ($drop -notcontains $l) { $lines[$l] } }) -join "`n" }

    return $Text.Substring(0, $uStart) + $inner + $Text.Substring($uEnd)
}

# --- Action: Edit names in one group of a mod namelist ---
function Invoke-NamelistEdit {
    param(
        [string]$Tag,
        [string]$TargetGroup,
        [string]$AddList,
        [string]$RemoveList,
        [string]$RenameList,
        [string]$AfterName,
        [string]$SectionName,
        [string]$RenameSectionList,
        [switch]$Quiet
    )

    $Tag = $Tag.ToUpper().Trim()
    $modFile = Join-Path $RepoDir "common\units\names_ships\${Tag}_ship_names.txt"
    if (-not (Test-Path $modFile)) { Write-Err "Mod namelist not found: $modFile"; return 1 }
    $split = { param($s) @(if ($s) { $s -split ';' | ForEach-Object { $_.Trim() } | Where-Object { $_ } }) }
    $adds = & $split $AddList; $removes = & $split $RemoveList; $renames = & $split $RenameList; $sectionRenames = & $split $RenameSectionList
    if (($adds.Count + $removes.Count + $renames.Count + $sectionRenames.Count) -eq 0) { Write-Err "Nothing to do: pass -Add, -Remove, -Rename and/or -RenameSection"; return 1 }

    $before = Get-NamelistGroups -Path $modFile
    $groupTag = Resolve-GroupTag -Tag $Tag -Name $TargetGroup -Known @($before | ForEach-Object { $_.GroupTag })
    if (-not $groupTag) { Write-Err "Group '$TargetGroup' not found. Groups: $(($before | ForEach-Object { $_.GroupTag -replace "^${Tag}_", '' }) -join ', ')"; return 1 }
    $text = [System.IO.File]::ReadAllText($modFile, [System.Text.Encoding]::UTF8)
    try {
        $newText = Edit-NamelistGroupText -Text $text -GroupTag $groupTag -Add $adds -Remove $removes -Rename $renames -After $AfterName -Section $SectionName -RenameSection $sectionRenames
    } catch {
        Write-Err $_.Exception.Message
        return 1
    }
    [System.IO.File]::WriteAllText($modFile, $newText, (New-Object System.Text.UTF8Encoding $false))

    $groups = Get-NamelistGroups -Path $modFile
    $g = $groups | Where-Object { $_.GroupTag -eq $groupTag }
    $oldHeaders = @(Get-GroupSections -RawBlock ($before | Where-Object { $_.GroupTag -eq $groupTag }).RawBlock | ForEach-Object { $_.Header } | Where-Object { $_ })
    $newHeaders = @(Get-GroupSections -RawBlock $g.RawBlock | ForEach-Object { $_.Header } | Where-Object { $_ })
    $renamedFrom = @($sectionRenames | ForEach-Object { ($_ -split '=', 2)[0].Trim() })
    $dropped = @($oldHeaders | Where-Object { $newHeaders -cnotcontains $_ -and $renamedFrom -cnotcontains $_ })

    $summary = "Edited ${groupTag}: +$($adds.Count) -$($removes.Count) ~$($renames.Count) -> $($g.Count) names"
    if ($dropped.Count) { $summary += "; dropped empty section(s): $($dropped -join '; ')" }
    Write-Host $summary
    if (-not $Quiet) { Write-Host "$($g.GroupTag) ($($g.Count)): $($g.Names -join '; ')" }
    return 0
}

# --- Helper: Compare two parsed namelists group by group ---
# Returns one object per group: Status (added/removed/changed/unchanged), counts, Added/Removed names and attribute changes.
function Compare-NamelistGroupSets {
    param(
        [object[]]$Old,
        [object[]]$New
    )

    $oldBy = @{}; foreach ($g in $Old) { $oldBy[$g.GroupTag] = $g }
    $newBy = @{}; foreach ($g in $New) { $newBy[$g.GroupTag] = $g }
    $tags = @($New | ForEach-Object { $_.GroupTag }) + @($Old | Where-Object { -not $newBy.ContainsKey($_.GroupTag) } | ForEach-Object { $_.GroupTag })

    $result = [System.Collections.Generic.List[psobject]]::new()
    foreach ($t in $tags) {
        $o = $oldBy[$t]; $n = $newBy[$t]
        $oNames = if ($o) { @($o.Names) } else { @() }
        $nNames = if ($n) { @($n.Names) } else { @() }
        $added = @($nNames | Where-Object { $oNames -cnotcontains $_ } | Select-Object -Unique)
        $removed = @($oNames | Where-Object { $nNames -cnotcontains $_ } | Select-Object -Unique)
        $attrs = @()
        if ($o -and $n) {
            foreach ($p in @('ThemeName', 'Prefix', 'Fallback', 'ShipTypes')) {
                if ($o.$p -cne $n.$p) { $attrs += "$p '$($o.$p)' -> '$($n.$p)'" }
            }
        }
        $status = if (-not $o) { 'added' } elseif (-not $n) { 'removed' } elseif ($added.Count -or $removed.Count -or $attrs.Count) { 'changed' } else { 'unchanged' }
        $result.Add([PSCustomObject]@{
            GroupTag   = $t
            Status     = $status
            OldCount   = $oNames.Count
            NewCount   = $nNames.Count
            Added      = $added
            Removed    = $removed
            Attributes = $attrs
        })
    }
    return , $result.ToArray()
}

# --- Helper: Render a group comparison as compact report lines ---
function Format-NamelistDiff {
    param(
        [object[]]$Diff,
        [string]$Tag,
        [string]$BaseLabel
    )

    $short = { param($t) $t -replace "^$([regex]::Escape($Tag))_", '' }
    $changed = @($Diff | Where-Object { $_.Status -ne 'unchanged' })
    $same = @($Diff | Where-Object { $_.Status -eq 'unchanged' })
    $lines = [System.Collections.Generic.List[string]]::new()
    $lines.Add("Name diff $Tag ($BaseLabel -> working tree): $($changed.Count) changed, $($same.Count) unchanged")

    foreach ($d in $changed) {
        $name = & $short $d.GroupTag
        switch ($d.Status) {
            'added'   { $lines.Add("$name (new group, $($d.NewCount)): + $($d.Added -join '; ')") }
            'removed' { $lines.Add("$name (group removed, had $($d.OldCount))") }
            default {
                $line = "$name $($d.OldCount)->$($d.NewCount):"
                if ($d.Added.Count) { $line += " + $($d.Added -join '; ')" }
                if ($d.Added.Count -and $d.Removed.Count) { $line += ' |' }
                if ($d.Removed.Count) { $line += " - $($d.Removed -join '; ')" }
                $lines.Add($line)
            }
        }
        foreach ($a in $d.Attributes) { $lines.Add("  $a") }
    }

    # A name removed from one group and added to another is a move (plan tables list these separately)
    $moves = @(foreach ($from in $Diff) {
        foreach ($nm in $from.Removed) {
            foreach ($to in $Diff) {
                if ($to.GroupTag -ne $from.GroupTag -and $to.Added -ccontains $nm) { "$nm ($(& $short $from.GroupTag)->$(& $short $to.GroupTag))" }
            }
        }
    })
    if ($moves.Count) { $lines.Add("Moved: $($moves -join '; ')") }
    if ($same.Count) { $lines.Add("Unchanged: $(($same | ForEach-Object { & $short $_.GroupTag }) -join ', ')") }
    return , $lines.ToArray()
}

# --- Helper: Read a file's text at a git revision (UTF-8); $null if the revision lacks it ---
function Get-GitFileText {
    param(
        [string]$Rev,
        [string]$RelPath
    )

    $prevEncoding = [Console]::OutputEncoding
    $prevPreference = $ErrorActionPreference
    try {
        # Windows PowerShell decodes native output with the console code page; git emits the blob's raw UTF-8 bytes
        $ErrorActionPreference = 'Continue'
        [Console]::OutputEncoding = New-Object System.Text.UTF8Encoding $false
        $out = & git -C $RepoDir show "${Rev}:$RelPath" 2>$null
        if ($LASTEXITCODE -ne 0) { return $null }
        return (@($out) -join "`n")
    }
    finally {
        [Console]::OutputEncoding = $prevEncoding
        $ErrorActionPreference = $prevPreference
    }
}

# --- Action: Name-level diff of a mod namelist against a git revision ---
function Invoke-NamelistDiff {
    param(
        [string]$Tag,
        [string]$BaseRev
    )

    $Tag = $Tag.ToUpper().Trim()
    try { $result = Get-TagNamelistDiff -Tag $Tag -BaseRev $BaseRev } catch { Write-Err $_.Exception.Message; return 1 }
    foreach ($line in (Format-NamelistDiff -Diff $result.Diff -Tag $Tag -BaseLabel $result.Label)) { Write-Host $line }
    return 0
}

# --- Helper: Group comparison of a TAG's working-tree namelist against a git revision ---
# Returns @{ Diff; Label; Groups (working tree) }; throws on a missing file or unknown revision.
function Get-TagNamelistDiff {
    param(
        [string]$Tag,
        [string]$BaseRev
    )
    $rel = "common/units/names_ships/${Tag}_ship_names.txt"
    $modFile = Join-Path $RepoDir $rel
    if (-not (Test-Path $modFile)) { throw "Mod namelist not found: $modFile" }

    $null = & git -C $RepoDir rev-parse --verify --quiet "${BaseRev}^{commit}"
    if ($LASTEXITCODE -ne 0) { throw "Unknown git revision: $BaseRev" }

    $oldGroups = @()
    $label = $BaseRev
    $oldText = Get-GitFileText -Rev $BaseRev -RelPath $rel
    if ($null -eq $oldText) {
        $label = "$BaseRev, file absent"
    } else {
        $tempFile = [System.IO.Path]::GetTempFileName()
        try {
            [System.IO.File]::WriteAllText($tempFile, $oldText, (New-Object System.Text.UTF8Encoding $false))
            $oldGroups = Get-NamelistGroups -Path $tempFile
        }
        finally {
            if (Test-Path $tempFile) { Remove-Item -Force $tempFile }
        }
    }
    $newGroups = Get-NamelistGroups -Path $modFile
    return @{ Diff = (Compare-NamelistGroupSets -Old $oldGroups -New $newGroups); Label = $label; Groups = $newGroups }
}

# --- Helper: Country name of a TAG from its README row ---
function Get-CountryName {
    param([string]$Tag)
    $readmePath = Join-Path $RepoDir 'README.md'
    if (-not (Test-Path $readmePath)) { return $null }
    $readme = [System.IO.File]::ReadAllText($readmePath, [System.Text.Encoding]::UTF8)
    $m = [regex]::Match($readme, "\|\s*``?" + [regex]::Escape($Tag) + "``?\s*\|\s*([^|\r\n]+?)\s*\|")
    if ($m.Success) { return $m.Groups[1].Value.Trim() }
    return $null
}

# --- Helper: Markdown change table (plan section) from a group comparison ---
function Format-PlanChangeTable {
    param(
        [object[]]$Diff,
        [string]$Tag
    )
    $short = { param($t) $t -replace "^$([regex]::Escape($Tag))_", '' }
    $changed = @($Diff | Where-Object { $_.Status -ne 'unchanged' })
    $same = @($Diff | Where-Object { $_.Status -eq 'unchanged' })
    if ($changed.Count -eq 0) { return , @('No name changes versus the base revision.') }

    # Moves: removed from one group, added to another
    $movedTo = @{}; $movedFrom = @{}
    foreach ($from in $Diff) {
        foreach ($nm in $from.Removed) {
            foreach ($to in $Diff) {
                if ($to.GroupTag -ne $from.GroupTag -and $to.Added -ccontains $nm) {
                    $movedTo["$($from.GroupTag)|$nm"] = & $short $to.GroupTag
                    $movedFrom["$($to.GroupTag)|$nm"] = & $short $from.GroupTag
                }
            }
        }
    }

    $lines = [System.Collections.Generic.List[string]]::new()
    $lines.Add('| Group | Count | Added | Removed | Other |')
    $lines.Add('|---|---|---|---|---|')
    foreach ($d in $changed) {
        $count = switch ($d.Status) { 'added' { "new, $($d.NewCount)" } 'removed' { "removed, had $($d.OldCount)" } default { "$($d.OldCount) -> $($d.NewCount)" } }
        $added = @($d.Added | ForEach-Object { $k = "$($d.GroupTag)|$_"; if ($movedFrom.ContainsKey($k)) { "$_ (from $($movedFrom[$k]))" } else { $_ } })
        $removed = @($d.Removed | ForEach-Object { $k = "$($d.GroupTag)|$_"; if ($movedTo.ContainsKey($k)) { "$_ (to $($movedTo[$k]))" } else { $_ } })
        $cell = { param($items) if ($items.Count) { $items -join ', ' } else { '-' } }
        $other = if ($d.Attributes.Count) { $d.Attributes -join '; ' } else { '-' }
        $lines.Add("| $(& $short $d.GroupTag) | $count | $(& $cell $added) | $(& $cell $removed) | $other |")
    }
    if ($same.Count) { $lines.Add(''); $lines.Add("Unchanged: $(($same | ForEach-Object { & $short $_.GroupTag }) -join ', ')") }
    return , $lines.ToArray()
}

# --- Helper: Replace the generated change table between the plan's markers ---
function Set-PlanChangeTable {
    param(
        [string]$PlanText,
        [string[]]$TableLines
    )
    $nl = if ($PlanText.Contains("`r`n")) { "`r`n" } else { "`n" }
    $begin = [regex]::Match($PlanText, '<!-- BEGIN CHANGE TABLE[^\r\n]*-->')
    $end = [regex]::Match($PlanText, '<!-- END CHANGE TABLE -->')
    if (-not $begin.Success -or -not $end.Success -or $end.Index -lt $begin.Index) { throw "Plan has no BEGIN/END CHANGE TABLE markers" }
    $head = $PlanText.Substring(0, $begin.Index + $begin.Length)
    return $head + $nl + ($TableLines -join $nl) + $nl + $PlanText.Substring($end.Index)
}

# --- Helper: Audit plan skeleton (TODO markers are reported by -Audit as PlanTodo until filled) ---
function New-AuditPlanText {
    param(
        [string]$Country,
        [string]$Tag,
        [string]$Date,
        [string[]]$FindingLines,
        [string]$Summary,
        [string[]]$TableLines
    )
    $l = [System.Collections.Generic.List[string]]::new()
    $l.Add("# $Country ($Tag) Namelist Audit - $Date"); $l.Add('')
    $l.Add("File: ``common/units/names_ships/${Tag}_ship_names.txt``"); $l.Add('')
    $l.Add("## Initial report (``-Audit $Tag``)")
    $l.Add("- $Summary")
    foreach ($f in $FindingLines) { $l.Add("- $f") }
    $l.Add('- Found on manual review: <!-- TODO: issues the script cannot see, or "none" -->'); $l.Add('')
    $l.Add('## User decisions'); $l.Add('<!-- TODO: checkpoint answers, or "None required" -->'); $l.Add('')
    $l.Add('## Research'); $l.Add('<!-- TODO: dispatches (agent, web calls used) and main sources -->'); $l.Add('')
    $l.Add('## Per-group changes')
    $l.Add('<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->')
    foreach ($t in $TableLines) { $l.Add($t) }
    $l.Add('<!-- END CHANGE TABLE -->'); $l.Add('')
    $l.Add('## Rationale'); $l.Add('<!-- TODO: doctrine applied, why names moved, respellings (a rename shows as removed + added above) -->'); $l.Add('')
    $l.Add('## Persons verified'); $l.Add('<!-- TODO: every person the file keeps, legacy included: source or "well documented" (one line per group for well-documented names) -->'); $l.Add('')
    $l.Add('## Author confirmation'); $l.Add('<!-- TODO: unverified persons kept pending the author, or "None" -->'); $l.Add('')
    $l.Add('## Kept on judgment'); $l.Add('<!-- TODO: remaining WARNs and CrossClassPerson pairs kept, each with its reason, or "None" -->'); $l.Add('')
    $l.Add('## Role pools'); $l.Add('| Role | Verdict | Reason |'); $l.Add('|---|---|---|'); $l.Add('<!-- TODO: one row per role considered -->'); $l.Add('')
    $l.Add('## Review'); $l.Add('<!-- TODO: reviewer verdict and how each Critical/Important finding was handled -->')
    return ($l -join "`n") + "`n"
}

# --- Action: Create an audit plan skeleton, or refresh its generated change table ---
function Invoke-AuditPlan {
    param(
        [string]$Tag,
        [string]$BaseRev,
        [string]$CustomHoi4Dir
    )
    $Tag = $Tag.ToUpper().Trim()
    $country = Get-CountryName -Tag $Tag
    if (-not $country) { Write-Err "README.md has no row for $Tag"; return 1 }
    try { $result = Get-TagNamelistDiff -Tag $Tag -BaseRev $BaseRev } catch { Write-Err $_.Exception.Message; return 1 }
    $table = Format-PlanChangeTable -Diff $result.Diff -Tag $Tag
    $changedCount = @($result.Diff | Where-Object { $_.Status -ne 'unchanged' }).Count

    $plansDir = Join-Path $RepoDir 'docs\superpowers\plans'
    if (-not (Test-Path $plansDir)) { New-Item -ItemType Directory -Force $plansDir | Out-Null }
    $date = (Get-Date).ToString('yyyy-MM-dd')
    $slug = $country.ToLower() -replace ' ', '-'
    $path = Join-Path $plansDir "$date-$slug-audit.md"
    $rel = "docs/superpowers/plans/$date-$slug-audit.md"
    $utf8 = New-Object System.Text.UTF8Encoding $false

    if (Test-Path $path) {
        $text = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
        try { $text = Set-PlanChangeTable -PlanText $text -TableLines $table } catch { Write-Err "${rel}: $($_.Exception.Message)"; return 1 }
        [System.IO.File]::WriteAllText($path, $text, $utf8)
        $verb = 'Refreshed change table in'
    } else {
        $findings = Get-TagAuditFindings -Tag $Tag -Groups $result.Groups -CustomHoi4Dir $CustomHoi4Dir
        $text = New-AuditPlanText -Country $country -Tag $Tag -Date $date -FindingLines (Format-AuditFindingLines -Findings $findings -Tag $Tag) -Summary (Format-AuditSummary -Findings $findings -Tag $Tag) -TableLines $table
        [System.IO.File]::WriteAllText($path, $text, $utf8)
        $verb = 'Created'
    }
    $todos = ([regex]::Matches($text, '<!-- TODO')).Count
    Write-Host "$verb ${rel}: $changedCount changed group(s) vs $($result.Label); $todos TODO section(s) left"
    return 0
}

# --- Helper: Refresh the group rows of a nation's wiki page (display names and sample cells) ---
# Keeps valid samples in order, drops stale ones and tops up from the group to the row's original sample count.
# Returns @{ Text; Changes; Missing (groups without a row); Stale (rows for groups not in the file) }.
function Update-WikiGroupRows {
    param(
        [string]$WikiText,
        [object[]]$Groups,
        [string]$Tag
    )
    $byTag = @{}; foreach ($g in $Groups) { $byTag[$g.GroupTag] = $g }
    $changes = [System.Collections.Generic.List[string]]::new()
    $stale = [System.Collections.Generic.List[string]]::new()
    $seen = @{}
    $lines = @($WikiText -split "`n")
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $cr = if ($lines[$i].EndsWith("`r")) { "`r" } else { '' }
        $raw = $lines[$i].TrimEnd("`r")
        $m = [regex]::Match($raw, "^\|\s*``($([regex]::Escape($Tag))_[A-Z0-9_]+)``\s*\|")
        if (-not $m.Success) { continue }
        $tagName = $m.Groups[1].Value
        $seen[$tagName] = $true
        $g = $byTag[$tagName]
        if (-not $g) { $stale.Add($tagName); continue }

        $cells = $raw.Split('|')
        $last = if ($raw.TrimEnd().EndsWith('|')) { $cells.Count - 2 } else { $cells.Count - 1 }
        if ($last -lt 3) { continue }
        $notes = @()
        if ($g.NameIsLiteral -and $cells[2].Trim() -cne $g.ThemeName) {
            $notes += "name '$($cells[2].Trim())' -> '$($g.ThemeName)'"
            $cells[2] = " $($g.ThemeName) "
        }
        $cell = $cells[$last].Trim()
        if ($cell -and $cell -notmatch '`') {
            $items = @($cell -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ })
            $matchesName = { param($s, $n) $n -cmatch ('(?<![\p{L}\p{N}])' + [regex]::Escape($s) + '(?![\p{L}\p{N}])') }
            $keep = @($items | Where-Object { $s = $_; @($g.Names | Where-Object { & $matchesName $s $_ }).Count -gt 0 })
            # Expand a short form ("Sarmiento") to the single entry it matches ("Domingo Faustino Sarmiento");
            # an ambiguous short form stays as written
            $final = [System.Collections.Generic.List[string]]::new()
            $expanded = @()
            foreach ($s in $keep) {
                $full = $s
                if ($g.Names -cnotcontains $s) {
                    $hits = @($g.Names | Where-Object { & $matchesName $s $_ })
                    if ($hits.Count -eq 1) { $full = $hits[0]; $expanded += "$s -> $full" }
                }
                if (-not $final.Contains($full)) { $final.Add($full) }
            }
            $fill = @($g.Names | Where-Object { $n = $_; @($final | Where-Object { & $matchesName $_ $n }).Count -eq 0 })
            $new = @($final) + @($fill | Select-Object -First ([Math]::Max(0, $items.Count - $final.Count)))
            if (($new -join ', ') -cne ($items -join ', ')) {
                $dropped = @($items | Where-Object { $keep -cnotcontains $_ })
                $addedSamples = @($new | Where-Object { $final -cnotcontains $_ })
                if ($dropped.Count -or $addedSamples.Count) { $notes += "samples -[$($dropped -join ', ')] +[$($addedSamples -join ', ')]" }
                if ($expanded.Count) { $notes += "expanded [$($expanded -join '; ')]" }
                $cells[$last] = " $($new -join ', ') "
            }
        }
        if ($notes.Count) {
            $lines[$i] = ($cells -join '|') + $cr
            $changes.Add("$($tagName -replace "^$([regex]::Escape($Tag))_", ''): $($notes -join '; ')")
        }
    }
    $missing = @($Groups | Where-Object { -not $seen.ContainsKey($_.GroupTag) } | ForEach-Object { $_.GroupTag })
    return @{ Text = ($lines -join "`n"); Changes = $changes.ToArray(); Missing = $missing; Stale = $stale.ToArray() }
}

# --- Helper: Prose lines of a wiki page (group rows excluded) that mention any of the given names ---
# Returns "L<line>: name, name" strings (each name followed by " (<label>)" when -Labels has one), so the caller
# edits those lines without reading the page.
function Find-WikiProseMentions {
    param(
        [string]$WikiText,
        [string[]]$Names,
        [string]$Tag,
        [hashtable]$Labels = @{}
    )
    $out = [System.Collections.Generic.List[string]]::new()
    $patterns = @($Names | Select-Object -Unique | ForEach-Object { @{ Name = $_; Rx = '(?<![\p{L}\p{N}])' + [regex]::Escape($_) + '(?![\p{L}\p{N}])' } })
    $lines = @($WikiText -split "`n")
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $raw = $lines[$i].TrimEnd("`r")
        if ($raw -match "^\|\s*``$([regex]::Escape($Tag))_") { continue }
        $hits = @($patterns | Where-Object { $raw -cmatch $_.Rx } | ForEach-Object { if ($Labels.ContainsKey($_.Name)) { "$($_.Name) ($($Labels[$_.Name]))" } else { $_.Name } })
        if ($hits.Count) { $out.Add("L$($i + 1): $($hits -join ', ')") }
    }
    return , $out.ToArray()
}

# --- Action: Sync a nation's wiki page rows and its wiki/Home.md group count with the namelist ---
function Invoke-SyncWiki {
    param([string]$Tag)
    $Tag = $Tag.ToUpper().Trim()
    $modFile = Join-Path $RepoDir "common\units\names_ships\${Tag}_ship_names.txt"
    if (-not (Test-Path $modFile)) { Write-Err "Mod namelist not found: $modFile"; return 1 }
    $country = Get-CountryName -Tag $Tag
    if (-not $country) { Write-Err "README.md has no row for $Tag"; return 1 }
    $pageName = $country -replace ' ', '-'
    $wikiPath = Join-Path $RepoDir "wiki\$pageName.md"
    if (-not (Test-Path $wikiPath)) { Write-Err "wiki/$pageName.md not found"; return 1 }
    $groups = Get-NamelistGroups -Path $modFile
    $utf8 = New-Object System.Text.UTF8Encoding $false

    $wiki = [System.IO.File]::ReadAllText($wikiPath, [System.Text.Encoding]::UTF8)
    $r = Update-WikiGroupRows -WikiText $wiki -Groups $groups -Tag $Tag
    if ($r.Text -cne $wiki) { [System.IO.File]::WriteAllText($wikiPath, $r.Text, $utf8) }
    Write-Host "wiki/${pageName}.md: $($r.Changes.Count) row(s) updated"
    foreach ($c in $r.Changes) { Write-Host "  $c" }
    if ($r.Missing.Count) { Write-Host "  no row (add by hand): $($r.Missing -join ', ')" }
    if ($r.Stale.Count) { Write-Host "  row for a group not in the file (remove or rename by hand): $($r.Stale -join ', ')" }

    # Prose that mentions names removed or moved between groups since HEAD may describe the old layout
    $diff = $null
    try { $diff = Get-TagNamelistDiff -Tag $Tag -BaseRev 'HEAD' } catch { Write-Host "  prose check skipped: $($_.Exception.Message)" }
    if ($diff) {
        $short = { param($t) $t -replace "^$([regex]::Escape($Tag))_", '' }
        $labels = @{}
        foreach ($from in $diff.Diff) {
            foreach ($nm in $from.Removed) {
                $to = @($diff.Diff | Where-Object { $_.GroupTag -ne $from.GroupTag -and $_.Added -ccontains $nm } | ForEach-Object { & $short $_.GroupTag })
                $labels[$nm] = if ($to.Count) { "moved $(& $short $from.GroupTag)->$($to -join '/')" } else { "removed from $(& $short $from.GroupTag)" }
            }
        }
        $mentions = if ($labels.Count) { Find-WikiProseMentions -WikiText $r.Text -Names @($labels.Keys) -Tag $Tag -Labels $labels } else { @() }
        if ($mentions.Count) {
            Write-Host "  prose mentioning names removed or moved since HEAD (review only these lines):"
            foreach ($m in $mentions) { Write-Host "    $m" }
        }
    }

    $homePath = Join-Path $RepoDir 'wiki\Home.md'
    if (Test-Path $homePath) {
        $homeText = [System.IO.File]::ReadAllText($homePath, [System.Text.Encoding]::UTF8)
        $pattern = "(\|\s*``?$([regex]::Escape($Tag))``?\s*\|\s*)(\d+)(\s*\|)"
        $m = [regex]::Match($homeText, $pattern)
        if (-not $m.Success) {
            Write-Host "wiki/Home.md: no $Tag row (add by hand)"
        } elseif ([int]$m.Groups[2].Value -ne $groups.Count) {
            $homeText = $homeText.Substring(0, $m.Groups[2].Index) + $groups.Count + $homeText.Substring($m.Groups[2].Index + $m.Groups[2].Length)
            [System.IO.File]::WriteAllText($homePath, $homeText, $utf8)
            Write-Host "wiki/Home.md: $Tag group count $($m.Groups[2].Value) -> $($groups.Count)"
        } else {
            Write-Host "wiki/Home.md: $Tag group count $($groups.Count) (unchanged)"
        }
    }
    Write-Host "Prose (overview, scope notes), README and the Workshop block are not edited; lines to review are listed above."
    return 0
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
    Invoke-NamelistAudit -Tag $Audit -TargetGroup $Group -CustomHoi4Dir $Hoi4InstallDir -NamesOnly:$NamesOnly -Sections:$Sections
    exit 0
}

# --- Action: EditNames ---
if ($EditNames) {
    exit (Invoke-NamelistEdit -Tag $EditNames -TargetGroup $Group -AddList $Add -RemoveList $Remove -RenameList $Rename -AfterName $After -SectionName $Section -RenameSectionList $RenameSection -Quiet:$Quiet)
}

# --- Action: DiffNames ---
if ($DiffNames) {
    exit (Invoke-NamelistDiff -Tag $DiffNames -BaseRev $Base)
}

# --- Action: AuditPlan ---
if ($AuditPlan) {
    exit (Invoke-AuditPlan -Tag $AuditPlan -BaseRev $Base -CustomHoi4Dir $Hoi4InstallDir)
}

# --- Action: SyncWiki ---
if ($SyncWiki) {
    exit (Invoke-SyncWiki -Tag $SyncWiki)
}

# --- Action: VerifyShipTypes ---
if ($VerifyShipTypes) {
    exit (Invoke-VerifyShipTypes -Tag $VerifyShipTypes)
}

# --- Action: SyncShipTypeCanon ---
if ($SyncShipTypeCanon) {
    exit (Invoke-SyncShipTypeCanon -CustomHoi4Dir $Hoi4InstallDir -WriteCanon:$Write)
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
        Copy-ModContent -Source $RepoDir -Destination $stageModDir

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
        Copy-ModContent -Source $RepoDir -Destination $stageContent

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

Write-Info "Synchronizing mod content (common/, descriptor.mod, thumbnail.png) and purging anything else..."
Copy-ModContent -Source $RepoDir -Destination $targetDir

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
