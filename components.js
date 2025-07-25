// components.js - Shared component loading with caching
(function() {
    // Function to load components with cache-first strategy
    async function loadComponent(url, targetEl, callback = null) {
        const cacheName = 'nicholas-batson-layout-cache';

        try {
            // Try getting from cache first
            if ('caches' in window) {
                const cache = await caches.open(cacheName);
                const cachedResponse = await cache.match(url);

                if (cachedResponse) {
                    const data = await cachedResponse.text();
                    targetEl.innerHTML = data;
                    if (callback) callback();

                    // Fetch a fresh copy in the background to update cache
                    fetch(url)
                        .then(response => {
                            if (response.ok) {
                                cache.put(url, response.clone());
                                return response.text();
                            }
                        })
                        .then(freshData => {
                            if (freshData && targetEl.innerHTML !== freshData) {
                                targetEl.innerHTML = freshData;
                                if (callback) callback();
                            }
                        })
                        .catch(err => console.warn('Background refresh failed:', err));

                    return;
                }
            }

            // Not in cache, fetch directly
            const response = await fetch(url);
            if (!response.ok) throw new Error(`HTTP error ${response.status}`);

            const data = await response.text();
            targetEl.innerHTML = data;
            if (callback) callback();

            // Cache for future use if caching is available
            if ('caches' in window) {
                const cache = await caches.open(cacheName);
                cache.put(url, response.clone());
            }
        } catch (err) {
            console.error(`Error loading ${url}:`, err);
        }
    }

    // Load header and footer when DOM is ready
    document.addEventListener('DOMContentLoaded', function() {
        const headerEl = document.getElementById('header');
        const footerEl = document.getElementById('footer');

        if (headerEl) {
            loadComponent('/header.html', headerEl, function() {
                // Setup mobile menu toggle after header loads
                const menuToggle = document.querySelector('.menu-toggle');
                const navLinks = document.querySelector('.nav-links');

                if (menuToggle && navLinks) {
                    menuToggle.addEventListener('click', function() {
                        const expanded = navLinks.classList.contains('show-nav');
                        navLinks.classList.toggle('show-nav');
                        menuToggle.setAttribute('aria-expanded', !expanded);

                        // Trap focus within mobile menu when open
                        if (!expanded) {
                            const focusableElements = navLinks.querySelectorAll('a[href], button');
                            if (focusableElements.length > 0) {
                                setTimeout(() => focusableElements[0].focus(), 100);
                            }
                        }
                    });

                    // Close menu on escape key
                    document.addEventListener('keydown', function(e) {
                        if (e.key === 'Escape' && navLinks.classList.contains('show-nav')) {
                            navLinks.classList.remove('show-nav');
                            menuToggle.setAttribute('aria-expanded', 'false');
                            menuToggle.focus();
                        }
                    });
                }
            });
        }

        if (footerEl) {
            loadComponent('/footer.html', footerEl);
        }
    });

    // Make functions available globally
    window.NicholasBatson = window.NicholasBatson || {};
    window.NicholasBatson.loadComponent = loadComponent;
})();
