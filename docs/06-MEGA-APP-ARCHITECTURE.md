# The Mega-App Architecture — One Puzzle, Many Pieces

Your vision: each niche (art, coins, jewelry, furniture, etc.) is its own god-tier app with its own personality and UI — but they snap together into one combined "treasure hunter" mega-app. Here's how to build it so that's actually true, and not eight tangled codebases.

---

## The principle: shared engine, distinct skins

Every one of these apps is, under the hood, the **same machine**:

```
[ multi-image upload ] → [ specialist AI prompt ] → [ deep web research ]
   → [ structured result ] → [ venue routing ] → [ listing generator ]
```

What changes per niche is **only**:
1. The **specialist prompt** (a coin expert vs. an art expert vs. a jeweler).
2. The **result fields** shown (coins show grade & mint mark; art shows attribution & medium).
3. The **venues & specialists** (PCGS for coins; Heritage for art; GIA for jewelry).
4. The **visual identity** (color, type, icon, mood).

So you build the engine **once** and feed it a "niche config." That's the whole trick.

---

## Folder structure for the mega-app

```
treasurehunter/
  server.js                  ← ONE shared backend, proxies the API
  shared/
    engine.js                ← upload, compress, API call, render core
    components.css           ← shared layout primitives
  niches/
    art/
      config.js              ← art prompt, fields, venues, theme
      theme.css              ← ArtPeriod's verdigris/gold identity
    coins/
      config.js              ← coin prompt, grading fields, PCGS venues
      theme.css              ← CoinGrader's copper identity
    jewelry/
      config.js
      theme.css
    ... (one folder per niche)
  hub/
    index.html               ← the mega-app home: pick your hunt
```

Each niche `config.js` exports the same shape:

```js
export default {
  id: 'coins',
  name: 'CoinGrader',
  icon: '🪙',
  theme: 'copper',
  prompt: `You are a professional numismatist...`,   // the specialist
  resultFields: ['mint_mark','grade_range','variety','luster',...],
  venues: [...],                                       // category-specific
  postPlatforms: ['ebay','facebook'],                 // where these sell
}
```

The engine reads the config and builds the right UI + analysis. **Add a niche = add one config + one theme file.** Nothing else.

---

## Two ways to ship, both supported by this structure

**As separate apps** (what you're doing now — CoinGrader, ArtPeriod standalone):
Each niche folder + the shared engine = a standalone deployable app with its own name, URL, landing page, and community. Perfect for niche-by-niche validation and marketing.

**As one mega-app** (the assembled puzzle):
The `hub/index.html` is a home screen — "What did you find?" — with a tile for each niche. Tap "Coins" → loads the coins config into the shared engine. Tap "Art" → loads art. Same engine, different skin, one install. One subscription unlocks all of them.

Because both ship from the same niche configs, **you never rebuild anything**. The standalone CoinGrader and the coins-tile inside the mega-app run identical code.

---

## The build order that makes this real

1. **Now:** Ship ArtPeriod standalone. Validate. (You're here.)
2. **Refactor moment:** Once you have 2 working niches (art + coins), pull the shared parts into `shared/engine.js`. This is a few hours of work and pays for itself immediately.
3. **Each new niche after that** is a config + a theme — a day or two each, not a rebuild.
4. **When you have 3–4 validated niches:** build the `hub` home screen and ship the mega-app. Now one subscription sells access to all of them, and each niche's community funnels users into the same product.

---

## The business logic of the puzzle

- **Standalone apps** = sharp marketing. "CoinGrader" wins r/coins in a way "general scanner" never could. Each niche app is its own beachhead.
- **Mega-app** = higher lifetime value. A reseller who buys art, coins, and furniture wants ONE app and ONE subscription, not three. The combined app is where the money concentrates.
- You get both from one codebase. Market the sharp standalone tools to acquire users in each niche; upsell the combined app to the serious hunters who cross categories.

That's the strategically correct version of your "pieces that form a bigger picture" vision — and this folder structure is what makes it buildable by one person without drowning.
