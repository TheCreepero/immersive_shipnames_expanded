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

    # Extract all distinct TAGs from ISNE_<TAG>_*.txt
    $files = Get-ChildItem -Path $script:NamelistDir -Filter "ISNE_*.txt"
    $script:ImplementedTags = [System.Collections.Generic.HashSet[string]]::new()
    foreach ($f in $files) {
        if ($f.Name -match '^ISNE_([A-Z0-9]{3})_') {
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
