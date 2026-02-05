# ============================================
# USAGreenland.com — Market Overview Rollup
# Phase 40.1
# Read-only | PowerShell
# ============================================

param (
    [string]$ScoredPath = "./tools/signals/signals_scored.json",
    [string]$RollupPath = "./tools/signals/market_rollup.json"
)
function Normalize-Path {
    param ($path)

    $normalized = $path `
        -replace '.*USA GREENLAN SITE FILES[\\/]', '' `
        -replace '\\', '/'

    return $normalized
}

Write-Host "Generating market rollup..." -ForegroundColor Cyan

if (-not (Test-Path $ScoredPath)) {
    Write-Error "signals_scored.json not found. Run extract-signals.ps1 first."
    exit 1
}

$signals = Get-Content $ScoredPath -Raw | ConvertFrom-Json

# -----------------------------
# Top Signals (by score)
# -----------------------------

$topSignals =
    $signals |
    Sort-Object signal_score -Descending |
    Select-Object -First 5 |
    ForEach-Object {
        [PSCustomObject]@{
            file         = Normalize-Path $_.file
            type         = $_.type
            sector       = $_.sector
            signal_score = $_.signal_score
        }
    }

# -----------------------------
# Sector Heat (aggregate score)
# -----------------------------

$sectorHeat = @{}

foreach ($s in $signals) {
    if (-not $sectorHeat.ContainsKey($s.sector)) {
        $sectorHeat[$s.sector] = 0
    }
    $sectorHeat[$s.sector] += $s.signal_score
}

# -----------------------------
# Signal Mix (count by type)
# -----------------------------

$signalMix = @{}

foreach ($s in $signals) {
    if (-not $signalMix.ContainsKey($s.type)) {
        $signalMix[$s.type] = 0
    }
    $signalMix[$s.type] += 1
}

# -----------------------------
# Assemble Rollup
# -----------------------------

$rollup = [PSCustomObject]@{
    generated_at = (Get-Date -Format "yyyy-MM-dd HH:mm")
    top_signals  = $topSignals
    sector_heat = $sectorHeat
    signal_mix  = $signalMix
}

$rollup |
    ConvertTo-Json -Depth 5 |
    Set-Content -Encoding UTF8 $RollupPath

Write-Host "Market rollup written to: $RollupPath" -ForegroundColor Yellow
