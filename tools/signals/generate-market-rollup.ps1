# ============================================
# USAGreenland.com — Market Overview Rollup
# Phase 42 — Reader-Facing Sector Rollups
# Read-only | PowerShell | LOCKED
# ============================================

param (
    [string]$ScoredPath = 'signals_scored.json',
    [string]$RollupPath = 'market_rollup.json'
)

Write-Host 'Generating reader-facing market rollup...' -ForegroundColor Cyan

$ScriptDir  = Split-Path -Parent $MyInvocation.MyCommand.Path
$ScoredPath = Join-Path $ScriptDir $ScoredPath
$RollupPath = Join-Path $ScriptDir $RollupPath

if (-not (Test-Path $ScoredPath)) {
    Write-Error 'signals_scored.json not found. Run extract-signals.ps1 first.'
    exit 1
}

$signals = Get-Content $ScoredPath -Raw | ConvertFrom-Json

$siteRoot = "C:\Users\bain7\OneDrive\Desktop\USA GREENLAN SITE FILES"

function Get-ActivityLabel {
    param ($score)
    if ($score -ge 85) { return 'Accelerating' }
    if ($score -ge 65) { return 'High' }
    if ($score -ge 40) { return 'Moderate' }
    return 'Low'
}

$sectorRollup =
    $signals |
    Group-Object sector |
    ForEach-Object {
        $sectorSignals = $_.Group
        $dominantScore =
            ($sectorSignals | Measure-Object signal_score -Maximum).Maximum

        $sources =
            $sectorSignals |
            Select-Object -ExpandProperty file -Unique |
            ForEach-Object {
                $path = $_
                if ($path.StartsWith($siteRoot)) {
                    $path = $path.Substring($siteRoot.Length)
                }
                $path = $path -replace '\\', '/'
                $path = $path.ToLower()
                $path = $path -replace ' ', '-'

         # Ensure .html extension is correct
                if ($path -match 'html$' -and $path -notmatch '\.html$') {
                $path = $path -replace 'html$', '.html'
                }

                if (-not $path.StartsWith('/')) {
                    $path = "/$path"
                }
                $path
            }

        [PSCustomObject]@{
            sector      = $_.Name
            activity    = Get-ActivityLabel $dominantScore
            sourceCount = $sources.Count
            articles    = $sources
        }
    } |
    Sort-Object sector

$sectorRollup |
    ConvertTo-Json -Depth 4 |
    Set-Content -Encoding UTF8 $RollupPath

Write-Host 'Market rollup complete.'
