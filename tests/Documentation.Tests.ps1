<#
.SYNOPSIS
    Pester tests for documentation synchronization and mod metadata integrity.
#>

BeforeAll {
    $script:RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
    $script:DescriptorPath = Join-Path $script:RepoRoot "descriptor.mod"
    $script:ThumbnailPath = Join-Path $script:RepoRoot "thumbnail.png"
    $script:ReadmePath = Join-Path $script:RepoRoot "README.md"
    $script:WorkshopGuidePath = Join-Path $script:RepoRoot "WORKSHOP_DESCRIPTION_GUIDELINES.md"
    $script:NamelistDir = Join-Path $script:RepoRoot "common\units\names_ships"

    # Extract all distinct TAGs from <TAG>_ship_names.txt (or legacy ISNE_<TAG>_*.txt)
    $files = Get-ChildItem -Path $script:NamelistDir -Filter "*_ship_names.txt"
    $script:ImplementedTags = [System.Collections.Generic.HashSet[string]]::new()
    foreach ($f in $files) {
        if ($f.Name -match '^(?:ISNE_)?([A-Z0-9]{3})_') {
            [void]$script:ImplementedTags.Add($matches[1])
        }
    }
}

Describe "Mod Metadata & Assets" {
    It "descriptor.mod must exist and define required attributes" {
        (Test-Path $script:DescriptorPath) | Should -BeTrue

        $content = [System.IO.File]::ReadAllText($script:DescriptorPath, [System.Text.Encoding]::UTF8)
        $content | Should -Match 'name\s*=\s*"[^"]+"'
        $content | Should -Match 'version\s*=\s*"[^"]+"'
        $content | Should -Match 'supported_version\s*=\s*"[^"]+"'
        $content | Should -Match 'tags\s*=\s*\{'
    }

    It "thumbnail.png must be under 1MB if present" {
        if (Test-Path $script:ThumbnailPath) {
            $item = Get-Item $script:ThumbnailPath
            $item.Length | Should -BeLessThan 1048576 -Because "Steam Workshop limits thumbnail file size to 1MB"
        }
    }
}

Describe "Documentation Synchronization: README.md" {
    BeforeAll {
        $script:ReadmeContent = [System.IO.File]::ReadAllText($script:ReadmePath, [System.Text.Encoding]::UTF8)
    }

    It "README.md must exist" {
        (Test-Path $script:ReadmePath) | Should -BeTrue
    }

    It "Every implemented nation tag must be listed in README.md" {
        foreach ($tag in $script:ImplementedTags) {
            $pattern = "\|\s*[`]?" + [regex]::Escape($tag) + "[`]?\s*\|"
            $script:ReadmeContent | Should -Match $pattern -Because "Tag '$tag' must be documented in the README Included Nations table"
        }
    }
}

Describe "Documentation Synchronization: WORKSHOP_DESCRIPTION_GUIDELINES.md" {
    BeforeAll {
        $script:GuideContent = [System.IO.File]::ReadAllText($script:WorkshopGuidePath, [System.Text.Encoding]::UTF8)
    }

    It "WORKSHOP_DESCRIPTION_GUIDELINES.md must exist" {
        (Test-Path $script:WorkshopGuidePath) | Should -BeTrue
    }

    It "Every implemented nation tag must be listed in the repository cross-reference table" {
        foreach ($tag in $script:ImplementedTags) {
            $pattern = "\|\s*[`]?" + [regex]::Escape($tag) + "[`]?\s*\|"
            $script:GuideContent | Should -Match $pattern -Because "Tag '$tag' must be present in the cross-reference table"
        }
    }
}

Describe "Documentation Synchronization: Wiki" {
    BeforeAll {
        $script:WikiDir = Join-Path $script:RepoRoot "wiki"
        $script:WikiHomePath = Join-Path $script:WikiDir "Home.md"
        $script:WikiSidebarPath = Join-Path $script:WikiDir "_Sidebar.md"

        if (Test-Path $script:WikiHomePath) {
            $script:WikiHomeContent = [System.IO.File]::ReadAllText($script:WikiHomePath, [System.Text.Encoding]::UTF8)
        }
        if (Test-Path $script:WikiSidebarPath) {
            $script:WikiSidebarContent = [System.IO.File]::ReadAllText($script:WikiSidebarPath, [System.Text.Encoding]::UTF8)
        }
    }

    It "wiki/Home.md and wiki/_Sidebar.md must exist" {
        (Test-Path $script:WikiHomePath) | Should -BeTrue
        (Test-Path $script:WikiSidebarPath) | Should -BeTrue
    }

    It "Every implemented nation tag must be indexed in wiki/Home.md" {
        foreach ($tag in $script:ImplementedTags) {
            $pattern = "\|\s*[`]?" + [regex]::Escape($tag) + "[`]?\s*\|"
            $script:WikiHomeContent | Should -Match $pattern -Because "Tag '$tag' must be indexed in the wiki/Home.md table"
        }
    }

    It "A nation wiki page must exist for every implemented tag" {
        $wikiFiles = Get-ChildItem -Path $script:WikiDir -Filter "*.md" | Where-Object { $_.Name -notin @('Home.md', '_Sidebar.md', 'Contributing.md', 'Engine-Mechanics.md') }
        $wikiContents = $wikiFiles | ForEach-Object { [System.IO.File]::ReadAllText($_.FullName, [System.Text.Encoding]::UTF8) }

        foreach ($tag in $script:ImplementedTags) {
            $tagMatched = $false
            foreach ($wc in $wikiContents) {
                if ($wc -match "\b(?:ISNE_)?${tag}_ship_names\.txt\b" -or $wc -match "\($tag\)") {
                    $tagMatched = $true
                    break
                }
            }
            $tagMatched | Should -BeTrue -Because "A wiki documentation page referencing '$tag' must exist in wiki/"
        }
    }
}

BeforeDiscovery {
    $script:MirrorPairs = @(
        @{ Claude = 'CLAUDE.md'; Gemini = 'GEMINI.md' }
        @{ Claude = '.claude/skills/hoi4-isne-ship-namelist-authoring/SKILL.md'; Gemini = '.agents/skills/hoi4-isne-ship-namelist-authoring/SKILL.md' }
        @{ Claude = '.claude/skills/hoi4-isne-namelist-audit/SKILL.md'; Gemini = '.agents/skills/hoi4-isne-namelist-audit/SKILL.md' }
    )
}

Describe "Agent Config Mirrors (CLAUDE.md / GEMINI.md section 9)" {
    BeforeAll {
        # Mirrors are kept line-for-line; a line may differ only when it carries tool-specific wording.
        $script:ToolMarker = 'invoke_subagent|Agent tool|Antigravity|Claude Code|[Mm]odel:|Sonnet|flash|Mirror'
        $script:AntigravitySkills = @(
            '.agents/skills/hoi4-isne-ship-namelist-authoring/SKILL.md'
            '.agents/skills/hoi4-isne-namelist-audit/SKILL.md'
        )
        function Get-MirrorLines([string]$RelPath) {
            $text = [System.IO.File]::ReadAllText((Join-Path $script:RepoRoot $RelPath), [System.Text.Encoding]::UTF8)
            $text = $text -replace 'GEMINI\.md', 'CLAUDE.md' -replace '\.agents/skills', '.claude/skills'
            return @($text -split '\r?\n')
        }
    }

    It "<Gemini> mirrors <Claude> except for tool-specific lines" -TestCases $script:MirrorPairs {
        param($Claude, $Gemini)
        $a = Get-MirrorLines $Claude
        $b = Get-MirrorLines $Gemini
        $b.Count | Should -Be $a.Count -Because "mirrors must stay line-for-line; apply every rule change to both files"
        $drift = for ($i = 0; $i -lt $a.Count; $i++) {
            if ($a[$i] -cne $b[$i] -and -not ($a[$i] -match $script:ToolMarker -and $b[$i] -match $script:ToolMarker)) { "line $($i + 1)" }
        }
        $drift | Should -BeNullOrEmpty -Because "only lines with tool-specific wording may differ"
    }

    It "Audit researcher stays budgeted (effort, maxTurns, web-only tools, stated call budget)" {
        $text = [System.IO.File]::ReadAllText((Join-Path $script:RepoRoot '.claude/agents/isne-audit-researcher.md'), [System.Text.Encoding]::UTF8)
        $front = [regex]::Match($text, '(?s)^---\r?\n(.*?)\r?\n---').Groups[1].Value
        $front | Should -Match '(?m)^effort:\s*(low|medium)\s*$' -Because "audit research is lookup work; high effort multiplies thinking tokens"
        $turns = [regex]::Match($front, '(?m)^maxTurns:\s*(\d+)\s*$')
        $turns.Success | Should -BeTrue -Because "a hard turn cap stops runaway research"
        [int]$turns.Groups[1].Value | Should -BeLessOrEqual 40
        $tools = [regex]::Match($front, '(?m)^tools:\s*(.+)$').Groups[1].Value
        $tools | Should -Not -Match '\b(Read|Grep|Glob|Bash|PowerShell|Write|Edit)\b' -Because "group names are pasted into the prompt; the namelist is never opened"
        $text | Should -Match 'at most \d+ web calls'
    }

    It "Subagent briefs referenced by the Antigravity skills exist" {
        foreach ($skill in $script:AntigravitySkills) {
            $text = [System.IO.File]::ReadAllText((Join-Path $script:RepoRoot $skill), [System.Text.Encoding]::UTF8)
            foreach ($m in [regex]::Matches($text, '\.claude/agents/[\w-]+\.md')) {
                (Test-Path (Join-Path $script:RepoRoot $m.Value)) | Should -BeTrue -Because "$skill dispatches $($m.Value)"
            }
        }
    }
}
