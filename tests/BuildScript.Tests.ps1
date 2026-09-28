<#
.SYNOPSIS
    Pester unit tests for build.ps1 helper functions and packaging configurations.
#>

BeforeAll {
    $script:RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
    $script:BuildScriptPath = Join-Path $script:RepoRoot "build.ps1"

    # Read build.ps1 script content to extract functions without executing the full script
    $script:BuildContent = [System.IO.File]::ReadAllText($script:BuildScriptPath, [System.Text.Encoding]::UTF8)

    # Dot-source Get-ModMetadata and New-LauncherModContent definitions safely
    $metaFuncMatch = [regex]::Match($script:BuildContent, '(?s)(function Get-ModMetadata\s*\{.*?\n\})')
    $launcherFuncMatch = [regex]::Match($script:BuildContent, '(?s)(function New-LauncherModContent\s*\{.*?\n\})')

    if ($metaFuncMatch.Success) {
        . ([ScriptBlock]::Create($metaFuncMatch.Groups[1].Value))
    }
    if ($launcherFuncMatch.Success) {
        . ([ScriptBlock]::Create($launcherFuncMatch.Groups[1].Value))
    }

    foreach ($fn in @('Get-NamelistGroups', 'Get-NamelistAuditFindings')) {
        $fnMatch = [regex]::Match($script:BuildContent, "(?s)(function $fn\s*\{.*?\n\})")
        if ($fnMatch.Success) {
            . ([ScriptBlock]::Create($fnMatch.Groups[1].Value))
        }
    }

    # Builds a namelist group block for audit fixtures
    function New-FixtureGroup([string]$GroupTag, [string]$Types, [string[]]$Names, [string]$Prefix = '', [string]$Name = 'NAME_THEME_HISTORICAL') {
        $typesLine = if ($Types) { "`tship_types = { $Types }" } else { '' }
        $prefixLine = if ($Prefix) { "`tprefix = `"$Prefix`"" } else { '' }
        $quoted = ($Names | ForEach-Object { "`"$_`"" }) -join ' '
        return "$GroupTag = {`n`tname = $Name`n`tfor_countries = { TST }`n$prefixLine`n`ttype = ship`n$typesLine`n`tfallback_name = `"Ship %d`"`n`tunique = { $quoted }`n}`n"
    }

    function New-NameRange([string]$Stem, [int]$Count) {
        return @(1..$Count | ForEach-Object { "$Stem $_" })
    }

    # A fully compliant TST fixture; tests append or alter groups to trigger single findings
    function Get-CompliantFixtureText([string]$Prefix = 'TNS ') {
        $text = ''
        $text += New-FixtureGroup 'TST_DD_HISTORICAL' 'ship_hull_light destroyer' (New-NameRange 'Dd' 100) $Prefix
        $text += New-FixtureGroup 'TST_SS_HISTORICAL' 'ship_hull_submarine submarine' (New-NameRange 'Ss' 60) $Prefix
        $text += New-FixtureGroup 'TST_CL_HISTORICAL' 'ship_hull_cruiser light_cruiser' (New-NameRange 'Cl' 50) $Prefix
        $text += New-FixtureGroup 'TST_CA_HISTORICAL' 'ship_hull_cruiser heavy_cruiser' (New-NameRange 'Ca' 35) $Prefix
        $text += New-FixtureGroup 'TST_BB_HISTORICAL' 'ship_hull_heavy battleship' (New-NameRange 'Bb' 30) $Prefix
        $text += New-FixtureGroup 'TST_BC_HISTORICAL' 'ship_hull_heavy battle_cruiser' (New-NameRange 'Bc' 30) $Prefix
        $text += New-FixtureGroup 'TST_CV_HISTORICAL' 'ship_hull_carrier carrier' (New-NameRange 'Cv' 30) $Prefix
        foreach ($theme in @('BIRDS', 'FISH', 'CITIES', 'RIVERS', 'HEROES', 'RULERS')) {
            $text += New-FixtureGroup "TST_$theme" '' (New-NameRange $theme 35) $Prefix "`"$theme`""
        }
        return $text
    }

    function Invoke-FixtureAudit([string]$Text) {
        $tempFile = [System.IO.Path]::GetTempFileName()
        try {
            [System.IO.File]::WriteAllText($tempFile, $Text, (New-Object System.Text.UTF8Encoding $false))
            $groups = Get-NamelistGroups -Path $tempFile
            return , (Get-NamelistAuditFindings -Groups $groups -Tag 'TST')
        }
        finally {
            if (Test-Path $tempFile) { Remove-Item -Force $tempFile }
        }
    }
}

Describe "build.ps1 Helper: Get-ModMetadata" {
    It "Parses mod metadata correctly from descriptor file" {
        $tempFile = [System.IO.Path]::GetTempFileName()
        try {
            $sampleDescriptor = @"
version="1.0.0"
tags={
	"Historical"
	"Military"
}
name="Immersive Ship Names Expanded"
supported_version="1.19.*"
remote_file_id="1234567890"
"@
            [System.IO.File]::WriteAllText($tempFile, $sampleDescriptor, [System.Text.Encoding]::UTF8)

            $meta = Get-ModMetadata -Path $tempFile
            $meta.Version | Should -Be "1.0.0"
            $meta.Name | Should -Be "Immersive Ship Names Expanded"
            $meta.SupportedVersion | Should -Be "1.19.*"
            $meta.RemoteFileId | Should -Be "1234567890"
        }
        finally {
            if (Test-Path $tempFile) { Remove-Item -Force $tempFile }
        }
    }
}

Describe "build.ps1 Helper: New-LauncherModContent" {
    It "Normalizes backslashes to forward slashes in target mod path" {
        $tempFile = [System.IO.Path]::GetTempFileName()
        try {
            $sampleDescriptor = @"
version="1.0"
name="Immersive Ship Names Expanded"
supported_version="1.19.*"
"@
            [System.IO.File]::WriteAllText($tempFile, $sampleDescriptor, [System.Text.Encoding]::UTF8)

            $result = New-LauncherModContent -DescriptorPath $tempFile -TargetModPath "C:\Users\User\Documents\Paradox Interactive\Hearts of Iron IV\mod\immersive_shipnames_expanded"
            $result | Should -Match 'path="C:/Users/User/Documents/Paradox Interactive/Hearts of Iron IV/mod/immersive_shipnames_expanded"'
            $result | Should -Not -Match '\\\\'
        }
        finally {
            if (Test-Path $tempFile) { Remove-Item -Force $tempFile }
        }
    }

    It "Places path before remote_file_id when present" {
        $tempFile = [System.IO.Path]::GetTempFileName()
        try {
            $sampleDescriptor = @"
version="1.0"
name="Immersive Ship Names Expanded"
supported_version="1.19.*"
remote_file_id="99999"
"@
            [System.IO.File]::WriteAllText($tempFile, $sampleDescriptor, [System.Text.Encoding]::UTF8)

            $result = New-LauncherModContent -DescriptorPath $tempFile -TargetModPath "mod/immersive_shipnames_expanded"
            $result | Should -Match '(?s)path="mod/immersive_shipnames_expanded".*remote_file_id="99999"'
        }
        finally {
            if (Test-Path $tempFile) { Remove-Item -Force $tempFile }
        }
    }
}

Describe "build.ps1 Packaging & Staging Exclusions" {
    It "Build script must exclude tests directory from packages and deployment" {
        $script:BuildContent | Should -Match "excludeDirs\s*=\s*@\([^)]*['`"]tests['`"]" -Because "tests directory must be excluded from release staging"
    }

    It "Build script must exclude wiki directory from packages and deployment" {
        $script:BuildContent | Should -Match "excludeDirs\s*=\s*@\([^)]*['`"]wiki['`"]" -Because "wiki directory must be excluded from release staging"
    }

    It "Build script must exclude .git and dev tools from packaging" {
        $script:BuildContent | Should -Match "excludeDirs\s*=\s*@\([^)]*['`"]\.git['`"]"
        $script:BuildContent | Should -Match "excludeDirs\s*=\s*@\([^)]*['`"]\.github['`"]"
    }

    It "All excludeDirs definitions in build.ps1 must include wiki and tests" {
        $matches = [regex]::Matches($script:BuildContent, 'excludeDirs\s*=\s*@\([^)]+\)')
        $matches.Count | Should -BeGreaterOrEqual 3
        foreach ($m in $matches) {
            $m.Value | Should -Match "['`"]wiki['`"]" -Because "Every staging and deployment step must exclude wiki"
            $m.Value | Should -Match "['`"]tests['`"]" -Because "Every staging and deployment step must exclude tests"
        }
    }

    It "All excludeDirs and staleDirs definitions in build.ps1 must exclude AI agent config folders" {
        $matches = [regex]::Matches($script:BuildContent, '(excludeDirs|staleDirs)\s*=\s*@\([^)]+\)')
        $matches.Count | Should -BeGreaterOrEqual 4
        foreach ($m in $matches) {
            $m.Value | Should -Match "['`"]\.agents['`"]" -Because "Antigravity agent configuration must never ship in the mod"
            $m.Value | Should -Match "['`"]\.claude['`"]" -Because "Claude Code agent configuration must never ship in the mod"
        }
    }
}

Describe "build.ps1 Helper: Get-NamelistGroups" {
    It "Counts names in unique and ordered blocks" {
        $tempFile = [System.IO.Path]::GetTempFileName()
        try {
            $text = (New-FixtureGroup 'TST_BIRDS' '' @('Eagle', 'Falcon', 'Hawk') '' '"Birds"') +
                "TST_FISH = {`n`tname = `"Fish`"`n`tfallback_name = `"Fish %d`"`n`tordered = {`n`t`t1 = { `"Pike`" }`n`t`t2 = { `"Perch`" }`n`t}`n}`n"
            [System.IO.File]::WriteAllText($tempFile, $text, (New-Object System.Text.UTF8Encoding $false))

            $groups = Get-NamelistGroups -Path $tempFile
            $groups.Count | Should -Be 2
            ($groups | Where-Object GroupTag -eq 'TST_BIRDS').Count | Should -Be 3
            ($groups | Where-Object GroupTag -eq 'TST_BIRDS').NameIsLiteral | Should -BeTrue
            ($groups | Where-Object GroupTag -eq 'TST_FISH').Count | Should -Be 2
        }
        finally {
            if (Test-Path $tempFile) { Remove-Item -Force $tempFile }
        }
    }
}

Describe "build.ps1 Helper: Get-NamelistAuditFindings" {
    It "Reports no FAIL or WARN for a compliant namelist" {
        $findings = Invoke-FixtureAudit (Get-CompliantFixtureText)
        @($findings | Where-Object { $_.Severity -ne 'INFO' }).Count | Should -Be 0
    }

    It "Fails a missing BC group when BB also carries battle_cruiser" {
        $text = (Get-CompliantFixtureText) -replace '(?s)TST_BC_HISTORICAL = \{.*?\n\}\n', ''
        $text = $text -replace 'ship_hull_heavy battleship', 'ship_hull_heavy battleship battle_cruiser'
        $findings = Invoke-FixtureAudit $text
        $f = @($findings | Where-Object { $_.Check -eq 'MissingHull' })
        $f.Count | Should -Be 1
        $f[0].Severity | Should -Be 'FAIL'
        $f[0].Detail | Should -Match 'battle_cruiser'
    }

    It "Fails a name shared between CL and CA" {
        $text = (Get-CompliantFixtureText) -replace '"Ca 1"', '"Cl 1"'
        $findings = Invoke-FixtureAudit $text
        $f = @($findings | Where-Object { $_.Check -eq 'CrossClass' -and $_.Group -eq 'CL/CA' })
        $f.Count | Should -Be 1
        $f[0].Severity | Should -Be 'FAIL'
        $f[0].Detail | Should -Match 'Cl 1'
    }

    It "Fails a prefix without trailing space" {
        $findings = Invoke-FixtureAudit (Get-CompliantFixtureText -Prefix 'TNS')
        @($findings | Where-Object { $_.Check -eq 'PrefixSpace' -and $_.Severity -eq 'FAIL' }).Count | Should -BeGreaterThan 0
    }

    It "Fails a thematic pool missing the national prefix" {
        $text = (Get-CompliantFixtureText) -replace '(TST_BIRDS = \{\n[^\n]*\n[^\n]*\n)\tprefix = "TNS "\n', '$1'
        $findings = Invoke-FixtureAudit $text
        $f = @($findings | Where-Object { $_.Check -eq 'PrefixInconsistent' })
        $f.Count | Should -Be 1
        $f[0].Detail | Should -Match 'BIRDS'
    }

    It "Grades depth as FAIL below floor and WARN between floor and target" {
        $text = (Get-CompliantFixtureText) -replace '"Dd (8[5-9]|9\d|100)" ?', '' -replace '"Ss ([4-9]\d)" ?', ''
        $findings = Invoke-FixtureAudit $text
        ($findings | Where-Object { $_.Check -eq 'Depth' -and $_.Group -eq 'TST_DD_HISTORICAL' }).Severity | Should -Be 'WARN'
        ($findings | Where-Object { $_.Check -eq 'Depth' -and $_.Group -eq 'TST_SS_HISTORICAL' }).Severity | Should -Be 'FAIL'
    }

    It "Never fails a short thematic pool (depth applies where thematic scope permits)" {
        $text = (Get-CompliantFixtureText) -replace '"BIRDS ([1-3]\d)" ?', ''
        $findings = Invoke-FixtureAudit $text
        ($findings | Where-Object { $_.Check -eq 'Depth' -and $_.Group -eq 'TST_BIRDS' }).Severity | Should -Be 'WARN'
    }
}

Describe "build.ps1 -Audit action" {
    It "Audits an implemented nation, exits 0 and prints the summary line" {
        $output = & powershell -NoProfile -File $script:BuildScriptPath -Audit FIN 2>&1 | Out-String
        $LASTEXITCODE | Should -Be 0
        $output | Should -Match 'AUDIT SUMMARY FIN: FAIL=\d+ WARN=\d+ INFO=\d+'
    }
}
