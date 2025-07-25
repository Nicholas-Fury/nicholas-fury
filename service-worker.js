// Service worker for offline capabilities and improved performance

const CACHE_NAME = 'nicholas-batson-website-v3';
const urlsToCache = [
  '/',
  '/index.html',
  '/about.html',
  '/home/',
  '/home/index.html',
  '/contact/',
  '/contact/index.html',
  '/resume/',
  '/resume/index.html',
  '/nicholas/',
  '/nicholas/index.html',
  '/styles.css',
  '/script.js',
  '/header.html',
  '/footer.html',
  '/resources/me.jpeg',
  '/resources/logo.png',
  '/resources/featured-image.jpg'
];

// Install service worker
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        console.log('Opened cache');
        return cache.addAll(urlsToCache);
      })
  );
});

// Cache and return requests with strategy based on file type
self.addEventListener('fetch', event => {
  const url = new URL(event.request.url);

  // Apply different strategies based on resource type
  if (url.pathname.match(/\.(jpg|jpeg|png|gif|svg)$/)) {
    // Cache-first strategy for images
    event.respondWith(cacheFirst(event.request));
  } else if (url.pathname.match(/\.(css|js)$/)) {
    // Stale-while-revalidate for CSS/JS files
    event.respondWith(staleWhileRevalidate(event.request));
  } else {
    // Network-first for HTML and other files
    event.respondWith(networkFirst(event.request));
  }
});

// Cache-first strategy (good for images)
function cacheFirst(request) {
  return caches.match(request)
    .then(cachedResponse => {
      return cachedResponse || fetch(request).then(response => {
        return caches.open(CACHE_NAME).then(cache => {
          cache.put(request, response.clone());
          return response;
        });
      });
    });
}

// Network-first strategy (good for HTML)
function networkFirst(request) {
  return fetch(request)
    .then(response => {
      // Cache a copy of the response
      const responseClone = response.clone();
      caches.open(CACHE_NAME).then(cache => {
        cache.put(request, responseClone);
      });
      return response;
    })
    .catch(() => {
      return caches.match(request);
    });
}

// Stale-while-revalidate (good for CSS/JS)
function staleWhileRevalidate(request) {
  return caches.match(request).then(cachedResponse => {
    // Return cached response immediately
    const fetchPromise = fetch(request).then(response => {
      // Update the cache
      caches.open(CACHE_NAME).then(cache => {
        cache.put(request, response.clone());
      });
      return response;
    });
    return cachedResponse || fetchPromise;
  });
}

// Update service worker
self.addEventListener('activate', event => {
  const cacheWhitelist = [CACHE_NAME];
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          if (cacheWhitelist.indexOf(cacheName) === -1) {
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});
