#!/bin/bash

TARGET="$1"
HASH_FILE_DIR="./hashes"
HASH_FILE="$HASH_FILE_DIR/hashes.sha256"

# Validate target input (file or directory)
if [[ -z "$TARGET" || ( ! -d "$TARGET" && ! -f "$TARGET" ) ]]; then
    echo "Error: Please provide a valid target directory or file."
    echo "Usage: ./generate_hashes.sh <target_dir_or_file>"
    exit 1
fi

# Compute hashes and print to CLI
if [[ -d "$TARGET" ]]; then
    HASH_OUTPUT=$(find "$TARGET" -type f -exec sha256sum {} \;)
elif [[ -f "$TARGET" ]]; then
    HASH_OUTPUT=$(sha256sum "$TARGET")
fi

echo "Generated hashes:"
echo "$HASH_OUTPUT"

# Prompt user to save hashes
read -p "Save hashes to '$HASH_FILE'? [y/N]: " SAVE_HASHES
SAVE_HASHES=${SAVE_HASHES,,} # normalize input to lowercase

# Conditionally save hashes to file
if [[ "$SAVE_HASHES" == "y" || "$SAVE_HASHES" == "yes" ]]; then
    mkdir -p "$HASH_FILE_DIR"

    # Ensure directory has restrictive permissions
    chmod 700 "$HASH_FILE_DIR"

    echo "$HASH_OUTPUT" > "$HASH_FILE"
    chmod 600 "$HASH_FILE"
    echo "Hashes saved to $HASH_FILE."
fi
