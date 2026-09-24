<#
.SYNOPSIS
    Pushes the wiki/ directory contents to the GitHub wiki repository.

.DESCRIPTION
    GitHub wikis are hosted in a separate git repository at:
        https://github.com/<owner>/<repo>.wiki.git
    
    This script:
      1. Clones the wiki repo to a temp directory (or reuses an existing clone)
      2. Copies all .md files from the wiki/ source directory
      3. Commits and pushes

.PARAMETER CommitMessage
    Optional commit message. Defaults to "Update wiki from source".

.PARAMETER DryRun
    If set, shows what would be done without pushing.

.EXAMPLE
    .\wiki\push-wiki.ps1
    .\wiki\push-wiki.ps1 -CommitMessage "Add Sweden page"
    .\wiki\push-wiki.ps1 -DryRun
#>
param(
    [string]$CommitMessage = "Update wiki from source",
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

$RepoRoot   = Split-Path -Parent $PSScriptRoot
$WikiSource = Join-Path $RepoRoot "wiki"
$WikiRemote = "https://github.com/TheCreepero/immersive_shipnames_expanded.wiki.git"
$WikiClone = Join-Path ([System.IO.Path]::GetTempPath()) "isne_wiki_push"

Write-Host "=== ISNE Wiki Push Script ===" -ForegroundColor Cyan
Write-Host "Source : $WikiSource"
Write-Host "Remote : $WikiRemote"
Write-Host "Temp   : $WikiClone"
if ($DryRun) { Write-Host "[DRY RUN - no changes will be pushed]" -ForegroundColor Yellow }
Write-Host ""

# --- Step 1: Clone or update the wiki repo ---
if (Test-Path -LiteralPath $WikiClone) {
    Write-Host "Updating existing wiki clone..." -ForegroundColor Yellow
    git -C $WikiClone fetch origin
    git -C $WikiClone reset --hard origin/master 2>$null
    if ($LASTEXITCODE -ne 0) {
        git -C $WikiClone reset --hard origin/main 2>$null
    }
} else {
    Write-Host "Cloning wiki repository..." -ForegroundColor Yellow
    git clone $WikiRemote $WikiClone
    if ($LASTEXITCODE -ne 0) {
        Write-Error 'Failed to clone wiki. Make sure the wiki has been initialized on GitHub (create at least one page via the web UI first).'
        exit 1
    }
}

# --- Step 2: Copy wiki source files ---
Write-Host "Copying wiki pages..." -ForegroundColor Yellow
$mdFiles = Get-ChildItem -Path $WikiSource -Filter "*.md"
foreach ($f in $mdFiles) {
    $dest = Join-Path $WikiClone $f.Name
    Write-Host "  -> $($f.Name)"
    if (-not $DryRun) {
        Copy-Item -LiteralPath $f.FullName -Destination $dest -Force
    }
}

# --- Step 3: Commit and push ---
$status = git -C $WikiClone status --porcelain
if (-not $status) {
    Write-Host ""
    Write-Host "Nothing to commit - wiki is already up to date." -ForegroundColor Green
    exit 0
}

Write-Host ""
Write-Host "Files changed:" -ForegroundColor Yellow
git -C $WikiClone status --short

if (-not $DryRun) {
    git -C $WikiClone add -A
    git -C $WikiClone commit -m $CommitMessage
    git -C $WikiClone push origin HEAD
    Write-Host ""
    Write-Host "Wiki pushed successfully!" -ForegroundColor Green
    Write-Host "View at: https://github.com/TheCreepero/immersive_shipnames_expanded/wiki"
} else {
    Write-Host ""
    Write-Host "[DRY RUN] Would commit: $CommitMessage" -ForegroundColor Yellow
    Write-Host "[DRY RUN] Would push to: $WikiRemote"
}
