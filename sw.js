/* Service Worker — מפגש הספורט טבריה
   מטמון קבצי הליבה כדי שהאפליקציה תעבוד אופליין ותיטען מיידית. */

const CACHE = 'zchiyot-v1';
const ASSETS = [
  './',
  './index.html',
  './manifest.webmanifest',
  './icon.svg',
];

self.addEventListener('install', (e) => {
  e.waitUntil(
    caches.open(CACHE).then((c) => c.addAll(ASSETS)).then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', (e) => {
  e.waitUntil(
    caches.keys().then((keys) =>
      Promise.all(keys.filter((k) => k !== CACHE).map((k) => caches.delete(k)))
    ).then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', (e) => {
  if (e.request.method !== 'GET') return;
  const isDoc =
    e.request.mode === 'navigate' ||
    e.request.destination === 'document';

  if (isDoc) {
    // מסמכי HTML: network-first — עדכונים מגיעים מיד, נפילה ל-cache באופליין
    e.respondWith(
      fetch(e.request).then((res) => {
        const copy = res.clone();
        caches.open(CACHE).then((c) => c.put(e.request, copy)).catch(() => {});
        return res;
      }).catch(() => caches.match(e.request).then((h) => h || caches.match('./index.html')))
    );
    return;
  }

  // שאר הנכסים (סטטיים): cache-first עם רענון רקע
  e.respondWith(
    caches.match(e.request).then((hit) =>
      hit || fetch(e.request).then((res) => {
        const copy = res.clone();
        caches.open(CACHE).then((c) => c.put(e.request, copy)).catch(() => {});
        return res;
      })
    )
  );
});
