#!/bin/bash

HASH_FILE_DIR="./hashes"
HASH_FILE="$HASH_FILE_DIR/hashes.sha256"

if [[ ! -f "$HASH_FILE" ]]; then
    echo "Error: No hash file found at $HASH_FILE"
    exit 1
fi

cd "$HASH_FILE_DIR" || exit 1

# Run verification
if sha256sum -c hashes.sha256; then
    echo "All files verified successfully."
else
    echo "WARNING: Some files failed integrity check!"
fi
