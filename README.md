# ArtPeriod™ — Field Art Intelligence

God-tier art identification, valuation, and resale routing for treasure hunters. Point your phone at any artwork and know what it is, what it's worth, where to authenticate it, and where to sell it.

---

## What's in this folder

```
artperiod-full/
  server.js              ← the backend (holds your API key, proxies requests)
  package.json
  SETUP.ps1              ← one-click Windows setup + launch
  .gitignore
  public/
    index.html           ← THE APP (god-tier scanner, 750+ lines)
    manifest.json        ← makes it installable as a phone app (PWA)
  landing/
    index.html           ← marketing landing page
  docs/
    01-QUICKSTART.md     ← start here
    02-GITHUB.md         ← push to GitHub (dialsandrew0@gmail.com)
    03-APK-ANDROID.md    ← turn it into an Android app
    04-DEPLOY.md         ← put it on a public URL
    05-ROLLOUT-PLAN.md   ← honest promotion & launch plan
    06-MEGA-APP-ARCHITECTURE.md  ← how all the niche apps fit together
    07-NICHE-MAP.md      ← every niche, ranked, with launch communities
```

---

## Fastest start (Windows)

1. Install **Node.js LTS** from https://nodejs.org (one time).
2. Right-click **`SETUP.ps1`** → **Run with PowerShell**.
3. Paste your Anthropic API key when asked (get one at https://console.anthropic.com).
4. App opens at **http://localhost:3000**.

Full instructions: `docs/01-QUICKSTART.md`.

---

## What makes it god-tier

- **Multi-image analysis** — full piece + signature + back labels + details, all analyzed together.
- **Deep web research** — searches live auction records, museum collections, artist databases, and stolen-art registries (not just a reverse image lookup).
- **Honest valuation** — research-grounded value ranges that say "decorative, low value" when that's the truth instead of inflating.
- **Authentication routing** — tells you exactly who to contact to verify a piece.
- **Where-to-sell** — matched auction houses, online platforms, and local options with reasoning.
- **Instant listings** — generates ready-to-paste posts for eBay, Facebook, Craigslist, and Instagram.
- **Three modes** — Full Analysis, Quick ID, Value Focus.

---

## The bigger picture

ArtPeriod is the first of a planned family of niche treasure-hunter apps (coins, jewelry, furniture, pottery, and more) that each work standalone AND snap together into one mega-app. The architecture for that is in `docs/06-MEGA-APP-ARCHITECTURE.md`, and the full niche roadmap is in `docs/07-NICHE-MAP.md`.

**Build order:** validate this one with real users first (`docs/05-ROLLOUT-PLAN.md`), then expand niche by niche as demand pulls you forward. CoinGrader is already started as niche #2.

---

## Important notes

- **Your API key stays on the server** — never exposed to the browser or committed to GitHub. Read `docs/02-GITHUB.md` and `docs/04-DEPLOY.md` for the safe patterns.
- **Values are research estimates, not formal appraisals.** For high-value or insurance purposes, use the authentication specialists the app recommends.
- Each scan costs a few cents in API usage. Set a spending limit at console.anthropic.com.
