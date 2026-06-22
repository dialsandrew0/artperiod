# Deploying ArtPeriod to a public URL

Right now the app runs only on your machine (localhost). To share it — for a landing page, PWA install, or APK — host it publicly. Free options below.

## Easiest: Render.com (free tier)

1. Push the project to GitHub first (see `02-GITHUB.md`).
2. Go to https://render.com → sign up → **New → Web Service**.
3. Connect your `artperiod` GitHub repo.
4. Settings:
   - **Build command:** `npm install`
   - **Start command:** `node server.js`
   - **Instance type:** Free
5. Add your API key as an **environment variable** (the SAFE way):
   - Key: `ANTHROPIC_API_KEY`
   - Value: your `sk-ant-...` key
6. **Edit `server.js`** to read from the environment instead of the hardcoded value:
   ```js
   const ANTHROPIC_KEY = process.env.ANTHROPIC_API_KEY || 'YOUR_KEY_HERE';
   ```
7. Deploy. You'll get a URL like `https://artperiod.onrender.com`.

This keeps your key off GitHub entirely — it lives only in Render's environment settings.

## Alternative: Railway.app
Same idea — connect GitHub, set the `ANTHROPIC_API_KEY` env var, deploy. Railway is fast and has a free starter tier.

## After deploying
- Update the landing page button (`landing/index.html`) to point at your live URL instead of `http://localhost:3000`.
- For the APK (Path B), point the app's fetch URL at this deployed backend.
- Free tiers sleep when idle — the first request after a while takes ~30 seconds to wake up. Fine for early testing.
