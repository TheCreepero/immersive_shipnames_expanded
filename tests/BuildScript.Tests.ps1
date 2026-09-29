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

    $script:Canon = [System.IO.File]::ReadAllText((Join-Path $script:RepoRoot "data\ship_types_canon.json"), [System.Text.Encoding]::UTF8) | ConvertFrom-Json

    foreach ($fn in @('Get-NamelistGroups', 'Get-NamelistAuditFindings', 'Get-ShipTypeFindings', 'Get-ShipTypeCanon', 'Get-RolePoolSuffixes', 'Get-NameVariantKey', 'Edit-NamelistGroupText')) {
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

    function Invoke-FixtureAudit([string]$Text, [string]$RepoDir) {
        $tempFile = [System.IO.Path]::GetTempFileName()
        try {
            [System.IO.File]::WriteAllText($tempFile, $Text, (New-Object System.Text.UTF8Encoding $false))
            $groups = Get-NamelistGroups -Path $tempFile
            return , (Get-NamelistAuditFindings -Groups $groups -Tag 'TST' -RepoDir $RepoDir -Canon $script:Canon)
        }
        finally {
            if (Test-Path $tempFile) { Remove-Item -Force $tempFile }
        }
    }

    function Invoke-FixtureTypeCheck([string]$Text) {
        $tempFile = [System.IO.Path]::GetTempFileName()
        try {
            [System.IO.File]::WriteAllText($tempFile, $Text, (New-Object System.Text.UTF8Encoding $false))
            $groups = Get-NamelistGroups -Path $tempFile
            $findings = Get-ShipTypeFindings -Groups $groups -Canon $script:Canon
            return $findings
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

Describe "build.ps1 Packaging & Staging Whitelist" {
    It "Defines a mod content whitelist limited to common, descriptor.mod and thumbnail.png" {
        $script:BuildContent | Should -Match "ModContentDirs\s*=\s*@\('common'\)"
        $script:BuildContent | Should -Match "ModContentFiles\s*=\s*@\('descriptor\.mod',\s*'thumbnail\.png'\)"
    }

    It "Package, Workshop upload and Deploy all copy through Copy-ModContent" {
        ([regex]::Matches($script:BuildContent, 'Copy-ModContent\s+-Source')).Count | Should -BeGreaterOrEqual 3
    }

    It "Never copies the repo root wholesale with robocopy" {
        $script:BuildContent | Should -Not -Match 'robocopy\.exe\s+\$RepoDir'
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

    It "Warns on spelling variants of one name across major hulls (CrossClassVariant), not on exact repeats" {
        $text = (Get-CompliantFixtureText) -replace '"Ca 1"', '"Gustav V"' -replace '"Bb 1"', '"Gustaf V"'
        $findings = Invoke-FixtureAudit $text
        $f = @($findings | Where-Object { $_.Check -eq 'CrossClassVariant' })
        $f.Count | Should -Be 1
        $f[0].Severity | Should -Be 'WARN'
        $f[0].Group | Should -Be 'CA/BB'
        $f[0].Detail | Should -Match 'Gustav V ~ Gustaf V'
        @($findings | Where-Object { $_.Check -eq 'CrossClass' }).Count | Should -Be 0

        $exact = (Get-CompliantFixtureText) -replace '"Ca 1"', '"Cl 1"'
        @(Invoke-FixtureAudit $exact | Where-Object { $_.Check -eq 'CrossClassVariant' }).Count | Should -Be 0
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

    It "Grades role pools (Target 20, Floor 10) as WARN only and keeps them out of the thematic pool count" {
        $role = New-FixtureGroup 'TST_MINELAYERS' '' (New-NameRange 'Ml' 20) 'TNS ' '"Minelayers"'
        $full = Invoke-FixtureAudit ((Get-CompliantFixtureText) + $role)
        @($full | Where-Object { $_.Severity -ne 'INFO' }).Count | Should -Be 0

        $noTheme = ((Get-CompliantFixtureText) -replace '(?s)TST_RIVERS = \{.*?\n\}\n', '') + $role
        $themeFindings = Invoke-FixtureAudit $noTheme
        $themeCount = @($themeFindings | Where-Object { $_.Check -eq 'ThemeCount' })
        $themeCount.Count | Should -Be 1
        $themeCount[0].Detail | Should -Match '^5 thematic pools'

        $short = New-FixtureGroup 'TST_MINELAYERS' '' (New-NameRange 'Ml' 8) 'TNS ' '"Minelayers"'
        $shortFindings = Invoke-FixtureAudit ((Get-CompliantFixtureText) + $short)
        $depth = @($shortFindings | Where-Object { $_.Check -eq 'Depth' -and $_.Group -eq 'TST_MINELAYERS' })
        $depth.Count | Should -Be 1
        $depth[0].Severity | Should -Be 'WARN'
    }

    It "Fails role pool names shared with CL and warns on names shared with DD (RoleOverlap)" {
        $names = @('Cl 1', 'Dd 1') + (New-NameRange 'Ml' 18)
        $role = New-FixtureGroup 'TST_ESCORT_CARRIERS' '' $names 'TNS ' '"Escort Carriers"'
        $findings = Invoke-FixtureAudit ((Get-CompliantFixtureText) + $role)
        $f = @($findings | Where-Object { $_.Check -eq 'RoleOverlap' })
        $f.Count | Should -Be 2
        ($f | Where-Object { $_.Group -eq 'TST_ESCORT_CARRIERS/CL' }).Severity | Should -Be 'FAIL'
        ($f | Where-Object { $_.Group -eq 'TST_ESCORT_CARRIERS/DD' }).Severity | Should -Be 'WARN'
    }

    It "Treats an unlisted role-like pool as an ordinary thematic pool" {
        $odd = New-FixtureGroup 'TST_RIVER_FLOTILLA' '' (New-NameRange 'Rf' 20) 'TNS ' '"River Flotilla"'
        $findings = Invoke-FixtureAudit ((Get-CompliantFixtureText) + $odd)
        $f = @($findings | Where-Object { $_.Check -eq 'Depth' -and $_.Group -eq 'TST_RIVER_FLOTILLA' })
        $f.Count | Should -Be 1
        $f[0].Detail | Should -Match 'target 35'
    }

    It "Warns on wiki sample names missing from their group, accepting shortened forms" {
        $repo = Join-Path ([System.IO.Path]::GetTempPath()) ("isne_fixture_" + [guid]::NewGuid().ToString('N'))
        try {
            New-Item -ItemType Directory -Force (Join-Path $repo 'wiki') | Out-Null
            $utf8 = New-Object System.Text.UTF8Encoding $false
            [System.IO.File]::WriteAllText((Join-Path $repo 'README.md'), "| ``TST`` | Testland | ``TST_ship_names.txt`` |`n", $utf8)
            $wiki = "| ``TST_CL_HISTORICAL`` | Light Cruisers | ``ship_hull_cruiser light_cruiser`` | Cl 1, Cl 2, Gone Name |`n" +
                    "| ``TST_BIRDS`` | BIRDS | Universal | BIRDS 7, 35, Bb 1`n"
            [System.IO.File]::WriteAllText((Join-Path $repo 'wiki\Testland.md'), $wiki, $utf8)

            $findings = Invoke-FixtureAudit (Get-CompliantFixtureText) $repo
            $f = @($findings | Where-Object { $_.Check -eq 'DocsWikiSamples' })
            $f.Count | Should -Be 1
            $f[0].Severity | Should -Be 'WARN'
            $f[0].Detail | Should -Match 'CL_HISTORICAL: Gone Name'
            $f[0].Detail | Should -Match 'BIRDS: Bb 1'
            $f[0].Detail | Should -Not -Match 'Cl 1|BIRDS 7|: 35'
        }
        finally {
            if (Test-Path $repo) { Remove-Item -Recurse -Force $repo }
        }
    }
}

Describe "build.ps1 Helper: Get-NameVariantKey" {
    It "Folds orthographic variants of the same name" {
        $o = [string][char]0x00F6
        (Get-NameVariantKey 'Gustav V') | Should -Be (Get-NameVariantKey 'Gustaf V')
        (Get-NameVariantKey "G${o}ta Lejon") | Should -Be (Get-NameVariantKey "G${o}talejon")
        (Get-NameVariantKey 'Lennart Torstenson') | Should -Be (Get-NameVariantKey 'Lennart Torstensson')
        (Get-NameVariantKey 'Wasa') | Should -Be (Get-NameVariantKey 'Vasa')
        (Get-NameVariantKey 'Carl Gustaf') | Should -Be (Get-NameVariantKey 'Karl Gustav')
        (Get-NameVariantKey 'Thordon') | Should -Be (Get-NameVariantKey "Tord${o}n")
    }

    It "Keeps distinct names and exonyms apart" {
        (Get-NameVariantKey 'Gustav IV') | Should -Not -Be (Get-NameVariantKey 'Gustav V')
        (Get-NameVariantKey 'Oscar I') | Should -Not -Be (Get-NameVariantKey 'Oscar II')
        (Get-NameVariantKey 'Scania') | Should -Not -Be (Get-NameVariantKey "Sk$([char]0x00E5)ne")
    }
}

Describe "build.ps1 Helper: Edit-NamelistGroupText" {
    BeforeAll {
        $script:EditFixture = "TST_CA_HISTORICAL = {`n`tname = NAME_THEME_HISTORICAL_CA`n`tship_types = { ship_hull_cruiser heavy_cruiser }`n`tprefix = `"TNS `"`n`tunique = {`n`t`t# Ships`n`t`t`"Alpha`" `"Beta`" `"Gamma`"`n`t`t`"Delta`"`n`t}`n}`n" +
            "TST_BIRDS = {`n`tname = `"Birds`"`n`tunique = { `"Alpha`" `"Delta`" }`n}`n"
        function Get-FixtureNames([string]$Text, [string]$Tag) {
            $tempFile = [System.IO.Path]::GetTempFileName()
            try {
                [System.IO.File]::WriteAllText($tempFile, $Text, (New-Object System.Text.UTF8Encoding $false))
                $groups = Get-NamelistGroups -Path $tempFile
                return , @(($groups | Where-Object { $_.GroupTag -eq $Tag }).Names)
            }
            finally {
                if (Test-Path $tempFile) { Remove-Item -Force $tempFile }
            }
        }
    }

    It "Renames in place, removes, and appends on a new line with the block's indentation" {
        $out = Edit-NamelistGroupText -Text $script:EditFixture -GroupTag 'TST_CA_HISTORICAL' -Rename @('Beta=Bravo') -Remove @('Delta') -Add @('Echo', 'Foxtrot')
        (Get-FixtureNames $out 'TST_CA_HISTORICAL') -join ',' | Should -Be 'Alpha,Bravo,Gamma,Echo,Foxtrot'
        $out | Should -Match "`t`t# Ships`n`t`t`"Alpha`" `"Bravo`" `"Gamma`"`n`t`t`"Echo`" `"Foxtrot`"`n`t\}"
        (Get-FixtureNames $out 'TST_BIRDS') -join ',' | Should -Be 'Alpha,Delta'
    }

    It "Inserts after an anchor name and removes the first entry of a line cleanly" {
        $out = Edit-NamelistGroupText -Text $script:EditFixture -GroupTag 'TST_CA_HISTORICAL' -Add @('Echo') -After 'Alpha'
        (Get-FixtureNames $out 'TST_CA_HISTORICAL') -join ',' | Should -Be 'Alpha,Echo,Beta,Gamma,Delta'
        $out2 = Edit-NamelistGroupText -Text $script:EditFixture -GroupTag 'TST_CA_HISTORICAL' -Remove @('Alpha')
        $out2 | Should -Match "`n`t`t`"Beta`" `"Gamma`"`n"
    }

    It "Preserves CRLF line endings" {
        $crlf = $script:EditFixture -replace "`n", "`r`n"
        $out = Edit-NamelistGroupText -Text $crlf -GroupTag 'TST_CA_HISTORICAL' -Add @('Echo')
        ($out -replace "`r`n", '') | Should -Not -Match "`n"
    }

    It "Refuses misses, duplicates and an emptied block" {
        { Edit-NamelistGroupText -Text $script:EditFixture -GroupTag 'TST_CA_HISTORICAL' -Remove @('Zulu') } | Should -Throw '*Zulu*'
        { Edit-NamelistGroupText -Text $script:EditFixture -GroupTag 'TST_CA_HISTORICAL' -Add @('Gamma') } | Should -Throw '*already*'
        { Edit-NamelistGroupText -Text $script:EditFixture -GroupTag 'TST_CA_HISTORICAL' -Rename @('Alpha=Beta') } | Should -Throw '*already exists*'
        { Edit-NamelistGroupText -Text $script:EditFixture -GroupTag 'TST_BIRDS' -Remove @('Alpha', 'Delta') } | Should -Throw '*empty*'
        { Edit-NamelistGroupText -Text $script:EditFixture -GroupTag 'TST_NOPE' -Add @('X') } | Should -Throw '*not found*'
    }
}

Describe "build.ps1 Helper: Get-ShipTypeFindings" {
    It "Reports nothing for a compliant namelist" {
        @(Invoke-FixtureTypeCheck (Get-CompliantFixtureText)).Count | Should -Be 0
    }

    It "Fails a valid token on the wrong class (WrongClassToken)" {
        $text = (Get-CompliantFixtureText) -replace 'ship_hull_heavy battleship', 'ship_hull_cruiser battleship'
        $f = @(Invoke-FixtureTypeCheck $text | Where-Object { $_.Check -eq 'WrongClassToken' })
        $f.Count | Should -Be 1
        $f[0].Group | Should -Be 'TST_BB_HISTORICAL'
        $f[0].Severity | Should -Be 'FAIL'
    }

    It "Fails a missing required hull token (MissingRequired)" {
        $text = (Get-CompliantFixtureText) -replace 'ship_hull_light destroyer', 'destroyer'
        $f = @(Invoke-FixtureTypeCheck $text | Where-Object { $_.Check -eq 'MissingRequired' })
        $f.Count | Should -Be 1
        $f[0].Detail | Should -Match 'ship_hull_light'
    }

    It "Fails tokens vanilla never uses (UnknownToken)" {
        $text = (Get-CompliantFixtureText) -replace 'ship_hull_heavy battleship', 'ship_hull_heavy battleship capital_ship'
        $f = @(Invoke-FixtureTypeCheck $text | Where-Object { $_.Check -eq 'UnknownToken' })
        $f.Count | Should -Be 1
        $f[0].Detail | Should -Match 'capital_ship'
    }

    It "Allows battle_cruiser on BB without a BC group but warns when a BC group exists" {
        $text = (Get-CompliantFixtureText) -replace 'ship_hull_heavy battleship', 'ship_hull_heavy battleship battle_cruiser'
        $withBc = @(Invoke-FixtureTypeCheck $text)
        $withBc.Count | Should -Be 1
        $withBc[0].Check | Should -Be 'BBCarriesBC'
        $withBc[0].Severity | Should -Be 'WARN'

        $noBc = $text -replace '(?s)TST_BC_HISTORICAL = \{.*?\n\}\n', ''
        @(Invoke-FixtureTypeCheck $noBc).Count | Should -Be 0
    }

    It "Fails a thematic pool that restricts ship_types (ThemeRestricted)" {
        $text = (Get-CompliantFixtureText) + (New-FixtureGroup 'TST_WINDS' 'ship_hull_light destroyer' (New-NameRange 'Wind' 35) 'TNS ' '"Winds"')
        $f = @(Invoke-FixtureTypeCheck $text | Where-Object { $_.Check -eq 'ThemeRestricted' })
        $f.Count | Should -Be 1
        $f[0].Group | Should -Be 'TST_WINDS'
    }
}

Describe "build.ps1 -VerifyShipTypes action" {
    It "Prints a single OK line and exits 0 when every repo namelist matches the canon" {
        $output = (& powershell -NoProfile -File $script:BuildScriptPath -VerifyShipTypes ALL 2>&1 | Out-String).Trim()
        $LASTEXITCODE | Should -Be 0
        $output | Should -Match '^ship_types OK: \d+ files, \d+ groups$'
    }
}

Describe "build.ps1 -Audit action" {
    It "Audits an implemented nation, exits 0 and prints the summary line" {
        $output = & powershell -NoProfile -File $script:BuildScriptPath -Audit FIN 2>&1 | Out-String
        $LASTEXITCODE | Should -Be 0
        $output | Should -Match 'AUDIT SUMMARY FIN: FAIL=\d+ WARN=\d+ INFO=\d+'
    }

    It "Prints several groups as compact name lines with -Group list and -NamesOnly" {
        $output = & powershell -NoProfile -File $script:BuildScriptPath -Audit FIN -Group 'RULERS,FIN_CV_HISTORICAL' -NamesOnly 2>&1 | Out-String
        $LASTEXITCODE | Should -Be 0
        $lines = @($output -split '\r?\n' | Where-Object { $_ -match '^FIN_' })
        $lines.Count | Should -Be 2
        $lines[0] | Should -Match '^FIN_CV_HISTORICAL \(\d+\): \S.*; '
        $lines[1] | Should -Match '^FIN_RULERS \(\d+\) "[^"]+": '
        $output | Should -Not -Match 'fallback_name|AUDIT SUMMARY'
    }

    It "Refuses an -EditNames miss with exit 1 and leaves the namelist untouched" {
        $path = Join-Path $script:RepoRoot 'common\units\names_ships\FIN_ship_names.txt'
        $before = [System.IO.File]::ReadAllText($path)
        $output = & powershell -NoProfile -File $script:BuildScriptPath -EditNames FIN -Group RULERS -Remove 'No Such Ruler' 2>&1 | Out-String
        $LASTEXITCODE | Should -Be 1
        $output | Should -Match 'No Such Ruler'
        [System.IO.File]::ReadAllText($path) | Should -Be $before
    }
}
