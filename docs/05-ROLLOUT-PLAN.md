# ArtPeriod — Honest Rollout & Promotion Plan

Read this before spending a dollar or a weekend on marketing. The goal of phase one is **not** revenue. It's finding out whether anyone actually wants this, cheaply.

---

## Reality check first

You're a solo builder with gig income as your floor. The failure mode is building features and apps nobody validated. So the entire plan below is structured to **get real users in front of this fast and let them tell you if it's worth continuing** — before you build the other niche apps.

ArtPeriod also faces real competition. Be honest about it:
- **Google Lens** — free, identifies famous art. Your wedge: the stuff it can't do (unsigned, regional, valuation, where-to-sell).
- **Smartify** — museum-focused recognition, in 400+ museums. Different use case (education, not resale).
- **Magnus / Artsy** — art-market apps aimed at collectors and galleries.
- **Generic "what's my art worth" sites** — mostly lead-gen for appraisers.

Your defensible position is the **field resale workflow**: identify → value → where-to-sell → listing, for the unglamorous pieces real treasure hunters actually find. Lean into that, not "AI art recognition" in general.

---

## Phase 0 — Prove it works (before ANY promotion)

**Do not show this to a single stranger until you've done this.**

1. Test it on **10–15 pieces you already know the answer to** — things you've sold, things with known artists, an obvious decorative piece, an unsigned one.
2. Check: Does it identify correctly? Are the values sane (not wildly inflated)? Does it correctly say "this is decorative, low value" when that's the truth?
3. If it inflates values or invents attributions, **fix the prompt** in `public/index.html` (the `buildPrompt()` function) before anyone sees it. Inflated values destroy credibility instantly with resellers.

The honesty of the tool IS the product. A reseller who gets burned by a fake-high estimate once will never trust it again — and will say so publicly.

---

## Phase 1 — Deploy + soft launch (week 1)

1. Deploy to a public URL (`04-DEPLOY.md`).
2. Put up the landing page, point its button at the live app.
3. Make a free **PWA install** path so people can add it to their phone.

No paid ads. No big announcement. Just get it live and shareable.

---

## Phase 2 — Get it in front of real treasure hunters (weeks 2–4)

These communities are where your users already are. **Lead with value, never with "check out my app."** Most of these groups ban self-promotion — so participate genuinely and let the tool come up naturally, or post a genuinely useful "I built a free tool, here's what it does, would love feedback" in groups that allow it.

**Reddit** (read each sub's self-promo rules first):
- r/whatsthisworth — people literally posting items asking for value. Answer some, mention the tool where allowed.
- r/Flipping — resellers, very active, money-motivated.
- r/ThriftStoreHauls, r/ThriftGifts — thrifters showing finds.
- r/estatesales, r/AntiquesAndCollectables
- r/Art (for ID help threads specifically)

**Facebook Groups** (huge for this audience):
- Estate sale / estate liquidation groups
- Reseller and "flipping for profit" groups
- Local buy/sell/trade and antique groups in your area (Atlanta/Perimeter)

**In person** (your unfair advantage — you do this work):
- Estate sales and auctions you already attend — show it on your phone to other buyers.
- Local antique malls, flea markets, the people running booths.
- This is the highest-trust channel and costs nothing. Real demos to real people beat any ad.

**Content** (compounds over time):
- Short videos: "I scanned this $5 thrift painting and here's what it's actually worth." TikTok / YouTube Shorts / Instagram Reels. This format is proven for the reseller niche and the tool is inherently visual.

---

## Phase 3 — Listen and decide (week 4+)

Watch for the signal:
- Are people **coming back** and scanning more than once?
- Are they saying "this saved me" or "this was wrong"?
- Is anyone asking "can I pay for X" or "does it do coins/jewelry/furniture too"?

That last question is your bridge to the next niche app. **Let demand pull you into the next category** instead of guessing.

---

## When (and only when) to monetize

Don't bolt on payments early. Get people using it and loving it first. When you do:
- **Free tier:** a handful of scans per month.
- **Pro (~$8–15/mo):** unlimited scans, deep research, post generation, save/track finds.
- **Per-report option:** one-off paid detailed report for a specific valuable piece — good for non-subscribers.

Resellers will pay for something that makes them money. Hobbyists mostly won't. Aim the paid tier at the people flipping for profit.

---

## What NOT to do
- Don't build the other 7 niche apps yet. Validate this one first.
- Don't run paid ads until organic shows people want it.
- Don't inflate values to seem impressive. It's the fastest way to lose this audience.
- Don't spread across all platforms at once. Pick 2–3, do them well.
