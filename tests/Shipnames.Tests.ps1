<#
.SYNOPSIS
    Pester unit and invariant tests for Hearts of Iron IV ship namelist files.
#>

BeforeAll {
    $script:RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
    $script:NamelistDir = Join-Path $script:RepoRoot "common\units\names_ships"

    $script:ValidShipTypeTokens = @(
        'battle_cruiser', 'battleship', 'capital_ship', 'carrier', 'destroyer',
        'heavy_cruiser', 'light_cruiser', 'screen_ship', 'ship_hull_carrier',
        'ship_hull_cruiser', 'ship_hull_cruiser_submarine', 'ship_hull_heavy',
        'ship_hull_light', 'ship_hull_midget_submarine', 'ship_hull_submarine', 'submarine'
    )

    $script:NamelistFiles = Get-ChildItem -Path $script:NamelistDir -Filter "ISNE_*.txt"
}

Describe "Ship Namelist Files: Global Invariants" {
    It "Should find ship namelist files in common/units/names_ships" {
        $script:NamelistFiles.Count | Should -BeGreaterThan 0
    }

    It "All root group tags across all files must be globally unique" {
        $allGroups = @{}
        $duplicates = [System.Collections.Generic.List[string]]::new()

        foreach ($file in $script:NamelistFiles) {
            $lines = [System.IO.File]::ReadAllLines($file.FullName, [System.Text.Encoding]::UTF8)
            $depth = 0
            for ($i = 0; $i -lt $lines.Length; $i++) {
                $clean = ($lines[$i] -replace '#.*$', '').Trim()
                if ([string]::IsNullOrWhiteSpace($clean)) { continue }

                if ($depth -eq 0) {
                    $m = [regex]::Match($clean, '^([A-Za-z][A-Za-z0-9_]*)\s*=\s*\{?')
                    if ($m.Success -and $clean -notmatch '^(ordered|unique|ship_types|for_countries|can_use|link_numbering_with|type|prefix|fallback_name)\b') {
                        $gtag = $m.Groups[1].Value
                        if ($allGroups.ContainsKey($gtag)) {
                            $duplicates.Add("Duplicate '$gtag' in $($file.Name) (first defined in $($allGroups[$gtag]))")
                        } else {
                            $allGroups[$gtag] = $file.Name
                        }
                    }
                }

                $openB = ([regex]::Matches($clean, '\{')).Count
                $closeB = ([regex]::Matches($clean, '\}')).Count
                $depth += ($openB - $closeB)
            }
        }

        $duplicates | Should -BeNullOrEmpty
    }
}

Describe "Ship Namelist Files: Per-File Invariants" {
    BeforeAll {
        $files = Get-ChildItem -Path (Join-Path (Resolve-Path (Join-Path $PSScriptRoot "..")) "common\units\names_ships") -Filter "ISNE_*.txt"
    }

    Context "File: <_.Name>" -ForEach (Get-ChildItem -Path (Join-Path (Resolve-Path (Join-Path $PSScriptRoot "..")) "common\units\names_ships") -Filter "ISNE_*.txt") {
        BeforeAll {
            $script:CurrentFile = $_
            $script:RawBytes = [System.IO.File]::ReadAllBytes($script:CurrentFile.FullName)
            $script:FileText = [System.IO.File]::ReadAllText($script:CurrentFile.FullName, [System.Text.Encoding]::UTF8)
            $script:CleanText = ($script:FileText -replace '(?m)#.*$', '')
        }

        It "Must be saved as UTF-8 without BOM" {
            $hasBom = ($script:RawBytes.Length -ge 3 -and $script:RawBytes[0] -eq 0xEF -and $script:RawBytes[1] -eq 0xBB -and $script:RawBytes[2] -eq 0xBF)
            $hasBom | Should -BeFalse
        }

        It "Must have strictly balanced curly braces" {
            $openB = ([regex]::Matches($script:CleanText, '\{')).Count
            $closeB = ([regex]::Matches($script:CleanText, '\}')).Count
            $openB | Should -Be $closeB
        }

        It "Must have balanced double quotes" {
            $quoteCount = ([regex]::Matches($script:CleanText, '"')).Count
            ($quoteCount % 2) | Should -Be 0
        }

        It "Must not contain empty unique or ordered blocks" {
            $emptyUnique = [regex]::Matches($script:CleanText, 'unique\s*=\s*\{\s*\}')
            $emptyUnique.Count | Should -Be 0

            $emptyOrdered = [regex]::Matches($script:CleanText, 'ordered\s*=\s*\{\s*\}')
            $emptyOrdered.Count | Should -Be 0
        }

        It "All integer keys in ordered blocks must be unique within their group" {
            $orderedBlocks = [regex]::Matches($script:CleanText, 'ordered\s*=\s*\{(?<content>(?:[^{}]*|\{[^{}]*\})*)\}')
            foreach ($ob in $orderedBlocks) {
                $block = $ob.Groups['content'].Value
                $keys = [regex]::Matches($block, '(?m)^\s*(\d+)\s*=') | ForEach-Object { $_.Groups[1].Value }
                $duplicateKeys = $keys | Group-Object | Where-Object { $_.Count -gt 1 } | ForEach-Object { $_.Name }
                $duplicateKeys | Should -BeNullOrEmpty
            }
        }

        It "Every fallback_name must include an ordinal placeholder (%d or %s)" {
            $fallbacks = [regex]::Matches($script:CleanText, 'fallback_name\s*=\s*"([^"]+)"')
            foreach ($fb in $fallbacks) {
                $name = $fb.Groups[1].Value
                $name | Should -Match '(%d|%s)'
            }
        }

        It "All tokens in ship_types must be recognized ship subunit tokens" {
            $typeBlocks = [regex]::Matches($script:CleanText, 'ship_types\s*=\s*\{([^}]*)\}')
            foreach ($tb in $typeBlocks) {
                $tokens = [regex]::Matches($tb.Groups[1].Value, '([A-Za-z0-9_]+)') | ForEach-Object { $_.Groups[1].Value }
                foreach ($token in $tokens) {
                    $script:ValidShipTypeTokens -contains $token | Should -BeTrue -Because "'$token' must be an approved ship type subunit token"
                }
            }
        }

        It "link_numbering_with must not be self-referential" {
            $lines = [System.IO.File]::ReadAllLines($script:CurrentFile.FullName, [System.Text.Encoding]::UTF8)
            $currentGroup = $null
            $depth = 0
            for ($i = 0; $i -lt $lines.Length; $i++) {
                $clean = ($lines[$i] -replace '#.*$', '').Trim()
                if ([string]::IsNullOrWhiteSpace($clean)) { continue }

                if ($depth -eq 0) {
                    $gm = [regex]::Match($clean, '^([A-Za-z][A-Za-z0-9_]*)\s*=\s*\{?')
                    if ($gm.Success -and $clean -notmatch '^(ordered|unique|ship_types|for_countries|can_use|link_numbering_with|type|prefix|fallback_name)\b') {
                        $currentGroup = $gm.Groups[1].Value
                    }
                }

                $lm = [regex]::Match($clean, 'link_numbering_with\s*=\s*\{([^}]*)\}')
                if ($lm.Success) {
                    $targets = [regex]::Matches($lm.Groups[1].Value, '([A-Za-z0-9_]+)') | ForEach-Object { $_.Groups[1].Value }
                    foreach ($target in $targets) {
                        $target | Should -Not -Be $currentGroup -Because "group '$currentGroup' cannot link to itself"
                    }
                }

                $depth += (([regex]::Matches($clean, '\{')).Count - ([regex]::Matches($clean, '\}')).Count)
            }
        }

        It "All root group tags must follow the standard naming convention" {
            $lines = [System.IO.File]::ReadAllLines($script:CurrentFile.FullName, [System.Text.Encoding]::UTF8)
            $depth = 0
            for ($i = 0; $i -lt $lines.Length; $i++) {
                $clean = ($lines[$i] -replace '#.*$', '').Trim()
                if ([string]::IsNullOrWhiteSpace($clean)) { continue }

                if ($depth -eq 0) {
                    $gm = [regex]::Match($clean, '^([A-Za-z][A-Za-z0-9_]*)\s*=\s*\{?')
                    if ($gm.Success -and $clean -notmatch '^(ordered|unique|ship_types|for_countries|can_use|link_numbering_with|type|prefix|fallback_name)\b') {
                        $tag = $gm.Groups[1].Value
                        $tag | Should -Match '^[A-Z0-9]{3}_[A-Z0-9_]+$' -Because "group tag '$tag' in $($script:CurrentFile.Name) should match standard pattern"
                    }
                }

                $depth += (([regex]::Matches($clean, '\{')).Count - ([regex]::Matches($clean, '\}')).Count)
            }
        }

        It "All explicit group display names (name = `"...`") must not exceed 32 characters" {
            $displayNameMatches = [regex]::Matches($script:CleanText, 'name\s*=\s*"([^"]+)"')
            foreach ($nm in $displayNameMatches) {
                $dispName = $nm.Groups[1].Value
                $dispName.Length | Should -BeLessOrEqual 32 -Because "Display name '$dispName' in $($script:CurrentFile.Name) should fit within in-game UI dropdown width (<= 32 characters)"
            }
        }

        It "Every defined prefix must end with trailing whitespace" {
            $prefixMatches = [regex]::Matches($script:CleanText, 'prefix\s*=\s*"([^"]*)"')
            foreach ($pm in $prefixMatches) {
                $prefixVal = $pm.Groups[1].Value
                $prefixVal | Should -Match '\s$' -Because "Prefix '$prefixVal' in $($script:CurrentFile.Name) must include a trailing space to prevent engine name concatenation"
            }
        }

        It "Ship names in unique blocks must not contain duplicates within the same group" {
            $uniqueBlocks = [regex]::Matches($script:CleanText, 'unique\s*=\s*\{(?<content>[^}]+)\}')
            foreach ($ub in $uniqueBlocks) {
                $content = $ub.Groups['content'].Value
                $names = [regex]::Matches($content, '"([^"]+)"') | ForEach-Object { $_.Groups[1].Value }
                $duplicates = $names | Group-Object | Where-Object { $_.Count -gt 1 } | ForEach-Object { $_.Name }
                $duplicates | Should -BeNullOrEmpty -Because "Ship names in unique block in $($script:CurrentFile.Name) must not be duplicated within the same group"
            }
        }
    }
}
