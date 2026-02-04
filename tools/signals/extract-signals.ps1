# ============================================
# USAGreenland.com — SIGNALS_V1 Extractor
# Phase 37 + 39.1 + 39.2
# Read-only | PowerShell
# ============================================

param (
    [string]$RootPath = ".",
    [string]$ReportPath = "./tools/signals/signals_report.md",
    [string]$NormalizedPath = "./tools/signals/signals_normalized.json",
    [string]$ScoredPath = "./tools/signals/signals_scored.json"
)

# -----------------------------
# Normalization Maps (v1)
# -----------------------------

$HORIZON_MAP = @{
    "short"    = 1
    "mid"      = 2
    "mid-long" = 3
    "long"     = 4
}

$DIRECTION_MAP = @{
    "declining"    = -1
    "stable"       = 0
    "emerging"     = 1
    "accelerating" = 2
}

$CONFIDENCE_MAP = @{
    "low"    = 0.5
    "medium" = 1.0
    "high"   = 1.5
}

Write-Host "Scanning for SIGNALS_V1 blocks..." -ForegroundColor Cyan

# -----------------------------
# Extraction (Phase 37)
# -----------------------------

$results = @()
$htmlFiles = Get-ChildItem -Path $RootPath -Recurse -Filter *.html

foreach ($file in $htmlFiles) {

    $content = Get-Content $file.FullName -Raw

    if ($content -match "<!--\s*SIGNALS_V1\s*(\{[\s\S]*?\})\s*-->") {

        $jsonText = $Matches[1]

        try {
            $json = $jsonText | ConvertFrom-Json

            foreach ($signal in $json.signals) {
                $results += [PSCustomObject]@{
                    File       = $file.FullName.Replace($RootPath, "").TrimStart("\","/")
                    Type       = $signal.type
                    Sector     = $signal.sector
                    Scope      = $signal.scope
                    Horizon    = $signal.horizon
                    Direction  = $signal.direction
                    Confidence = $signal.confidence
                }
            }

        } catch {
            Write-Warning "Invalid JSON in SIGNALS_V1 block: $($file.FullName)"
        }
    }
}

# -----------------------------
# Normalization (Phase 39.1)
# -----------------------------

$normalizedSignals = @()

foreach ($r in $results) {

    $normalizedSignals += [PSCustomObject]@{
        file              = $r.File
        type              = $r.Type
        sector            = $r.Sector
        scope             = $r.Scope
        horizon           = $r.Horizon
        direction         = $r.Direction
        confidence        = $r.Confidence

        horizon_weight    = $HORIZON_MAP[$r.Horizon]
        direction_weight  = $DIRECTION_MAP[$r.Direction]
        confidence_weight = $CONFIDENCE_MAP[$r.Confidence]
    }
}

$normalizedSignals |
    ConvertTo-Json -Depth 5 |
    Set-Content -Encoding UTF8 $NormalizedPath

# -----------------------------
# Scoring & Ranking (Phase 39.2)
# -----------------------------

$scoredSignals = @()

foreach ($s in $normalizedSignals) {

    $score = $s.horizon_weight * $s.direction_weight * $s.confidence_weight

    $scoredSignals += [PSCustomObject]@{
        file              = $s.file
        type              = $s.type
        sector            = $s.sector
        scope             = $s.scope
        horizon           = $s.horizon
        direction         = $s.direction
        confidence        = $s.confidence

        horizon_weight    = $s.horizon_weight
        direction_weight  = $s.direction_weight
        confidence_weight = $s.confidence_weight

        signal_score      = [Math]::Round($score, 2)
    }
}

$scoredSignals =
    $scoredSignals |
    Sort-Object -Property signal_score -Descending

$scoredSignals |
    ConvertTo-Json -Depth 5 |
    Set-Content -Encoding UTF8 $ScoredPath

# -----------------------------
# Markdown Report (Human Audit)
# -----------------------------

$report = @()
$report += "# SIGNALS REPORT (Auto-Generated)"
$report += ""
$report += "Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
$report += ""
$report += "Total HTML files scanned: $($htmlFiles.Count)"
$report += "Total signals found: $($results.Count)"
$report += ""

if ($results.Count -eq 0) {
    $report += "_No SIGNALS_V1 blocks detected._"
} else {
    $report += "| File | Type | Sector | Scope | Horizon | Direction | Confidence |"
    $report += "|------|------|--------|-------|---------|-----------|------------|"

    foreach ($r in $results) {
        $report += "| $($r.File) | $($r.Type) | $($r.Sector) | $($r.Scope) | $($r.Horizon) | $($r.Direction) | $($r.Confidence) |"
    }
}

$report | Out-File -Encoding UTF8 $ReportPath

# -----------------------------
# Done
# -----------------------------

Write-Host "Signal extraction complete." -ForegroundColor Green
Write-Host "Report written to: $ReportPath" -ForegroundColor Yellow
Write-Host "Normalized signals written to: $NormalizedPath" -ForegroundColor Yellow
Write-Host "Scored signals written to: $ScoredPath" -ForegroundColor Yellow
