#!/bin/bash

COMMAND="$1"
TARGET_DIR="$2"
HASH_FILE_DIR="./hashes"

case "$COMMAND" in
    init)
        if ! mkdir -p "$HASH_FILE_DIR"; then
            echo "Failed to create directory: $HASH_FILE_DIR"
            exit 1
        fi
        chmod 700 "$HASH_FILE_DIR"
        echo "Initialized hashguard directory at $HASH_FILE_DIR"
        ;;
    generate)
        ./generate_hashes.sh "$TARGET_DIR" "$HASH_FILE_DIR"
        ;;
    verify)
        ./verify_hashes.sh "$HASH_FILE_DIR"
        ;;
    *)
        echo "Usage: hashguard.sh {init|generate <dir>|verify}"
        ;;
esac
