# ═══════════════════════════════════════════════════════════════
#  ArtPeriod — One-Shot Setup Script (Windows PowerShell)
#  Right-click this file → "Run with PowerShell"
#  OR open PowerShell in this folder and run:  .\SETUP.ps1
# ═══════════════════════════════════════════════════════════════

Write-Host ""
Write-Host "  ╔════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "  ║      ArtPeriod  —  Setup & Launch          ║" -ForegroundColor Cyan
Write-Host "  ╚════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# --- 1. Check Node.js ---
Write-Host "  [1/5] Checking for Node.js..." -ForegroundColor Yellow
$nodeVersion = $null
try { $nodeVersion = node --version 2>$null } catch {}

if (-not $nodeVersion) {
    Write-Host "  ✗ Node.js is NOT installed." -ForegroundColor Red
    Write-Host ""
    Write-Host "    Install the LTS version (24.x, NOT 'Current') from:" -ForegroundColor White
    Write-Host "    https://nodejs.org" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "    Then run this script again." -ForegroundColor White
    Write-Host ""
    Read-Host "  Press Enter to exit"
    exit
}
Write-Host "  ✓ Node.js found: $nodeVersion" -ForegroundColor Green

# Warn about Node 26+ (known to break some native modules)
$major = [int]($nodeVersion -replace 'v','' -split '\.')[0]
if ($major -ge 26) {
    Write-Host "  ⚠ You're on Node $major. If you hit native-module errors later," -ForegroundColor Yellow
    Write-Host "    switch to Node 24 LTS. (Not needed for this app, but noted.)" -ForegroundColor Yellow
}

# --- 2. Pick a free port ---
Write-Host "  [2/5] Finding a free port..." -ForegroundColor Yellow
$port = 3000
$maxPort = 3010
while ($port -le $maxPort) {
    $portInUse = @(Get-NetTCPConnection -LocalPort $port -ErrorAction SilentlyContinue).Count -gt 0
    if (-not $portInUse) {
        break
    }
    $port++
}

if ($port -gt $maxPort) {
    Write-Host "  ✗ Could not find a free port between 3000 and $maxPort." -ForegroundColor Red
    Read-Host "  Press Enter to exit"
    exit
}

Write-Host "  ✓ Using port $port for the server" -ForegroundColor Green

# --- 3. Check API key ---
Write-Host ""
Write-Host "  [3/5] Checking API key..." -ForegroundColor Yellow
$serverContent = Get-Content -Path ".\server.js" -Raw
if ($serverContent -match "YOUR_KEY_HERE") {
    Write-Host "  ⚠ No API key set yet." -ForegroundColor Yellow
    Write-Host ""
    Write-Host "    1. Go to https://console.anthropic.com" -ForegroundColor White
    Write-Host "    2. API Keys → Create Key → copy it" -ForegroundColor White
    Write-Host ""
    $key = Read-Host "    Paste your Anthropic API key here (or press Enter to skip)"
    if ($key -and $key.StartsWith("sk-ant")) {
        $serverContent = $serverContent -replace "YOUR_KEY_HERE", $key
        Set-Content -Path ".\server.js" -Value $serverContent -NoNewline
        Write-Host "  ✓ API key saved to server.js" -ForegroundColor Green
    } elseif ($key) {
        Write-Host "  ✗ That doesn't look like a valid key (should start with sk-ant)." -ForegroundColor Red
        Write-Host "    You can edit server.js manually later." -ForegroundColor White
    } else {
        Write-Host "  → Skipped. Edit server.js manually before scanning." -ForegroundColor White
    }
} else {
    Write-Host "  ✓ API key already set" -ForegroundColor Green
}

# --- 4. Install dependencies ---
Write-Host ""
Write-Host "  [4/5] Installing dependencies (npm install)..." -ForegroundColor Yellow
npm install
if ($LASTEXITCODE -ne 0) {
    Write-Host "  ✗ npm install failed. Check your internet connection." -ForegroundColor Red
    Read-Host "  Press Enter to exit"
    exit
}
Write-Host "  ✓ Dependencies installed" -ForegroundColor Green

# --- 5. Launch ---
Write-Host ""
Write-Host "  [5/5] Starting ArtPeriod..." -ForegroundColor Yellow
Write-Host ""
Write-Host "  ════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "   App will open at:  http://localhost:$port" -ForegroundColor Green
Write-Host "   Press Ctrl+C in this window to stop." -ForegroundColor White
Write-Host "  ════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
c
Start-Sleep -Seconds 2
Start-Process "http://localhost:$port"
$env:PORT = $port
node server.js
