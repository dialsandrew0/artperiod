// Minimal service worker — enables PWA install. Network-first, no aggressive caching
// (so the app always gets fresh results).
self.addEventListener('install', e => self.skipWaiting());
self.addEventListener('activate', e => self.clients.claim());
self.addEventListener('fetch', e => {
  // pass through — we don't cache API calls; this just satisfies PWA install criteria
});
