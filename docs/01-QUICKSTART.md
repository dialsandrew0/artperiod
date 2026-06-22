# ArtPeriod — Quick Start

## The fastest path (Windows)

1. **Install Node.js** (one time only): download the **LTS** version from https://nodejs.org and install it. Use LTS (24.x), not "Current".
2. **Right-click `SETUP.ps1`** → **Run with PowerShell**.
3. When prompted, paste your **Anthropic API key** (get one at https://console.anthropic.com → API Keys → Create Key).
4. The script installs everything and opens the app at **http://localhost:3000**.

That's it. To run it again later, just double-run `SETUP.ps1`, or open PowerShell in this folder and type `node server.js`.

> If PowerShell blocks the script with an execution-policy error, run this once in PowerShell (as your normal user):
> ```
> Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
> ```
> Then run `SETUP.ps1` again.

## The manual path (any OS)

```
1. Open server.js, replace YOUR_KEY_HERE with your Anthropic key, save.
2. In a terminal in this folder:
     npm install
     node server.js
3. Open http://localhost:3000
```

## Using the app

- **Add photos** — full piece, plus close-ups of the signature and any labels on the back. More angles = deeper research.
- **Deep web research** toggle (on by default) searches live auction records and databases. Turn it off for faster, ID-only results.
- **Modes**: Full Analysis (everything), Quick ID (just identify), Value Focus (valuation + resale).
- After analysis, hit **Generate Sale Posts** for ready-to-paste eBay / Facebook / Craigslist / Instagram listings.

## Cost note

Each scan calls the Anthropic API and costs a few cents (deep search with multiple images costs a bit more). You only pay for what you use. Set a spending limit at https://console.anthropic.com/settings/limits.
