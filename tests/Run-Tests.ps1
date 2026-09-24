<#
.SYNOPSIS
    Test runner script for Immersive Shipnames Expanded (ISNE).

.DESCRIPTION
    Executes Pester test suites for ship namelists, documentation synchronization,
    and build automation. Supports CI export to NUnit XML format.

.PARAMETER Suite
    Filter test execution to a specific suite: 'All' (default), 'Shipnames', 'Documentation', or 'BuildScript'.

.PARAMETER CI
    When specified, generates an NUnit XML test report for CI/CD systems (GitHub Actions).

.PARAMETER OutputFile
    Path to save the test results XML file when running in CI mode (default: tests/test-results.xml).

.PARAMETER InstallPrereqs
    Ensure minimum required Pester version (>= 5.3.0) is installed in CurrentUser scope.

.EXAMPLE
    powershell -File .\tests\Run-Tests.ps1

.EXAMPLE
    powershell -File .\tests\Run-Tests.ps1 -Suite Shipnames

.EXAMPLE
    powershell -File .\tests\Run-Tests.ps1 -CI
#>

[CmdletBinding()]
param(
    [ValidateSet('All', 'Shipnames', 'Documentation', 'BuildScript')]
    [string]$Suite = 'All',

    [switch]$CI,
    [string]$OutputFile,
    [switch]$InstallPrereqs
)

$ErrorActionPreference = 'Stop'

# Ensure Pester 5+
$pesterModule = Get-Module -ListAvailable Pester | Where-Object { $_.Version.Major -ge 5 } | Select-Object -First 1

if (-not $pesterModule) {
    if ($InstallPrereqs -or $env:CI) {
        Write-Host "Pester 5+ not detected. Installing Pester to CurrentUser scope..." -ForegroundColor Yellow
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Scope CurrentUser -Force | Out-Null
        Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
        Install-Module -Name Pester -MinimumVersion 5.3.0 -Scope CurrentUser -Force -SkipPublisherCheck | Out-Null
        $pesterModule = Get-Module -ListAvailable Pester | Where-Object { $_.Version.Major -ge 5 } | Select-Object -First 1
    } else {
        Write-Error "Pester 5.0+ is required to execute the test suite. Run with -InstallPrereqs to install it automatically."
        exit 1
    }
}

Import-Module $pesterModule -Force

# Locate test files
$testDir = $PSScriptRoot
$testFiles = [System.Collections.Generic.List[string]]::new()

if ($Suite -eq 'All' -or $Suite -eq 'Shipnames') {
    $testFiles.Add((Join-Path $testDir "Shipnames.Tests.ps1"))
}
if ($Suite -eq 'All' -or $Suite -eq 'Documentation') {
    $testFiles.Add((Join-Path $testDir "Documentation.Tests.ps1"))
}
if ($Suite -eq 'All' -or $Suite -eq 'BuildScript') {
    $testFiles.Add((Join-Path $testDir "BuildScript.Tests.ps1"))
}

Write-Host "`n=======================================================" -ForegroundColor Cyan
Write-Host "  ISNE Test Suite Runner (Pester $($pesterModule.Version))" -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host "Suite:       $Suite" -ForegroundColor Gray
Write-Host "Test Files:  $($testFiles.Count)" -ForegroundColor Gray
Write-Host "CI Mode:     $($CI.IsPresent)`n" -ForegroundColor Gray

# Configure Pester
$config = [PesterConfiguration]::Default
$config.Run.Path = $testFiles.ToArray()
$config.Run.PassThru = $true
$config.Output.Verbosity = if ($CI) { 'Detailed' } else { 'Normal' }

if ($CI) {
    if (-not $OutputFile) {
        $OutputFile = Join-Path $testDir "test-results.xml"
    }
    $config.TestResult.Enabled = $true
    $config.TestResult.OutputFormat = 'NUnitXml'
    $config.TestResult.OutputPath = $OutputFile
}

# Execute tests
$result = Invoke-Pester -Configuration $config

Write-Host "`n-------------------------------------------------------" -ForegroundColor Cyan
Write-Host "  Summary: $($result.PassedCount) Passed, $($result.FailedCount) Failed, $($result.SkippedCount) Skipped" -ForegroundColor $(if ($result.FailedCount -gt 0) { "Red" } else { "Green" })
Write-Host "-------------------------------------------------------" -ForegroundColor Cyan

if ($CI -and (Test-Path $OutputFile)) {
    Write-Host "NUnit Test Results saved to: $OutputFile" -ForegroundColor Green
}

if ($result.FailedCount -gt 0) {
    exit 1
} else {
    exit 0
}
