#!/bin/bash

# Target directory (defaults to current directory if not specified)
TARGET_DIR="${1:-.}"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' does not exist."
    exit 1
fi

# Resolve absolute path of the target directory to safely ignore the script itself if it's placed inside
TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"
SCRIPT_PATH="$(readlink -f "$0")"

# Count total regular files recursively (excluding the script itself)
echo "Scanning directory for files..."
total_files=$(find "$TARGET_DIR" -type f ! -path "$SCRIPT_PATH" | wc -l)

if [ "$total_files" -eq 0 ]; then
    echo "No files found to organize."
    exit 0
fi

echo "Found $total_files files. Organizing by extension into '$TARGET_DIR'..."
echo "--------------------------------------------------"

current=0

# Safely loop through all files recursively using null delimiters to handle spaces or weird characters
while IFS= read -r -d '' file; do
    # Skip the script itself if it lives inside the target directory
    if [ "$file" = "$SCRIPT_PATH" ]; then
        continue
    fi

    current=$((current + 1))
    filename=$(basename "$file")
    
    # Extract extension, default to 'no_extension' if none exists
    if [[ "$filename" == *.* ]]; then
        ext="${filename##*.}"
        ext="${ext,,}" # Convert to lowercase
    else
        ext="no_extension"
    fi
    
    # Create extension folder directly in the root target directory
    dest_dir="$TARGET_DIR/$ext"
    mkdir -p "$dest_dir"
    
    # Handle potential filename collisions if files in different subfolders have identical names
    dest_file="$dest_dir/$filename"
    if [ -e "$dest_file" ]; then
        filename="${filename%.*}_$(date +%s%N).$ext"
        dest_file="$dest_dir/$filename"
    fi

    # Move the file up into the central extension directory
    mv "$file" "$dest_file"
    
    # Print progress update
    printf "[%3d/%3d] Moved '%s' -> %s/\n" "$current" "$total_files" "$filename" "$ext"

done < <(find "$TARGET_DIR" -type f -print0)

echo "--------------------------------------------------"
echo "Done! All files successfully pulled from subfolders and organized."
