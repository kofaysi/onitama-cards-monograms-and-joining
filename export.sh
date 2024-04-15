#!/bin/bash

# Check if a PDF file is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <PDF file>"
    exit 1
fi

input_pdf="$1"

# Ensure the sets.txt exists in the same directory as the script
if [ ! -f sets.txt ]; then
    echo "sets.txt file not found!"
    exit 1
fi

# Convert the entire PDF into high-quality JPEGs first
convert -strip -colorspace sRGB -density 300 "$input_pdf" -quality 100 -scene 1 temp_%04d.jpg

# Read from sets.txt and rename the files accordingly
index=1
while read -r line; do
    base_name=$(echo $line | awk '{print $1}')
    total_count=$(echo $line | awk '{print $2}')

    for ((i=1; i<=total_count; i++)); do
        formatted_index=$(printf "%04d" $index) # Match the output format from convert
        formatted_count=$(printf "%02d" $i)
        output_name="onitama_card_${base_name}_${formatted_count}.jpg"

        if [ -f "temp_${formatted_index}.jpg" ]; then
            mv "temp_${formatted_index}.jpg" "$output_name"
            echo "Renamed to $output_name"
        else
            echo "File temp_${formatted_index}.jpg does not exist."
        fi
        ((index++)) # Increment the index for the next file
    done
done < sets.txt

# Cleanup remaining temporary files
rm temp_*.jpg 2> /dev/null

