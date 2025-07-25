// Add this to components.js to handle responsive images

// Helper function to replace image elements with responsive picture elements
function makeImagesResponsive() {
  // Don't run on browsers that don't support the picture element
  if (!('HTMLPictureElement' in window)) {
    return;
  }

  // Get the responsive image template
  fetch('/responsive-image.html')
    .then(response => response.text())
    .then(templateHtml => {
      // Find all eligible images to convert
      const images = document.querySelectorAll('img[src^="/resources/"]');

      images.forEach(img => {
        // Skip SVGs and already processed images
        if (img.src.endsWith('.svg') || img.closest('picture')) {
          return;
        }

        // Get image properties
        const src = img.getAttribute('src');
        const alt = img.getAttribute('alt') || '';
        const className = img.className || '';
        const width = img.getAttribute('width') || '';
        const height = img.getAttribute('height') || '';

        // Extract filename for responsive versions
        const pathParts = src.split('/');
        const filename = pathParts[pathParts.length - 1].split('.')[0];

        // Fill in the template
        let html = templateHtml;
        html = html.replace(/\[filename\]/g, filename);
        html = html.replace(/\[original\]/g, filename + (src.endsWith('.jpg') ? '.jpg' : '.jpeg'));
        html = html.replace(/\[alt\]/g, alt);
        html = html.replace(/\[class\]/g, className);
        html = html.replace(/\[width\]/g, width);
        html = html.replace(/\[height\]/g, height);

        // Replace the image with the picture element
        const tempDiv = document.createElement('div');
        tempDiv.innerHTML = html.trim();
        const picture = tempDiv.firstChild;
        img.parentNode.replaceChild(picture, img);
      });
    })
    .catch(error => console.error('Error loading responsive image template:', error));
}

// Add to DOMContentLoaded event
document.addEventListener('DOMContentLoaded', function() {
  // Run after a small delay to ensure images are in the DOM
  setTimeout(makeImagesResponsive, 100);
});
