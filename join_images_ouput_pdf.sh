#!/bin/bash

# Create an associative array to store the preferred filenames
declare -A selected_files

# Loop through all .jpg files in the directory
for file in *.jpg; do
    if [[ $file =~ \.jpg$ && ! $file =~ _monogram\.jpg$ ]]; then
        # Extract the base filename by removing "_monogram.jpg" or ".jpg"
        base_name=$(echo "$file" | sed -e 's/_monogram\.jpg$//' -e 's/\.jpg$//')

        # Determine the corresponding monogram and base file names
        monogram_file="${base_name}_monogram.jpg"
        base_file="${base_name}.jpg"

        # Prefer the _monogram version if it exists, else consider the base file
        if [[ -f "$monogram_file" ]]; then
            selected_files["$base_name"]="$monogram_file"
        elif [[ $file == "$base_file" && ! -f "$monogram_file" ]]; then
            selected_files["$base_name"]="$base_file"
        fi
    fi
done

# Collect all unique selected filenames into an array
file_array=("${selected_files[@]}")

# Sort the array alphabetically
IFS=$'\n' sorted_files=($(sort <<<"${file_array[*]}"))
unset IFS

# Use ImageMagick's montage to create a PDF and pipe it to Ghostscript for optimization
montage "${sorted_files[@]}" -tile 2x2 -geometry 1176x743+117+128 -density 95.2 -units PixelsPerCentimeter PDF:- | gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile='Onitama cards 2x2 (A4) optimised'.pdf -

# montage onitama_*.png -tile 2x2 -geometry 1176x743+117+128 -density 95.2 -units PixelsPerCentimeter cards.pdf

echo "PDF creation and optimization complete."

