#!/bin/bash

# Add critical CSS inline to pages
for dir in home nicholas resume contact; do
  file="/Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/$dir/index.html"

  # Update stylesheet loading to be non-blocking
  sed -i '' -e 's/<link rel="stylesheet" href="\/styles.css">/<link rel="stylesheet" href="\/styles.css" media="print" onload="this.media='\''all'\''">/' "$file"

  # Add no-fouc class to body
  sed -i '' -e 's/<body>/<body class="no-fouc">/' "$file"

  # Add JS at the end to show content when loaded
  sed -i '' -e '/<\/body>/i\
    <script>window.addEventListener("load", function() { document.body.classList.add("loaded"); });</script>' "$file"
done

# Create a separate script to inject the critical CSS (simpler approach)
for dir in home nicholas resume contact; do
  file="/Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/$dir/index.html"

  # Add critical CSS reference
  sed -i '' -e '/<head>/a\
    <!-- Critical CSS for faster rendering -->\
    <link rel="stylesheet" href="/critical.css">' "$file"
done

echo "Added performance optimizations to all pages"
