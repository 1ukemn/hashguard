# HashGuard

A lightweight SHA-256 file integrity checker for Linux & macOS.

## Features

- SHA-256 hashing of a single file or all files in a specified directory
- Tamper-resistant hash storage with secure directory (700) and file (600) permissions
- Simple, clear CLI commands for initialization, generation, and verification

## Installation

Initialize secure hash directory:
```bash
./hashguard.sh init
```
Make the script executable:
```bash
chmod +x /path/to/hashguard/hashguard.sh
```

## Usage

Generate SHA-256 hashes for a file or directory:
```bash
./hashguard.sh generate /path/to/target
```
Verify stored hashes against current files:
```bash
./hashguard.sh verify
```