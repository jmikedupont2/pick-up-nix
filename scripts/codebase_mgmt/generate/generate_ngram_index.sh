#!/usr/bin/env bash
set -euo pipefail

# Configuration
TARGET_DIRS=($1 $2) # Expecting two directories as arguments
NGRAM_SIZES=(1 2 3 5 7 11 13 19 23)
OUTPUT_FILE="ngram_index.json"

# Initialize JSON output
echo "{"
FIRST_DIR=true

for DIR in "${TARGET_DIRS[@]}"; do
    if [ "$FIRST_DIR" = false ]; then
        echo "," >> "$OUTPUT_FILE"
    fi
    echo "  \"$DIR\": {" >> "$OUTPUT_FILE"
    FIRST_DIR=false

    FIRST_FILE=true
    find "$DIR" -type f -print0 | while IFS= read -r -d $'' FILE; do
        if [ "$FIRST_FILE" = false ]; then
            echo "," >> "$OUTPUT_FILE"
        fi
        echo "    \"$FILE\": {" >> "$OUTPUT_FILE"
        FIRST_FILE=false

        FIRST_NGRAM_SIZE=true
        for N in "${NGRAM_SIZES[@]}"; do
            if [ "$FIRST_NGRAM_SIZE" = false ]; then
                echo "," >> "$OUTPUT_FILE"
            fi
            echo "      \"${N}-gram\": {" >> "$OUTPUT_FILE"
            FIRST_NGRAM_SIZE=false

            # Generate N-grams and count them
            # Using tr to normalize whitespace and convert to lowercase
            # Using grep -o to extract N-grams
            # Using sort | uniq -c to count occurrences
            # Using awk to format as JSON
            CONTENT=$(tr -s '[:space:]' '\n' < "$FILE" | tr '[:upper:]' '[:lower:]' | grep -v '^\s*$' || true)
            if [ -n "$CONTENT" ]; then
                echo "$CONTENT" | \
                awk -v n="$N" -f /data/data/com.termux.nix/files/home/pick-up-nix2/scripts/codebase_mgmt/generate/ngram_counter.awk >> "$OUTPUT_FILE"
            fi
            echo "      }" >> "$OUTPUT_FILE"
        done
        echo "    }" >> "$OUTPUT_FILE"
    done
    echo "  }" >> "$OUTPUT_FILE"
done

echo "}" >> "$OUTPUT_FILE"

echo "N-gram index generated: $OUTPUT_FILE"