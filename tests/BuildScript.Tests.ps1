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
name="Immersive Shipnames Expanded"
supported_version="1.19.*"
remote_file_id="1234567890"
"@
            [System.IO.File]::WriteAllText($tempFile, $sampleDescriptor, [System.Text.Encoding]::UTF8)

            $meta = Get-ModMetadata -Path $tempFile
            $meta.Version | Should -Be "1.0.0"
            $meta.Name | Should -Be "Immersive Shipnames Expanded"
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
name="Immersive Shipnames Expanded"
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
name="Immersive Shipnames Expanded"
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
}
