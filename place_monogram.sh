#!/bin/bash

# Ensure the script is run with input arguments
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file1.png> <file2.png> ..."
    exit 1
fi

# Loop through each file provided as an argument
for file in "$@"; do
    # Check if the file extension is .png
    if [[ $file =~ \.png$ ]]; then
    	if [[ ! $file =~ _monogram\.png$ ]]; then
		# Extract the string between underscores that starts with a capital letter
		string=$(echo "$file" | sed -n 's/.*_\([A-Z][A-Z1-9]*\)_.*/\1/p')

		# Check if the extracted string is "B"
		if [[ "$string" != "B" && ! -z "$string" ]]; then
		    # Generate output filename
		    outputfile="${file%.png}_monogram.png"

		    # Use convert to add text to the top left corner of the image
		    convert "$file" -font opendyslexicmono -gravity northwest -pointsize 10 -draw "text 32,28 '$string'" "$outputfile"

		    echo "Processed: $outputfile"
		else
		    echo "Base game card detected, no modification made: $file"
		fi
	else
		echo "Monogram card detected, no modification made: $file"
	fi
    else
        echo "Skipping non-png file: $file"
    fi
done

