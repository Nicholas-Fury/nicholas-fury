#!/bin/bash

# Update service worker to include new files
sed -i '' -e '/const urlsToCache = \[/,/\];/ c\
const urlsToCache = [\
  "/",\
  "/index.html",\
  "/about.html",\
  "/home/",\
  "/home/index.html",\
  "/contact/",\
  "/contact/index.html",\
  "/resume/",\
  "/resume/index.html",\
  "/nicholas/",\
  "/nicholas/index.html",\
  "/styles.css",\
  "/critical.css",\
  "/script.js",\
  "/components.js",\
  "/responsive-images.js",\
  "/responsive-image.html",\
  "/header.html",\
  "/footer.html",\
  "/resources/me.jpeg",\
  "/resources/logo.png",\
  "/resources/featured-image.jpg"\
];' /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/service-worker.js

# Update manifest.json
sed -i '' -e 's/"name": "Nicholas Fury Batson Portfolio",/"name": "Nicholas Fury Batson Portfolio",\n  "description": "Professional portfolio and resume of Nicholas Fury Batson",/' /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/manifest.json

# Update robots.txt or create it if not exists
cat > /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/robots.txt << EOF
User-agent: *
Allow: /

Sitemap: https://www.batson.xyz/sitemap.xml
EOF

# Create a simple sitemap
cat > /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/sitemap.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://www.batson.xyz/</loc>
    <changefreq>weekly</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://www.batson.xyz/home/</loc>
    <changefreq>weekly</changefreq>
    <priority>0.9</priority>
  </url>
  <url>
    <loc>https://www.batson.xyz/nicholas/</loc>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>https://www.batson.xyz/resume/</loc>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>https://www.batson.xyz/contact/</loc>
    <changefreq>monthly</changefreq>
    <priority>0.7</priority>
  </url>
</urlset>
EOF

echo "Final cleanup and best practices applied"
