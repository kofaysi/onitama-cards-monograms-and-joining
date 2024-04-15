#!/bin/bash

# Ensure the script is run with input arguments
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file1.jpg> <file2.jpg> ..."
    exit 1
fi

# Loop through each file provided as an argument
for file in "$@"; do
    # Check if the file extension is .jpg
    if [[ $file =~ \.jpg$ ]]; then
    	if [[ ! $file =~ _monogram\.jpg$ ]]; then
		# Extract the string between underscores that starts with a capital letter
		string=$(echo "$file" | sed -n 's/.*_\([A-Z][A-Z1-9]*\)_.*/\1/p')

		# Check if the extracted string is "B"
		if [[ "$string" != "B" && ! -z "$string" ]]; then
		    # Generate output filename
		    outputfile="${file%.jpg}_monogram.jpg"

		    # Use convert to add text to the top left corner of the image
		    convert "$file" -font opendyslexicmono -pointsize 42 -fill black -gravity northwest -draw "text 120,120 '$string'" "$outputfile"

		    echo "Processed: $outputfile"
		else
		    echo "Base game card detected, no modification made: $file"
		fi
	else
		echo "Monogram card detected, no modification made: $file"
	fi
    else
        echo "Skipping non-jpg file: $file"
    fi
done

