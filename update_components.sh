#!/bin/bash

# Update all HTML files to use the new components.js approach
for dir in home nicholas resume contact; do
  file="/Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/$dir/index.html"

  # Remove the inline scripts for header and footer loading
  sed -i '' -e '/fetch.*header.html.*document.getElementById/d' "$file"
  sed -i '' -e '/fetch.*footer.html.*document.getElementById/d' "$file"

  # Add the components.js script before the closing body tag
  sed -i '' -e '/<\/body>/i\
    <script src="/components.js"></script>' "$file"
done

echo "Updated all pages to use the new components.js approach"
