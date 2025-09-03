#!/bin/bash

# Check if a filename was provided
if [ -z "$1" ]; then
  echo "Usage: $0 filename.md"
  exit 1
fi

# Get the input filename
INPUT_FILE="$1"

# Extract the base name (strip the .md extension)
BASENAME=$(basename "$INPUT_FILE" .md)

# Create the output filename
OUTPUT_FILE="${BASENAME}.pdf"

# Run pandoc with xelatex
#pandoc "$INPUT_FILE" -o "$OUTPUT_FILE" --pdf-engine=xelatex
pandoc "$INPUT_FILE" -o "$OUTPUT_FILE" --pdf-engine=xelatex -f markdown+pipe_tables -V geometry:margin=1in


# Notify user
echo "Converted $INPUT_FILE to $OUTPUT_FILE"

