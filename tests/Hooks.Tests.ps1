BeforeDiscovery {
    $script:DenyCases = @(
        @{ Name = 'Write of the synced build engine'; Tool = 'Write'; ToolInput = @{ file_path = 'tools\HoiModBuild.ps1' } }
        @{ Name = 'Write of a new file under tools'; Tool = 'Write'; ToolInput = @{ file_path = 'tools/Namelists.ps1' } }
        @{ Name = 'Edit of the synced knowledge tests'; Tool = 'Edit'; ToolInput = @{ file_path = 'tests\Knowledge.Tests.ps1' } }
        @{ Name = 'Edit of the synced engine tests'; Tool = 'MultiEdit'; ToolInput = @{ file_path = 'tests\BuildEngine.Tests.ps1' } }
        @{ Name = 'Edit of the synced test runner'; Tool = 'Edit'; ToolInput = @{ file_path = 'tests\Run-Tests.ps1' } }
        @{ Name = 'Edit of the synced CI workflow'; Tool = 'Edit'; ToolInput = @{ file_path = '.github\workflows\ci.yml' } }
        @{ Name = 'Copy-Item over the synced build engine'; Tool = 'PowerShell'; ToolInput = @{ command = 'Copy-Item ..\..\Scripts\Build\HoiModBuild.ps1 tools\HoiModBuild.ps1 -Force' } }
        @{ Name = 'a redirect into the CI workflow'; Tool = 'Bash'; ToolInput = @{ command = 'cat scratch/ci.yml > .github/workflows/ci.yml' } }
        @{ Name = 'sed -i on the synced test runner'; Tool = 'Bash'; ToolInput = @{ command = "sed -i 's/Old/New/' tests/Run-Tests.ps1" } }
    )
    $script:AllowCases = @(
        @{ Name = 'Edit of a plan'; Tool = 'Edit'; ToolInput = @{ file_path = 'docs\plans\2026-10-25-testland-audit.md' } }
        @{ Name = 'Edit of a namelist file'; Tool = 'Edit'; ToolInput = @{ file_path = 'common\units\names_ships\TST_ship_names.txt' } }
        @{ Name = 'Edit of a Claude Code skill'; Tool = 'Edit'; ToolInput = @{ file_path = '.claude\skills\hoi4-isne-namelist-audit\SKILL.md' } }
        @{ Name = 'Edit of an Antigravity skill mirror (kept by hand)'; Tool = 'Edit'; ToolInput = @{ file_path = '.agents\skills\hoi4-isne-namelist-audit\SKILL.md' } }
        @{ Name = 'Edit of the mod''s own tests'; Tool = 'Edit'; ToolInput = @{ file_path = 'tests\Documentation.Tests.ps1' } }
        @{ Name = 'Edit of the build script'; Tool = 'Edit'; ToolInput = @{ file_path = 'build.ps1' } }
        @{ Name = 'Write into scratch'; Tool = 'Write'; ToolInput = @{ file_path = 'scratch\tst_dossier.md' } }
        @{ Name = 'a tools path outside the repository'; Tool = 'Edit'; ToolInput = @{ file_path = 'C:\elsewhere\tools\HoiModBuild.ps1' } }
        @{ Name = 'the -Test command'; Tool = 'PowerShell'; ToolInput = @{ command = 'powershell -File .\build.ps1 -Test' } }
        @{ Name = 'the CI test runner call'; Tool = 'PowerShell'; ToolInput = @{ command = './tests/Run-Tests.ps1 -CI -OutputFile tests/test-results.xml' } }
        @{ Name = 'a diff of the synced build engine'; Tool = 'Bash'; ToolInput = @{ command = 'git diff -- tools/HoiModBuild.ps1' } }
        @{ Name = 'a Read of the synced build engine'; Tool = 'Read'; ToolInput = @{ file_path = 'tools\HoiModBuild.ps1' } }
    )
}

Describe 'Protect-ProjectFiles hook' {
    BeforeAll {
        $script:RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
        $script:HookPath = Join-Path $script:RepoRoot '.claude\hooks\Protect-ProjectFiles.ps1'
        $script:FakeRepo = Join-Path $TestDrive 'isne'
        [void](New-Item -ItemType Directory -Path $script:FakeRepo -Force)

        function Invoke-ProtectHook {
            param(
                [string]$ToolName,
                [hashtable]$ToolInput
            )

            if ($ToolInput.ContainsKey('file_path') -and -not [System.IO.Path]::IsPathRooted($ToolInput.file_path)) {
                $ToolInput = @{ file_path = (Join-Path $script:FakeRepo $ToolInput.file_path) }
            }
            $eventJson = ConvertTo-Json -Compress -Depth 5 -InputObject @{
                hook_event_name = 'PreToolUse'
                tool_name       = $ToolName
                cwd             = $script:FakeRepo
                tool_input      = $ToolInput
            }
            $previousPreference = $ErrorActionPreference
            $ErrorActionPreference = 'Continue'
            $output = @($eventJson | & powershell -NoProfile -ExecutionPolicy Bypass -File $script:HookPath -RepoRoot $script:FakeRepo 2>&1 | ForEach-Object { "$_" })
            $exitCode = $LASTEXITCODE
            $ErrorActionPreference = $previousPreference
            return [PSCustomObject]@{ ExitCode = $exitCode; Text = ($output -join "`n") }
        }
    }

    It 'refuses <Name>' -ForEach $script:DenyCases {
        $result = Invoke-ProtectHook -ToolName $Tool -ToolInput $ToolInput
        $result.ExitCode | Should -Be 2
        $result.Text | Should -Match 'synced from the Modding Manager'
    }

    It 'lets <Name> through' -ForEach $script:AllowCases {
        $result = Invoke-ProtectHook -ToolName $Tool -ToolInput $ToolInput
        $result.ExitCode | Should -Be 0
        $result.Text | Should -BeNullOrEmpty
    }

    It 'exits 0 on malformed input' {
        $previousPreference = $ErrorActionPreference
        $ErrorActionPreference = 'Continue'
        $output = @('not json' | & powershell -NoProfile -ExecutionPolicy Bypass -File $script:HookPath -RepoRoot $script:FakeRepo 2>&1)
        $exitCode = $LASTEXITCODE
        $ErrorActionPreference = $previousPreference
        $exitCode | Should -Be 0
    }
}

Describe 'Validate-NamelistEdit hook' {
    BeforeAll {
        $script:RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
        $script:HookPath = Join-Path $script:RepoRoot '.claude\hooks\Validate-NamelistEdit.ps1'
        $script:FailingRepo = Join-Path $TestDrive 'isne-failing'
        $script:PassingRepo = Join-Path $TestDrive 'isne-passing'
        foreach ($fakeRepo in $script:FailingRepo, $script:PassingRepo) { [void](New-Item -ItemType Directory -Path $fakeRepo -Force) }
        [System.IO.File]::WriteAllText((Join-Path $script:FailingRepo 'build.ps1'), "param([switch]`$ValidateOnly)`r`nWrite-Host '  [OK] descriptor.mod valid'`r`nWrite-Host '  [ERROR] TST_ship_names.txt: Bracket mismatch (Open: 3, Close: 2)'`r`nexit 1`r`n", [System.Text.UTF8Encoding]::new($false))
        [System.IO.File]::WriteAllText((Join-Path $script:PassingRepo 'build.ps1'), "param([switch]`$ValidateOnly)`r`nWrite-Host '  [OK] All ship namelist files passed'`r`nexit 0`r`n", [System.Text.UTF8Encoding]::new($false))

        function Invoke-ValidateHook {
            param(
                [string]$FakeRepo,
                [string]$ToolName,
                [string]$FilePath
            )

            if (-not [System.IO.Path]::IsPathRooted($FilePath)) { $FilePath = Join-Path $FakeRepo $FilePath }
            $eventJson = ConvertTo-Json -Compress -Depth 5 -InputObject @{
                hook_event_name = 'PostToolUse'
                tool_name       = $ToolName
                cwd             = $FakeRepo
                tool_input      = @{ file_path = $FilePath }
            }
            $previousPreference = $ErrorActionPreference
            $ErrorActionPreference = 'Continue'
            $output = @($eventJson | & powershell -NoProfile -ExecutionPolicy Bypass -File $script:HookPath -RepoRoot $FakeRepo 2>&1 | ForEach-Object { "$_" })
            $exitCode = $LASTEXITCODE
            $ErrorActionPreference = $previousPreference
            return [PSCustomObject]@{ ExitCode = $exitCode; Text = ($output -join "`n") }
        }
    }

    It 'blocks with the validation errors when a namelist edit breaks -ValidateOnly' {
        $result = Invoke-ValidateHook -FakeRepo $script:FailingRepo -ToolName 'Edit' -FilePath 'common\units\names_ships\TST_ship_names.txt'
        $result.ExitCode | Should -Be 2
        $result.Text | Should -Match 'common/units/names_ships/TST_ship_names\.txt'
        $result.Text | Should -Match 'Bracket mismatch'
        $result.Text | Should -Not -Match '\[OK\]'
    }

    It 'stays silent when a namelist edit passes -ValidateOnly' {
        $result = Invoke-ValidateHook -FakeRepo $script:PassingRepo -ToolName 'Write' -FilePath 'common\units\names_ships\TST_ship_names.txt'
        $result.ExitCode | Should -Be 0
        $result.Text | Should -BeNullOrEmpty
    }

    It 'skips <Name>' -ForEach @(
        @{ Name = 'an edit of a plan'; Tool = 'Edit'; FilePath = 'docs\plans\2026-10-25-testland-audit.md' }
        @{ Name = 'a Read of a namelist'; Tool = 'Read'; FilePath = 'common\units\names_ships\TST_ship_names.txt' }
        @{ Name = 'a namelist outside the repository'; Tool = 'Edit'; FilePath = 'C:\elsewhere\common\units\names_ships\TST_ship_names.txt' }
    ) {
        $result = Invoke-ValidateHook -FakeRepo $script:FailingRepo -ToolName $Tool -FilePath $FilePath
        $result.ExitCode | Should -Be 0
        $result.Text | Should -BeNullOrEmpty
    }

    It 'exits 0 on malformed input' {
        $previousPreference = $ErrorActionPreference
        $ErrorActionPreference = 'Continue'
        $output = @('not json' | & powershell -NoProfile -ExecutionPolicy Bypass -File $script:HookPath -RepoRoot $script:FailingRepo 2>&1)
        $exitCode = $LASTEXITCODE
        $ErrorActionPreference = $previousPreference
        $exitCode | Should -Be 0
    }
}

Describe 'Hook registration in .claude/settings.json' {
    BeforeAll {
        $script:RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
        $script:Settings = [System.IO.File]::ReadAllText((Join-Path $script:RepoRoot '.claude\settings.json'), [System.Text.Encoding]::UTF8) | ConvertFrom-Json
    }

    It 'registers Protect-ProjectFiles.ps1 for PreToolUse on the editing and shell tools' {
        $entries = @($script:Settings.hooks.PreToolUse)
        $entries.Count | Should -BeGreaterThan 0
        $commands = @($entries | ForEach-Object { $_.hooks } | ForEach-Object { $_.command })
        @($commands | Where-Object { $_ -match 'Protect-ProjectFiles\.ps1' }).Count | Should -Be 1
        $matcher = @($entries | Where-Object { @($_.hooks | Where-Object { $_.command -match 'Protect-ProjectFiles' }).Count -gt 0 })[0].matcher
        foreach ($tool in 'Edit', 'Write', 'MultiEdit', 'Bash', 'PowerShell') { $matcher | Should -Match "\b$tool\b" }
        (Test-Path (Join-Path $script:RepoRoot '.claude\hooks\Protect-ProjectFiles.ps1')) | Should -BeTrue
    }

    It 'registers Validate-NamelistEdit.ps1 for PostToolUse on the editing tools' {
        $entries = @($script:Settings.hooks.PostToolUse)
        $entries.Count | Should -BeGreaterThan 0
        $validateEntries = @($entries | Where-Object { @($_.hooks | Where-Object { $_.command -match 'Validate-NamelistEdit\.ps1' }).Count -gt 0 })
        $validateEntries.Count | Should -Be 1
        foreach ($tool in 'Edit', 'Write', 'MultiEdit') { $validateEntries[0].matcher | Should -Match "\b$tool\b" }
        (Test-Path (Join-Path $script:RepoRoot '.claude\hooks\Validate-NamelistEdit.ps1')) | Should -BeTrue
    }

    It 'asks before the outward-facing commands' {
        $ask = @($script:Settings.permissions.ask)
        foreach ($command in '-PublishSteam', '-Deploy', '-DevLink', '-Clean', 'push-wiki.ps1', 'git push') {
            @($ask | Where-Object { $_ -like "*$command*" }).Count | Should -BeGreaterThan 0 -Because "$command is outward-facing and runs on the user's word"
        }
    }

    It 'allows the read-only namelist commands agents run most' {
        $allow = @($script:Settings.permissions.allow)
        foreach ($command in '-ValidateOnly', '-Test', '-Audit', '-DiffNames', '-InspectVanilla', '-VerifyShipTypes', 'Test-HoiKnowledge.ps1') {
            @($allow | Where-Object { $_ -like "*$command*" }).Count | Should -BeGreaterThan 0 -Because "$command is read-only and should not prompt"
        }
    }

    It 'keeps <_> to the PowerShell conventions (CmdletBinding, CRLF, no BOM)' -ForEach @('Protect-ProjectFiles.ps1', 'Validate-NamelistEdit.ps1') {
        $path = Join-Path $script:RepoRoot ".claude\hooks\$_"
        $bytes = [System.IO.File]::ReadAllBytes($path)
        ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) | Should -BeFalse -Because 'the hook must be UTF-8 without BOM'
        $text = [System.Text.Encoding]::UTF8.GetString($bytes)
        $text | Should -Match '^\[CmdletBinding\(\)\]'
        $text | Should -Match "`r`n"
        ($text -replace "`r`n", '') | Should -Not -Match "`n" -Because 'the hook must use CRLF throughout'
    }
}
