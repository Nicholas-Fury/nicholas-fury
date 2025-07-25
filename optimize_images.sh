#!/bin/bash

# Create image directory for responsive images
mkdir -p /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/responsive

echo "To properly optimize images, you should:"
echo "1. Install ImageMagick with: brew install imagemagick"
echo "2. Run the following commands to create responsive versions:"
echo
echo "# Create responsive versions of featured-image.jpg"
echo "convert /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/featured-image.jpg -resize 1200x /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/responsive/featured-image-1200.jpg"
echo "convert /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/featured-image.jpg -resize 800x /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/responsive/featured-image-800.jpg"
echo "convert /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/featured-image.jpg -resize 400x /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/responsive/featured-image-400.jpg"
echo
echo "# Create responsive versions of me.jpeg"
echo "convert /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/me.jpeg -resize 600x /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/responsive/me-600.jpg"
echo "convert /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/me.jpeg -resize 300x /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/responsive/me-300.jpg"
echo
echo "# Create webp versions for modern browsers"
echo "convert /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/featured-image.jpg -resize 1200x /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/responsive/featured-image-1200.webp"
echo "convert /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/featured-image.jpg -resize 800x /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/responsive/featured-image-800.webp"
echo "convert /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/featured-image.jpg -resize 400x /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/responsive/featured-image-400.webp"
echo "convert /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/me.jpeg -resize 600x /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/responsive/me-600.webp"
echo "convert /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/me.jpeg -resize 300x /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/responsive/me-300.webp"

# Create directory for image creation
mkdir -p /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/resources/responsive
