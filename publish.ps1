# USAGreenland.com — Publish Script (v1.4)
# Phase #22 — Publish-Time Enforcement (LOCKED)
# Validates canonical publish articles ONLY
# Excludes templates, site pages, and legacy archives

Write-Host "USAGreenland.com - Publish Validation Starting"

# --- Guard: Node.js ---
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Error "Node.js is required but not found. Aborting publish."
    exit 1
}

# --- Collect canonical articles ONLY ---
# Rule:
# - article*.html in project root
# - explicit exclusion of templates and legacy folders

$articles = Get-ChildItem -Path . -Filter 'article*.html' -File -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -ne 'ARTICLE_TEMPLATE.html' } |
    Sort-Object FullName -Unique

if (-not $articles -or $articles.Count -eq 0) {
    Write-Host "No canonical articles found. Nothing to validate."
    exit 0
}

# --- Validation loop ---
foreach ($article in $articles) {
    Write-Host ("Validating " + $article.FullName)

    node validate-article.js $article.FullName

    if ($LASTEXITCODE -ne 0) {
        Write-Error "Publish blocked. Validation failed."
        exit 1
    }
}

Write-Host "All canonical articles passed validation."
Write-Host "Publish approved."
exit 0
