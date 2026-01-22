#!/usr/bin/env pwsh
# Pre-warm NuGet cache for workshop notebooks

Write-Host "ChargeSmart Workshop Setup" -ForegroundColor Cyan
Write-Host "=========================" -ForegroundColor Cyan

# 1. Check .NET SDK
$dotnetVersion = dotnet --version 2>$null
if (-not $dotnetVersion) {
    Write-Error ".NET SDK not found. Install from https://dot.net"
    exit 1
}
Write-Host "Found .NET SDK: $dotnetVersion"

# 2. Check Ollama
try {
    $null = Invoke-RestMethod -Uri "http://localhost:11434/api/tags" -TimeoutSec 5
    Write-Host "Ollama is running"
} catch {
    Write-Warning "Ollama not running. Start with: ollama serve"
}

# 3. Pre-warm NuGet cache by creating temp project
Write-Host "`nPre-downloading NuGet packages..." -ForegroundColor Yellow
$tempDir = Join-Path $env:TEMP "workshop-warmup-$(Get-Random)"
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

try {
    Push-Location $tempDir
    dotnet new console -n warmup --no-restore | Out-Null
    Set-Location warmup

    # Add the exact packages used in notebooks
    dotnet add package OllamaSharp --version 5.3.4
    dotnet add package Microsoft.Extensions.AI --version 9.5.0

    # Restore triggers download to global cache
    dotnet restore

    Write-Host "Packages cached successfully!" -ForegroundColor Green
} finally {
    Pop-Location
    Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
}

Write-Host "`nSetup complete! Notebook should now load quickly." -ForegroundColor Green
