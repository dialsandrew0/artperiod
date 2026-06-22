# Turning ArtPeriod into an Android APK

There are two honest paths. Read both, pick one.

---

## Path A — PWA install (fastest, no build tools, works today)

A "Progressive Web App" lets people **install the web app to their home screen** straight from the browser. It looks and feels like an app — own icon, full screen, no address bar. No Android Studio, no APK, no Play Store.

**What you do:**
1. Deploy the web app to a public URL (see `04-DEPLOY.md` — Render/Railway, ~15 min).
2. The included `public/manifest.json` and service worker make it installable.
3. Users open the URL in Chrome on Android → menu → **"Install app"** / **"Add to Home screen"**.

**Pros:** live in minutes, instant updates, zero build pain.
**Cons:** not in the Play Store, no APK file to hand someone directly.

This is the right first move. Validate demand before fighting with native builds.

---

## Path B — Real APK via Capacitor (when you want a real installable file / Play Store)

Capacitor wraps your web app in a native Android shell and produces an actual `.apk`. You already used Node for GigOS, so the toolchain is familiar.

### Prerequisites (one time)
- **Android Studio**: https://developer.android.com/studio (includes the Android SDK)
- **Java JDK 17** (Android Studio bundles one)
- Node.js LTS (you have this)

### Steps (PowerShell, in this folder)

```powershell
# 1. Add Capacitor to the project
npm install @capacitor/core @capacitor/cli @capacitor/android

# 2. Initialize (use these exact answers when prompted)
#    App name:    ArtPeriod
#    Package ID:  com.artperiod.app
npx cap init "ArtPeriod" "com.artperiod.app" --web-dir=public

# 3. Add the Android platform
npx cap add android

# 4. Copy your web files in
npx cap copy

# 5. Open in Android Studio
npx cap open android
```

In Android Studio: **Build → Build Bundle(s)/APK(s) → Build APK(s)**. The APK lands in:
`android/app/build/outputs/apk/debug/app-debug.apk`

That file installs on any Android phone (enable "install from unknown sources").

### IMPORTANT — the API key problem for native apps

Your current setup keeps the key safe on a **server**. A native app has no server attached unless you point it at one. So for the APK:

1. Deploy the backend (`server.js`) to a public host (see `04-DEPLOY.md`).
2. In `public/index.html`, change the fetch URL from `/api/analyze` to your deployed URL, e.g. `https://artperiod.onrender.com/api/analyze`.
3. Re-run `npx cap copy` and rebuild.

This keeps your key on the server, never inside the distributed APK. **Never hardcode the key in the app** — anyone can unzip an APK and read it.

### Play Store (optional, later)
- Google Play Developer account: $25 one-time.
- You'll need a signed release build (not debug) and store assets.
- Only worth it once you have users asking for it.
