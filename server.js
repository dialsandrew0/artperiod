const express = require('express');
const path = require('path');
const app = express();

// ═══════════════════════════════════════════════════════════════
//   ArtPeriod Server
//   ----------------------------------------------------------------
//   This file NEVER contains your API key.
//   The key lives only in the environment:
//     • On Render  → add ANTHROPIC_API_KEY in the Environment tab
//     • Locally    → run:  set ANTHROPIC_API_KEY=your-key
//                    then:  node server.js
//   Safe to commit to GitHub — no secret inside.
// ═══════════════════════════════════════════════════════════════

const ANTHROPIC_KEY = process.env.ANTHROPIC_API_KEY || 'YOUR_KEY_HERE';
const PORT = process.env.PORT || 3000;

// Allow large image payloads (several compressed photos at once)
app.use(express.json({ limit: '50mb' }));
app.use(express.static(path.join(__dirname, 'public')));

// ── Analysis proxy: keeps the key server-side, forwards real errors ──
app.post('/api/analyze', async (req, res) => {
  if (!ANTHROPIC_KEY || ANTHROPIC_KEY === 'YOUR_KEY_HERE') {
    console.error('[analyze] No API key configured.');
    return res.status(500).json({
      error: { message: 'Server has no API key. On Render, add ANTHROPIC_API_KEY in the Environment tab; locally, run "set ANTHROPIC_API_KEY=your-key" before node server.js.' }
    });
  }

  try {
    const upstream = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': ANTHROPIC_KEY,
        'anthropic-version': '2023-06-01'
      },
      body: JSON.stringify(req.body)
    });

    // Read raw text first so a non-JSON response can never crash us
    const raw = await upstream.text();
    console.log(`[analyze] Anthropic responded ${upstream.status}`);

    let data;
    try {
      data = JSON.parse(raw);
    } catch (e) {
      console.error('[analyze] Non-JSON from Anthropic:', raw.slice(0, 300));
      return res.status(502).json({
        error: { message: 'Upstream returned an unexpected response: ' + raw.slice(0, 200) }
      });
    }

    if (data.error) {
      console.error('[analyze] Anthropic error:', JSON.stringify(data.error).slice(0, 300));
    }

    // Forward the real status + body so the browser sees the true error
    res.status(upstream.status).json(data);

  } catch (err) {
    console.error('[analyze] Server exception:', err.message);
    res.status(500).json({ error: { message: 'Server error: ' + err.message } });
  }
});

// ── Health check: open /health to confirm the key is loaded ──
app.get('/health', (_req, res) => {
  res.json({ ok: true, keySet: ANTHROPIC_KEY !== 'YOUR_KEY_HERE' });
});

app.listen(PORT, () => {
  console.log('\n  ┌──────────────────────────────────────────┐');
  console.log('  │   ArtPeriod  —  Field Art Intelligence     │');
  console.log('  └──────────────────────────────────────────┘');
  console.log(`  Running on port ${PORT}`);
  console.log(`  API key: ${ANTHROPIC_KEY !== 'YOUR_KEY_HERE' ? 'loaded ✓' : 'NOT SET — set ANTHROPIC_API_KEY'}\n`);
});
