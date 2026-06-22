# Putting ArtPeriod on GitHub

Account: **dialsandrew0@gmail.com**

## One-time GitHub setup

1. Create the account / sign in at https://github.com (use dialsandrew0@gmail.com).
2. Install **Git for Windows**: https://git-scm.com/download/win
3. Install **GitHub CLI** (makes this painless): https://cli.github.com

## Create the repo and push (PowerShell, in this folder)

```powershell
# First time only — tell git who you are
git config --global user.name "Andrew Dials"
git config --global user.email "dialsandrew0@gmail.com"

# Authenticate the GitHub CLI (opens browser, log in once)
gh auth login

# Initialize and push
git init
git add .
git commit -m "ArtPeriod v1 - field art intelligence"
gh repo create artperiod --private --source=. --remote=origin --push
```

That creates a **private** repo named `artperiod` under your account and pushes everything.

> Want it public later? Run: `gh repo edit --visibility public`

## CRITICAL — protect your API key

**Never commit your real API key to GitHub**, especially a public repo. Bots scan GitHub for leaked keys within minutes.

This project already includes a `.gitignore` that excludes `server.js` if you rename your working copy. Safest pattern:

1. Keep `server.js` with the placeholder `YOUR_KEY_HERE` in the repo.
2. Make a local copy `server.local.js` with your real key (it's gitignored).
3. Or use an environment variable (see `docs/04-DEPLOY.md`).

If you ever push a key by accident: **revoke it immediately** at console.anthropic.com and make a new one.

## Updating the repo later

```powershell
git add .
git commit -m "describe what changed"
git push
```
