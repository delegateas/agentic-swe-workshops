#!/usr/bin/env pwsh
# Test runner for agents-mcp-skills.dib

$ErrorActionPreference = "Stop"

# 1. Check Ollama is running
Write-Host "Checking Ollama..." -ForegroundColor Cyan
try {
    $response = Invoke-RestMethod -Uri "http://localhost:11434/api/tags" -Method Get -TimeoutSec 5
    Write-Host "  Ollama is running" -ForegroundColor Green
} catch {
    Write-Host "  ERROR: Ollama is not running. Start it with: ollama serve" -ForegroundColor Red
    exit 1
}

# 2. Check model is available
$modelName = "llama3.1:8b"
$models = $response.models | ForEach-Object { $_.name }
if ($models -notcontains $modelName) {
    Write-Host "  ERROR: Model '$modelName' not found. Pull it with: ollama pull $modelName" -ForegroundColor Red
    exit 1
}
Write-Host "  Model '$modelName' available" -ForegroundColor Green

# 3. Check dotnet-repl is installed
Write-Host "Checking dotnet-repl..." -ForegroundColor Cyan
$replInstalled = dotnet tool list -g | Select-String "dotnet-repl"
if (-not $replInstalled) {
    Write-Host "  Installing dotnet-repl..." -ForegroundColor Yellow
    dotnet tool install -g dotnet-repl
}
Write-Host "  dotnet-repl ready" -ForegroundColor Green

# 4. Setup output paths
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$logDir = ".test-logs"
if (-not (Test-Path $logDir)) { New-Item -ItemType Directory -Path $logDir | Out-Null }
$logPath = "$logDir/$timestamp"

# 5. Run the notebook with logging
Write-Host "`nRunning notebook..." -ForegroundColor Cyan
$startTime = Get-Date

dotnet repl --run "agents-mcp-skills.dib" --exit-after-run --log-path $logPath 2>&1 | Tee-Object -Variable output
$exitCode = $LASTEXITCODE

$duration = (Get-Date) - $startTime
Write-Host "`nCompleted in $($duration.ToString('mm\:ss'))" -ForegroundColor Cyan

if ($exitCode -eq 0) {
    Write-Host "SUCCESS: All cells executed without errors" -ForegroundColor Green
} else {
    Write-Host "FAILED: Exit code $exitCode" -ForegroundColor Red
    Write-Host "`nLogs saved to: $logPath" -ForegroundColor Yellow

    # Show any error lines from output
    $errors = $output | Select-String -Pattern "error|exception|fail" -CaseSensitive:$false
    if ($errors) {
        Write-Host "`nErrors found:" -ForegroundColor Red
        $errors | ForEach-Object { Write-Host "  $_" -ForegroundColor Red }
    }
}

exit $exitCode
