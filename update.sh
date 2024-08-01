#!/bin/bash

# Define the directory to start the search from (current directory by default)
SEARCH_DIR="${1:-.}"

# Find all .py files recursively and apply the sed replacement
find "$SEARCH_DIR" -type f -name "*.py" | while read -r file; do
    echo "Processing $file"
    # Apply sed replacement for both plain string and mixed string-variable print statements
    sed -i.bak -E 's/print\s+(.+)/print(\1)/g' "$file"
done

# Optionally remove backup files if everything is fine
# Uncomment the following line if you want to delete .bak files
# find "$SEARCH_DIR" -type f -name "*.bak" -delete
