#!/bin/bash

# Add responsive image script to all section pages
for dir in home nicholas resume contact; do
  file="/Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/$dir/index.html"

  # Add script reference before closing body tag
  sed -i '' -e '/<\/body>/i\
    <script src="/responsive-images.js"></script>' "$file"
done

echo "Added responsive image support to all pages"
