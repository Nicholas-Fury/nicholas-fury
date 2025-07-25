#!/bin/bash

# Add security headers and meta tags to all section pages
for dir in nicholas resume contact; do
  file="/Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/$dir/index.html"

  # Get the title from the file
  title=$(grep -m1 "<title>" "$file" | sed 's/<title>\(.*\)<\/title>/\1/')

  # Extract just the section name for descriptions
  section=$(echo $dir | sed 's/^./\U&/') # Capitalize first letter

  # Create temp file with new headers
  cat > /tmp/header.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Nicholas Fury Batson - $section page showcasing professional information">
    <meta name="keywords" content="Nicholas Batson, Fury, AI, technical, program, manager, $dir, portfolio, professional">
    <meta name="author" content="Nicholas Fury Batson">
    <!-- Security headers -->
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' https://cdnjs.cloudflare.com; style-src 'self' 'unsafe-inline' https://cdnjs.cloudflare.com https://fonts.googleapis.com; font-src 'self' https://fonts.gstatic.com; img-src 'self' data:; connect-src 'self';">
    <meta http-equiv="X-Content-Type-Options" content="nosniff">
    <meta http-equiv="X-Frame-Options" content="DENY">
    <meta http-equiv="X-XSS-Protection" content="1; mode=block">
    <meta http-equiv="Referrer-Policy" content="strict-origin-when-cross-origin">
    <meta http-equiv="Permissions-Policy" content="geolocation=(), microphone=(), camera=()">
    <meta property="og:title" content="$title">
    <meta property="og:description" content="$section section of Nicholas Fury Batson's professional portfolio">
    <meta property="og:image" content="/resources/featured-image.jpg">
    <meta property="og:url" content="https://www.batson.xyz/$dir/">
    <meta property="og:type" content="website">
    <meta name="twitter:card" content="summary_large_image">
    <title>$title</title>
EOF

  # Replace the head section in the file
  sed -i '' -e '1,/<title>.*<\/title>/d' "$file"
  cat /tmp/header.html "$file" > /tmp/newfile.html
  mv /tmp/newfile.html "$file"
done

echo "Added security headers and meta tags to all section pages"
