#!/bin/bash

# Remove backup directories
echo "Removing backup directories..."
rm -rf /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/subdomains-backup/

# Remove original subdomain directory (now redundant)
echo "Removing original subdomain directory..."
rm -rf /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/subdomains/

# Remove temporary DNS refresh file
echo "Removing temporary DNS refresh file..."
rm -f /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/dns_refresh.md

# Option to remove utility scripts (commented out by default)
# Uncomment if you want to remove them
echo "If you want to remove the utility scripts, uncomment these lines in the script:"
echo "# rm -f /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/add_critical_css.sh"
echo "# rm -f /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/add_responsive_images.sh"
echo "# rm -f /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/final_cleanup.sh"
echo "# rm -f /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/optimize_images.sh"
echo "# rm -f /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/update_components.sh"
echo "# rm -f /Users/nicholasfurybatson/Documents/GitHub/nicholas-fury/update_headers.sh"

echo "Done! Your repository is now clean and ready for pushing."
